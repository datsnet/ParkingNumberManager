
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parking_number_manager/data/db/saved_items.dart';
import 'package:parking_number_manager/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'get_items_usecase.g.dart';

@riverpod
class GetItemsUseCase extends _$GetItemsUseCase {

  @override
  GetItemsUseCase build() => this;

  Future<List<SavedItem>> invoke() async {
    final repository = ref.read(savedNumbersRepositoryProvider);
    final items = await repository.getItems();
    return items;
  }
}