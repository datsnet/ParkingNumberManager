import 'package:parking_number_manager/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_item_usecase.g.dart';
@riverpod
class SaveItemUsecase extends _$SaveItemUsecase {
  
  @override
  SaveItemUsecase build() => this;

  Future<void> invoke(String numberText, String? location) {
    final repository = ref.read(savedNumbersRepositoryProvider);
    return repository.save(numberText, location);
  }
}