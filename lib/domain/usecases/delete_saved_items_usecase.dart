
import 'package:parking_number_manager/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_saved_items_usecase.g.dart';

@riverpod
class DeleteSavedItemsUsecase extends _$DeleteSavedItemsUsecase {
  @override
  DeleteSavedItemsUsecase build() => this;

  void invoke(List<int> items) {
    final repository = ref.read(savedNumbersRepositoryProvider);
    items.forEach((item) => 
      repository.delete(item)
    );
  }
}