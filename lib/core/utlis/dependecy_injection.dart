import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:quote_generator_mobile_app/core/services/api_service.dart';
import 'package:quote_generator_mobile_app/core/services/cache_service.dart';
import 'package:quote_generator_mobile_app/features/favorites/data/data_sources/favorites_local_data_source.dart';
import 'package:quote_generator_mobile_app/features/favorites/data/data_sources/favorites_remote_data_source.dart';
import 'package:quote_generator_mobile_app/features/favorites/data/repositories/favorites_repo_impl.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/repositories/favorites_repo.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/usecases/get_all_favorites_usecase.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/usecases/remove_quote_usecase.dart';
import 'package:quote_generator_mobile_app/features/favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';
import 'package:quote_generator_mobile_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:quote_generator_mobile_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:quote_generator_mobile_app/features/home/domain/repositories/home_repo.dart';
import 'package:quote_generator_mobile_app/features/home/domain/usecases/get_random_quote_usecase.dart';
import 'package:quote_generator_mobile_app/features/favorites/domain/usecases/store_quote_usecase.dart';
import 'package:quote_generator_mobile_app/features/home/presentation/controllers/random_quote_cubit.dart/random_quote_cubit.dart';

final GetIt sl = GetIt.I;

void setupLocator() {
  // =================== Services =================== //

  // sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<http.Client>(http.Client());
  sl.registerSingleton<ApiService>(ApiServiceImpl(client: sl.get<http.Client>()));
  sl.registerSingleton<CacheService>(CacheServiceImpl());

  // =================== Data Sources =================== //

  sl.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImpl(apiService: sl.get<ApiService>()),
  );
  sl.registerSingleton<FavoritesRemoteDataSource>(
    FavoritesRemoteDataSourceImpl(apiService: sl.get<ApiService>()),
  );
  sl.registerSingleton<FavoritesLocalDataSource>(
    FavoritesLocalDataSourceImpl(cacheService: sl.get<CacheService>()),
  );

  // =================== Repositories =================== //

  sl.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      remoteDataSource: sl.get<HomeRemoteDataSource>(),
    ),
  );
  sl.registerSingleton<FavoritesRepo>(
    FavoritesRepoImpl(
      favoritesLocalDataSource: sl.get<FavoritesLocalDataSource>(),
      favoritesRemoteDataSource: sl.get<FavoritesRemoteDataSource>(),
    ),
  );

  // =================== UseCases =================== //

  sl.registerSingleton<GetRandomQuoteUseCase>(
    GetRandomQuoteUseCase(
      homeRepo: sl.get<HomeRepo>(),
    ),
  );
  sl.registerSingleton<StoreQuoteUseCase>(
    StoreQuoteUseCase(
      favoritesRepo: sl.get<FavoritesRepo>(),
    ),
  );
  sl.registerSingleton<GetAllFavoritesUseCase>(
    GetAllFavoritesUseCase(
      favoritesRepo: sl.get<FavoritesRepo>(),
    ),
  );
  sl.registerSingleton<RemoveQuoteUseCase>(
    RemoveQuoteUseCase(
      favoritesRepo: sl.get<FavoritesRepo>(),
    ),
  );

  // =================== Cubits =================== //

  sl.registerFactory<RandomQuoteCubit>(
    () => RandomQuoteCubit(
      getRandomQuoteUseCase: sl.get<GetRandomQuoteUseCase>(),      
    ),
  );
  sl.registerFactory<FavoritesCubit>(
    () => FavoritesCubit(
      getAllFavoritesUseCase: sl.get<GetAllFavoritesUseCase>(),
      removeQuoteUseCase: sl.get<RemoveQuoteUseCase>(),
      storeQuoteUseCase: sl.get<StoreQuoteUseCase>(),
    ),
  );
}
