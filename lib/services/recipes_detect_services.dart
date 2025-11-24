import 'dart:io';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class RecipeDetectService {


  final _labeler = ImageLabeler(
    options: ImageLabelerOptions(
      confidenceThreshold: 0.5,
    ),
  );


  Future<String?> detectImageCategory(File imageFile) async {
    try {
      final inputImage = InputImage.fromFile(imageFile);
      final labels = await _labeler.processImage(inputImage);

      if (labels.isEmpty) return null;
      labels.sort((a, b) => b.confidence.compareTo(a.confidence));
      final topLabel = labels.first;
      print(
          "Detected: ${topLabel.label}  | Confidence: ${topLabel.confidence}");
      return topLabel.label;
    } catch (e) {
      print("ML Error: $e");
      return null;
    }
  }

  // Future<String?> detectFoodType(File imageFile) async {
  //   final inputImage = InputImage.fromFile(imageFile);
  //   final List<ImageLabel> labels = await _labeler.processImage(inputImage);
  //
  //   if (labels.isEmpty) return null;
  //
  //   // Sort by confidence
  //   labels.sort((a, b) => b.confidence.compareTo(a.confidence));
  //
  //   // Filter out generic labels
  //   const genericLabels = {"food", "meal", "dish", "cuisine"};
  //   final specificLabels = labels
  //       .where((l) => !genericLabels.contains(l.label.toLowerCase()))
  //       .toList();
  //
  //   // Return top specific label
  //   if (specificLabels.isNotEmpty) {
  //     return specificLabels.first.label;
  //   } else {
  //     return labels.first.label; // fallback to generic if nothing specific
  //   }
  // }



  Future<List<String>> detectEntities(File imageFile) async {
    try {
      final inputImage = InputImage.fromFile(imageFile);
      final labels = await _labeler.processImage(inputImage);

      if (labels.isEmpty) return [];

      // Convert labels to text list sorted by confidence
      final entities = labels
          .map((e) => e.label.toLowerCase())
          .toList();

      print("Detected Entities: $entities");

      return entities;
    } catch (e) {
      print("ML Error: $e");
      return [];
    }
  }

  Future<List<String>> detectFoodIngredients(File imageFile) async {
    try {
      final inputImage = InputImage.fromFile(imageFile);
      final labels = await _labeler.processImage(inputImage);

      if (labels.isEmpty) return [];

      const foodKeywords = {
        "food",
        "dish",
        "meal",
        "cuisine",
        "vegetable",
        "fruit",
        "bread",
        "meat",
        "egg",
        "rice",
        "pasta",
        "cake",
        "dessert",
        "snack",
        "sauce",
        "salad",
        "cookie",
        "pizza",
        "burger",
        "sandwich"
      };

      List<String> detected = [];

      for (final label in labels) {
        final text = label.label.toLowerCase();
        if (foodKeywords.contains(text)) {
          detected.add(text);
        }
      }

      print("Food Ingredients Found: $detected");

      return detected;
    } catch (e) {
      print("ML Error: $e");
      return [];
    }
  }

  Future<List<String>> autoExtractIngredients(File imageFile) async {
    try {
      final inputImage = InputImage.fromFile(imageFile);
      final labels = await _labeler.processImage(inputImage);

      if (labels.isEmpty) return [];

      // Remove generic non-ingredient words
      const genericWords = {"food", "cuisine", "meal", "dish", "ingredient"};

      // Pick only meaningful labels with high confidence
      final ingredients = labels
          .where((label) => label.confidence > 0.60) // strong detection only
          .map((label) => label.label.toLowerCase())
          .where((label) => !genericWords.contains(label)) // remove generic
          .toList();

      return ingredients;
    } catch (e) {
      print("ML Error: $e");
      return [];
    }
  }


}