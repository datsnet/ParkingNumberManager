import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parking_number_manager/data/db/saved_items.dart';
import 'package:parking_number_manager/domain/models/image_state.dart';

part 'main_screen_ui_state.freezed.dart';

@freezed
class MainScreenUiState with _$MainScreenUiState {
  const factory MainScreenUiState({
    required ImageState? imageState,
    @Default(false) isLoading,
    required Loading? loading,
    @Default(0) currentPageIndex,
    @Default([]) List<SavedItem> savedList,
  }) = _MainScreenUiState;
}

enum Loading {
  start,
  sequence1,
  sequence2,
  sequence3,
  sequence4,
  complete,
}

extension LoadingExtensions on Loading {
  String get name {
    switch(this) {
      case Loading.start:
       return "画像解析を開始しています…";
       case Loading.sequence1:
        return "画像を読み込んでいます…";
       case Loading.sequence2:
        return "特徴を抽出中…";
       case Loading.sequence3:
        return "AIモデルを適用中…";
       case Loading.sequence4:
        return "結果をまとめています…";
       case Loading.complete:
        return "画像解析が完了しました！";                                        
    }
  }
}