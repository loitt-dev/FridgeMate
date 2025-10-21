/// Dependency Injection Container
///
/// This file sets up all dependencies using GetIt service locator.
/// All modules are wired together here without creating dependency cycles.
///
/// Registration Order:
/// 1. Infrastructure (network, local_storage, config)
/// 2. Data Sources (local, remote)
/// 3. Repositories (implementations)
/// 4. Use Cases

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Core - Domain (interfaces only)
import 'package:domain/repositories/storage_repository.dart';
import 'package:domain/repositories/recipe_repository.dart';
import 'package:domain/use_cases/storage/get_storage_items_use_case.dart';
import 'package:domain/use_cases/storage/add_item_to_storage_use_case.dart';
import 'package:domain/use_cases/storage/update_item_use_case.dart';
import 'package:domain/use_cases/storage/delete_item_use_case.dart';
import 'package:domain/use_cases/storage/get_expiring_items_use_case.dart';
import 'package:domain/use_cases/storage/search_items_use_case.dart';
import 'package:domain/use_cases/recipe/get_suggested_recipes_use_case.dart';
import 'package:domain/use_cases/recipe/get_recipes_by_ingredients_use_case.dart';
import 'package:domain/use_cases/recipe/search_recipes_use_case.dart';

// Core - Data (implementations)
import 'package:data/repositories/storage_repository_impl.dart';
import 'package:data/repositories/recipe_repository_impl.dart';
import 'package:data/data_sources/local/storage_local_data_source.dart';
import 'package:data/data_sources/local/recipe_local_data_source.dart';
import 'package:data/data_sources/remote/storage_remote_data_source.dart';
import 'package:data/data_sources/remote/recipe_remote_data_source.dart';

// Infrastructure
import 'package:network/dio_client.dart';
import 'package:local_storage/database/app_database.dart';
import 'package:local_storage/preferences/app_preferences.dart';
import 'package:config/app_config.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // ============================================
  // 1. Infrastructure Layer
  // ============================================

  // Config
  getIt.registerLazySingleton<AppConfig>(() => AppConfig.fromEnvironment());

  // Network
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(baseUrl: getIt<AppConfig>().apiBaseUrl),
  );

  // Local Storage
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(prefs));

  // ============================================
  // 2. Data Sources
  // ============================================

  // Local Data Sources
  getIt.registerLazySingleton<StorageLocalDataSource>(
    () => StorageLocalDataSource(getIt<AppDatabase>()),
  );

  getIt.registerLazySingleton<RecipeLocalDataSource>(
    () => RecipeLocalDataSource(getIt<AppDatabase>()),
  );

  // ============================================
  // 3. Repositories (Register as Interface!)
  // ============================================

  getIt.registerLazySingleton<StorageRepository>(
    () => StorageRepositoryImpl(
      localDataSource: getIt<StorageLocalDataSource>(),
      remoteDataSource: getIt<StorageRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(
      localDataSource: getIt<RecipeLocalDataSource>(),
      remoteDataSource: getIt<RecipeRemoteDataSource>(),
    ),
  );

  // ============================================
  // 4. Use Cases
  // ============================================

  // Storage Use Cases
  getIt.registerLazySingleton<GetStorageItemsUseCase>(
    () => GetStorageItemsUseCase(getIt<StorageRepository>()),
  );

  getIt.registerLazySingleton<AddItemToStorageUseCase>(
    () => AddItemToStorageUseCase(getIt<StorageRepository>()),
  );

  getIt.registerLazySingleton<UpdateItemUseCase>(
    () => UpdateItemUseCase(getIt<StorageRepository>()),
  );

  getIt.registerLazySingleton<DeleteItemUseCase>(
    () => DeleteItemUseCase(getIt<StorageRepository>()),
  );

  getIt.registerLazySingleton<GetExpiringItemsUseCase>(
    () => GetExpiringItemsUseCase(getIt<StorageRepository>()),
  );

  getIt.registerLazySingleton<SearchItemsUseCase>(
    () => SearchItemsUseCase(getIt<StorageRepository>()),
  );

  // Recipe Use Cases
  getIt.registerLazySingleton<GetSuggestedRecipesUseCase>(
    () => GetSuggestedRecipesUseCase(getIt<RecipeRepository>()),
  );

  getIt.registerLazySingleton<GetRecipesByIngredientsUseCase>(
    () => GetRecipesByIngredientsUseCase(getIt<RecipeRepository>()),
  );

  getIt.registerLazySingleton<SearchRecipesUseCase>(
    () => SearchRecipesUseCase(getIt<RecipeRepository>()),
  );
}
