import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implementation.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<HomeRepoImplementatin>(
      HomeRepoImplementatin(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImplementation>(
      SearchRepoImplementation(getIt.get<ApiService>()));
}
