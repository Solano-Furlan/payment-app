// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i8;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:local_auth/local_auth.dart' as _i5;
import 'package:package_info_plus/package_info_plus.dart' as _i4;
import 'package:payment_app/core/dependencies/modules/features/authentication.module.dart'
    as _i14;
import 'package:payment_app/core/dependencies/modules/packages/event_bus.module.dart'
    as _i15;
import 'package:payment_app/core/dependencies/modules/packages/http_client.module.dart'
    as _i16;
import 'package:payment_app/core/dependencies/modules/packages/navigation.module.dart'
    as _i17;
import 'package:payment_app/core/dependencies/modules/packages/package_info.module.dart'
    as _i13;
import 'package:payment_app/core/dependencies/modules/packages/storage.module.dart'
    as _i12;
import 'package:payment_app/core/event_bus/event_bus.service.dart' as _i6;
import 'package:payment_app/core/navigation/services/dialogs.service.dart'
    as _i10;
import 'package:payment_app/core/navigation/services/navigation.service.dart'
    as _i9;
import 'package:payment_app/features/authentication/data/authentication.repository.dart'
    as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final storageModule = _$StorageModule();
  final packageInfoModule = _$PackageInfoModule();
  final authenticationModule = _$AuthenticationModule();
  final eventBusModule = _$EventBusModule();
  final httpClientModule = _$HttpClientModule();
  final navigationModule = _$NavigationModule();
  await gh.singletonAsync<_i3.HiveInterface>(
    () => storageModule.hiveInterface(),
    preResolve: true,
  );
  await gh.singletonAsync<_i4.PackageInfo>(
    () => packageInfoModule.packageInfo(),
    preResolve: true,
  );
  gh.lazySingleton<_i5.LocalAuthentication>(
      () => authenticationModule.localAuthentication());
  gh.lazySingleton<_i6.EventBus>(() => eventBusModule.eventBus());
  gh.lazySingleton<_i7.Dio>(() => httpClientModule.appRouter());
  gh.lazySingleton<_i8.GoRouter>(() => navigationModule.appRouter());
  gh.lazySingleton<_i9.AppNavigationService>(
      () => navigationModule.appNavigationService(gh<_i8.GoRouter>()));
  gh.lazySingleton<_i10.AppDialogsService>(
      () => navigationModule.appDialogsService(gh<_i8.GoRouter>()));
  gh.lazySingleton<_i11.AuthenticationRepository>(
      () => authenticationModule.authenticationRepository(
            gh<_i5.LocalAuthentication>(),
            gh<_i3.HiveInterface>(),
          ));
  return getIt;
}

class _$StorageModule extends _i12.StorageModule {}

class _$PackageInfoModule extends _i13.PackageInfoModule {}

class _$AuthenticationModule extends _i14.AuthenticationModule {}

class _$EventBusModule extends _i15.EventBusModule {}

class _$HttpClientModule extends _i16.HttpClientModule {}

class _$NavigationModule extends _i17.NavigationModule {}
