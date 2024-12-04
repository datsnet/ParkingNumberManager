import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_number_manager/domain/states/main_screen_ui_state.dart';
import 'package:parking_number_manager/domain/viewmodels/main_screen_view_model.dart';

class MainView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(mainScreenViewModelProvider.notifier);
    final uiState = ref.watch(mainScreenViewModelProvider);
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: 20,
        children: [
          Center(
            child: uiState.imageState?.path == null
                ? Text('画像を選択してください')
                : Image.file(File(uiState.imageState!.path!)),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('画像解析開始'),
              onPressed: uiState.imageState?.path != null
                  ? () {
                      viewModel.recognizeFromImage();
                    }
                  : null,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: TextEditingController(
                          text: uiState.imageState?.recognizedNumber),
                      onFieldSubmitted: (value) {
                        print("submit!!!");
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        // 入力値を受け取る
                        if (value == null || value.isEmpty) {
                          return '値を入力してください';
                        }
                        return null;
                      },
                    )),
                    ElevatedButton(
                        onPressed: () {
                          if (uiState.imageState?.recognizedNumber != null) {
                            viewModel
                                .save(uiState.imageState!.recognizedNumber!);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('${uiState.imageState!.recognizedNumber!}が保存されました')),
                            );
                          }
                        },
                        child: Text("保存"))
                  ],
                ),
                SizedBox(height: 10),
                if (uiState.imageState?.recognizedNumbers?.isNotEmpty == true)
                  Text("候補が以下の通りあります。タップするとテキストフィールドに反映されます")
                else
                  SizedBox.shrink(),
                SizedBox(height: 10),
                Wrap(
                    alignment: WrapAlignment.spaceAround,
                    spacing: 20,
                    runSpacing: 12,
                    children: uiState.imageState?.recognizedNumbers
                            ?.map((value) => OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.brown,
                                  side: BorderSide(
                                      color: Colors.white, width: 2), // 枠線の設定
                                ),
                                child: Text(value),
                                onPressed: () =>
                                    {viewModel.setRecognizedText(value)}))
                            .toList() ??
                        List.empty())
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
