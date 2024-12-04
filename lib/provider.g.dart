// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityHash() => r'c90b5d6502e5e4c31a2fa8c974683171cad8f38f';

/// これにより、`activityProvider`という名前のproviderが作成され、
/// この関数の結果をキャッシュします。
///
/// Copied from [activity].
@ProviderFor(activity)
final activityProvider = AutoDisposeFutureProvider<Activity>.internal(
  activity,
  name: r'activityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActivityRef = AutoDisposeFutureProviderRef<Activity>;
String _$appDatabaseHash() => r'8c69eb46d45206533c176c88a926608e79ca927d';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
String _$savedNumbersRepositoryHash() =>
    r'84bb976a308195ddf092c09a31869df17500e8ee';

/// See also [savedNumbersRepository].
@ProviderFor(savedNumbersRepository)
final savedNumbersRepositoryProvider =
    Provider<SavedNumbersRepository>.internal(
  savedNumbersRepository,
  name: r'savedNumbersRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedNumbersRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavedNumbersRepositoryRef = ProviderRef<SavedNumbersRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
