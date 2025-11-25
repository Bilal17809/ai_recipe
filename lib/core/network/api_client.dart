import 'dart:convert';
import 'dart:io';

import 'package:ai_recipe/core/config/enviroment_config.dart';
import 'package:http/http.dart' as http;

import '../../data/models/recipe.dart';
import '../../data/models/recipes_model.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => "ApiException: $message (code: $statusCode)";
}

class ApiClient {
  final String misteralBaseUrl;
  ApiClient() : misteralBaseUrl = EnvironmentConfig.misteralApiBaseUrl;
  //
  // Future<RecipeModel> getRecipeFromImage(
  //   String imagePath,
  //   String endPoint,
  // ) async {
  //   final url = Uri.parse("$baseUrl?apiKey=$endPoint");
  //   final request = http.MultipartRequest("POST", url)
  //     ..files.add(await http.MultipartFile.fromPath("file", imagePath));
  //
  //   final response = await request.send();
  //   if (response.statusCode < 200 || response.statusCode >= 300) {
  //     final errorBody = await response.stream.bytesToString();
  //     print("Response error body: $errorBody"); // Important for debug
  //     throw ApiException("Request failed", statusCode: response.statusCode);
  //   }
  //   final body = await response.stream.bytesToString();
  //   final decoded = jsonDecode(body);
  //   return RecipeModel.fromJson(decoded);
  // }

  Future<RecipeModelForMistral> getRecipeFromMistral(
      String imagePath,
      String apiKey,
      ) async {
    final url = Uri.parse(misteralBaseUrl);
    final bytes = await File(imagePath).readAsBytes();
    final base64Image = base64Encode(bytes);

    final content = """
Identify the food in this image and return a structured JSON ONLY in this format:
{
  "title": "Dish Name",
  "cooking_time": "XX minutes",
  "servings": "X people",
  "ingredients": ["...", "..."],
  "steps": ["Step 1...", "Step 2..."]
}
Do NOT return any explanation or extra text.

Image: data:image/jpeg;base64,$base64Image
""";

    final body = {
      "model": "pixtral-12b-latest",
      "messages": [
        {
          "role": "user",
          "content": content,
        }
      ],
      "temperature": 0.2,
    };

    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    print("=== MISTRAL RESPONSE STATUS === ${response.statusCode}");
    print("=== MISTRAL RESPONSE BODY === ${response.body}");

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiException(
        "Mistral Request failed",
        statusCode: response.statusCode,
      );
    }

    final decoded = jsonDecode(response.body);
    String contentResponse = decoded["choices"][0]["message"]["content"];

    contentResponse = contentResponse.trim();
    if (contentResponse.startsWith("```json")) {
      contentResponse = contentResponse.replaceFirst("```json", "").trim();
    }
    if (contentResponse.startsWith("```")) {
      contentResponse = contentResponse.replaceFirst("```", "").trim();
    }
    if (contentResponse.endsWith("```")) {
      contentResponse = contentResponse.substring(0, contentResponse.length - 3).trim();
    }
    final recipeJson = jsonDecode(contentResponse);
    return RecipeModelForMistral.fromJson(recipeJson);
  }
}
