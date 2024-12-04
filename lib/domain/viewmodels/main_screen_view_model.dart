import 'dart:io';

import 'package:parking_number_manager/data/db/saved_items.dart';
import 'package:parking_number_manager/domain/models/image_state.dart';
import 'package:parking_number_manager/domain/states/main_screen_ui_state.dart';
import 'package:parking_number_manager/domain/usecases/delete_saved_items_usecase.dart';
import 'package:parking_number_manager/domain/usecases/get_items_usecase.dart';
import 'package:parking_number_manager/domain/usecases/get_picture_usecase.dart';
import 'package:parking_number_manager/domain/usecases/recognize_number_usecase.dart';
import 'package:parking_number_manager/domain/usecases/save_item_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_screen_view_model.g.dart';

@riverpod
class MainScreenViewModel extends _$MainScreenViewModel {
  
  @override
  MainScreenUiState build() {
    return const MainScreenUiState(imageState: null, loading: null);
  }

  void findImage({bool? isCamera}) async {
    final usecase = ref.read(getPictureUseCaseProvider);
    final result = await usecase.invoke(isCamera: isCamera);
    final newState = ImageState();
    newState.path = result;
    state = state.copyWith(imageState: newState, loading: null);
  }

  void recognizeFromImage() async {
    if (state.imageState?.path == null) {
      return;
    }

    state = state.copyWith(loading: Loading.start);

    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(loading: Loading.sequence1);
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(loading: Loading.sequence2);
    final usecase = ref.read(getRecognizeNumberUsecaseProvider);
    final result = await usecase.invoke(state.imageState!.path!);
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(loading: Loading.sequence3);
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(loading: Loading.sequence4);
    await Future.delayed(Duration(seconds: 4));
    print(result);

    state = state.copyWith(
        imageState: ImageState(
            path: state.imageState?.path,
            recognizedNumbers: result,
            recognizedNumber: result?.first),
        loading: Loading.complete);
  }

  void setCurrentPageIndex(int index) {
    state = state.copyWith(currentPageIndex: index, loading: null);
  }

  void consumeLoadingEvent() {
    state = state.copyWith(loading: null);
  }

  void setRecognizedText(String text) {
    state =
        state.copyWith(imageState: state.imageState?..recognizedNumber = text);
  }

  void save(String text) {
    final usecase = ref.read(saveItemUsecaseProvider);
    usecase.invoke(text, null);
  }

  void update(int id) {

  }

  void fetchItems() async {

    final usecase = ref.read(getItemsUseCaseProvider);
    await usecase.invoke().then((items) => {
      state = state.copyWith(savedList: items)
    });
  }

  void deleteItem(int id) {
    final usecase = ref.read(deleteSavedItemsUsecaseProvider);
    usecase.invoke([id]);
    final List<SavedItem> newList = List.from(state.savedList);
    newList.removeWhere((item) => item.id == id);
    state = state.copyWith(savedList: newList);
  }

  void deleteSelectedItems(List<int> items) {
    final usecase = ref.read(deleteSavedItemsUsecaseProvider);
    usecase.invoke(items);

    final List<SavedItem> newList = List.from(state.savedList);
    newList.removeWhere((item) => items.contains(item.id));
    state = state.copyWith(savedList: newList);
  }
}
