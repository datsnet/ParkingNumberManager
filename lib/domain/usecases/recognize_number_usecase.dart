import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

final getRecognizeNumberUsecaseProvider =
    Provider<RecognizeNumberUsecase>((ref) {
  return RecognizeNumberUsecase(ref: ref);
});

class RecognizeNumberUsecase {
  const RecognizeNumberUsecase({required Ref ref}) : _ref = ref;

  final Ref _ref;

  Future<List<String>?> invoke(String filePath) async {
    final InputImage inputImage = InputImage.fromFilePath(filePath);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    String text = recognizedText.text;
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
      // confidenceが一番高いものを返す
      List<TextBlock> result = List.from(recognizedText.blocks)
        ..sort((a, b) => (b.lines.first.confidence ?? 0)
            .compareTo((a.lines.first.confidence ?? 0)));
      textRecognizer.close();
      return Future.value(result.map((value) => value.text).toList());
    }
  }
}
