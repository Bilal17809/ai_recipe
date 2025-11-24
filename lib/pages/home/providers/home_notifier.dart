// import 'dart:io';
// import 'dart:convert';
// import 'package:ai_recipe/core/common/enums/import_mode.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:http/http.dart' as http;
//
// import '/services/recipes_detect_services.dart';
// import 'home_state.dart';
//
// part 'home_notifier.g.dart';
//
// @riverpod
// class HomeNotifier extends _$HomeNotifier {
//   @override
//   HomeState build() => HomeState();
//
//   final ImagePicker _picker = ImagePicker();
//   final _recipeDetectService = RecipeDetectService();
//
//   final String mistralApiKey = "BchqN6jrCL0hraDexieotjFm0RkgUINY";
//
//   void selectedCamera() {
//     if (state.mode != ImportMode.camera) {
//       state = state.copyWith(mode: ImportMode.camera, selectedImage: null);
//     }
//   }
//
//   void selectUpload() {
//     if (state.mode != ImportMode.upload) {
//       state = state.copyWith(mode: ImportMode.upload, selectedImage: null);
//     }
//   }
//
//   // ---------------- CAMERA -------------------------
//   Future<void> pickFromCamera() async {
//     try {
//       state = state.copyWith(isLoading: true, selectedImage: null);
//       final image = await _picker.pickImage(
//         source: ImageSource.camera,
//         maxWidth: 1080,
//         imageQuality: 80,
//       );
//
//       if (image == null) {
//         state = state.copyWith(isLoading: false);
//         return;
//       }
//
//       final file = File(image.path);
//       final category = await _recipeDetectService.detectImageCategory(file);
//
//       if (category?.toLowerCase() == "food") {
//         await _getRecipeFromMistral(file);
//       } else {
//         Fluttertoast.showToast(msg: "Not a food image!");
//       }
//
//       state = state.copyWith(
//         selectedImage: file,
//         cate: category,
//         isLoading: false,
//       );
//     } catch (e) {
//       _handleError(e);
//     }
//   }
//
//   // ---------------- GALLERY -------------------------
//   Future<void> pickFromGallery() async {
//     try {
//       state = state.copyWith(isLoading: true, selectedImage: null);
//       final image = await _picker.pickImage(
//         source: ImageSource.gallery,
//         maxWidth: 1080,
//         imageQuality: 80,
//       );
//
//       if (image == null) {
//         state = state.copyWith(isLoading: false);
//         return;
//       }
//
//       final file = File(image.path);
//       final category = await _recipeDetectService.detectImageCategory(file);
//
//       if (category?.toLowerCase() == "food") {
//         await _getRecipeFromMistral(file);
//       } else {
//         Fluttertoast.showToast(msg: "Not a food image!");
//       }
//
//       state = state.copyWith(
//         selectedImage: file,
//         cate: category,
//         isLoading: false,
//       );
//     } catch (e) {
//       _handleError(e);
//     }
//   }
//
//   // ---------------- MISTRAL VISION API -------------------------
//   Future<void> _getRecipeFromMistral(File image) async {
//     try {
//       state = state.copyWith(isLoading: true, errorMessage: null);
//
//       final bytes = await image.readAsBytes();
//       final base64Image = base64Encode(bytes);
//
//       debugPrint("=== Encoding Image to Base64 (Size: ${base64Image.length}) ===");
//
//       final url = Uri.parse("https://api.mistral.ai/v1/chat/completions");
//
//       final String content = """
// Identify the food in this image and create a recipe with ingredients and clear step-by-step instructions.
//
// ![image](data:image/jpeg;base64,$base64Image)
// """;
//
//       final body = {
//         "model": "pixtral-large-latest",
//         "messages": [
//           {
//             "role": "user",
//             "content": content,
//           }
//         ]
//       };
//
//       // DEBUG — print request
//       debugPrint("=== MISTRAL REQUEST URL ===");
//       debugPrint(url.toString());
//       debugPrint("=== MISTRAL REQUEST BODY ===");
//       debugPrint(jsonEncode(body));
//
//       final response = await http.post(
//         url,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $mistralApiKey",
//         },
//         body: jsonEncode(body),
//       );
//
//       // DEBUG — print response status
//       debugPrint("=== MISTRAL RESPONSE STATUS ===");
//       debugPrint(response.statusCode.toString());
//
//       // DEBUG — print response body
//       debugPrint("=== MISTRAL RESPONSE BODY ===");
//       debugPrint(response.body);
//
//       if (response.statusCode != 200) {
//         debugPrint("=== Mistral API Error ===");
//         debugPrint(response.body);
//         Fluttertoast.showToast(msg: "AI request failed. Check console.");
//         return;
//       }
//
//       final decoded = jsonDecode(response.body);
//       final output = decoded["choices"][0]["message"]["content"];
//
//       debugPrint("=== MISTRAL GENERATED TEXT ===");
//       debugPrint(output);
//
//       final parsed = _parseRecipe(output);
//
//       state = state.copyWith(
//         recipeIngredients: parsed["ingredients"],
//         recipeSteps: parsed["steps"],
//         isLoading: false,
//       );
//
//       Fluttertoast.showToast(msg: "AI recipe generated!");
//     } catch (e, stack) {
//       debugPrint("=== MISTRAL EXCEPTION ===");
//       debugPrint(e.toString());
//       debugPrint(stack.toString());
//       state = state.copyWith(isLoading: false, errorMessage: e.toString());
//       Fluttertoast.showToast(msg: "Error occurred. Check console.");
//     }
//   }
//
//
//   // ----------- Parse Mistral Response (Markdown → List) ----------
//   Map<String, dynamic> _parseRecipe(String content) {
//     final lines = content.split("\n");
//
//     List<String> ingredients = [];
//     List<String> steps = [];
//
//     bool ing = false, step = false;
//
//     for (var line in lines) {
//       if (line.toLowerCase().contains("ingredients")) {
//         ing = true;
//         step = false;
//         continue;
//       }
//       if (line.toLowerCase().contains("steps") ||
//           line.toLowerCase().contains("instructions")) {
//         ing = false;
//         step = true;
//         continue;
//       }
//
//       if (ing && line.trim().startsWith("-")) {
//         ingredients.add(line.replaceFirst("-", "").trim());
//       }
//
//       if (step && (line.trim().startsWith("-") || line.contains("."))) {
//         steps.add(line.trim());
//       }
//     }
//
//     return {
//       "ingredients": ingredients,
//       "steps": steps,
//     };
//   }
//
//   // ----------- ERROR HANDLER ----------
//   void _handleError(e) {
//     print("ERROR: $e");
//     Fluttertoast.showToast(msg: "Error: $e");
//     state = state.copyWith(isLoading: false, errorMessage: e.toString());
//   }
// }
//
//
//



