import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:parking_number_manager/data/db/saved_items.dart';
import 'package:parking_number_manager/data/repository/saved_numbers_repository.dart.dart';
import 'package:parking_number_manager/domain/usecases/save_item_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'activity.dart';

part 'provider.g.dart';

@riverpod
Future<Activity> activity(Ref ref) async {
  final response = await http.get(Uri.https('boredapi.com', '/api/activity'));  
  final json = jsonDecode(response.body) as Map<String, dynamic>;  
  return Activity.fromJson(json);
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}

@Riverpod(keepAlive: true)
SavedNumbersRepository savedNumbersRepository(Ref ref) {
  return SavedNumbersRepository(ref.read(appDatabaseProvider));
}