import 'dart:io';
import 'package:ai_recipe/core/common/enums/import_mode.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/dependency_injections/dependency_injection.dart';
import '/services/recipes_detect_services.dart';
import 'home_state.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    return HomeState();
  }
    final ImagePicker _picker = ImagePicker();
    final _recipeDetectService = RecipeDetectService();
    // final GetRecipeFromImage _getRecipeUseCase;

    // HomeNotifier({
    //   // required RecipeDetectService recipeDetectService,
    //   // required GetRecipeFromImage getRecipeUseCase,
    // })
    // :
    // _recipeDetectService=recipeDetectService,_getRecipeUseCase = getRecipeUseCase;

    void selectedCamera() {
      if (state.mode != ImportMode.camera) {
        state = state.copyWith(mode: ImportMode.camera, selectedImage: null);
      }
    }

    void selectUpload() {
      if (state.mode != ImportMode.upload) {
        state = state.copyWith(mode: ImportMode.upload, selectedImage: null);
      }
    }

    Future<void> pickFromCamera() async {
      try {
        state = state.copyWith(isLoading: true, selectedImage: null);
        await Future.delayed(Duration(seconds: 1));
        final image = await _picker.pickImage(
          source: ImageSource.camera,
          maxWidth: 1080,
          imageQuality: 80,
        );
        if (image != null) {
          final file = File(image.path);

          final category = await _recipeDetectService.detectImageCategory(file);
          List<String> ingredients = [];
          if (category?.toLowerCase() != "food") {
            Fluttertoast.showToast(msg: "Incificeience data ");
          } else {
            await _getRecipeFromImagePath(file.path);
          }
          state = state.copyWith(
            selectedImage: file,
            cate: category,
            ingredients: ingredients,
            isLoading: false,
          );
          // Fluttertoast.showToast(msg: "Your cat is: $category" );
          // Fluttertoast.showToast(msg: "Your food is: $ingredients" );
        } else {
          state = state.copyWith(isLoading: false);
        }
      } catch (e) {
        state = state.copyWith(isLoading: false, errorMessage: e.toString());
      }
    }

    Future<void> pickFromGallery() async {
      try {
        state = state.copyWith(isLoading: true, selectedImage: null);
        await Future.delayed(Duration(seconds: 1));
        final image = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 1080,
          imageQuality: 80,
        );
        if (image != null) {
          final file = File(image.path);

          final category = await _recipeDetectService.detectImageCategory(file);
          List<String> ingredients = [];
          if (category?.toLowerCase() != "food") {
            Fluttertoast.showToast(msg: "Incificeience data ");
          } else {
            await _getRecipeFromImagePath(file.path);
          }

          state = state.copyWith(
            selectedImage: file,
            cate: category,
            ingredients: ingredients,
            isLoading: false,
          );
          Fluttertoast.showToast(msg: "Your image category is:  $category");
        } else {
          state = state.copyWith(isLoading: false);
        }
      } catch (e) {
        state = state.copyWith(isLoading: false, errorMessage: e.toString());
      }
    }

  Future<void> _getRecipeFromImagePath(String imagePath) async {
    try {
      state = state.copyWith(isLoading: true, errorMessage: null);

      final useCase = ref.read(getRecipeFromMisteralProvider);
      final recipe = await useCase.call(imagePath);

      print("=== Recipe Data Received ===");
      print("Title: ${recipe.title}");
      print("Ingredients: ${recipe.ingredients}");
      print("Steps: ${recipe.steps}");
      print("============================");

      state = state.copyWith(
        recipeIngredients: recipe.ingredients,
        recipeSteps: recipe.steps,
        isLoading: false,
      );
    } catch (e, stackTrace) {
      print("=== ERROR in _getRecipeFromImagePath ===");
      print(e);
      print(stackTrace);
      print("========================================");

      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      Fluttertoast.showToast(msg: "Error fetching recipe: $e");
    }
  }

}

