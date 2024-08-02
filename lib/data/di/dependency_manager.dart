import 'package:get_it/get_it.dart';

import '../repo/repo_impl/stock_repository_impl.dart';
import '../repo/stock_repository.dart';

final GetIt getIt = GetIt.instance;

void setUpDependencies() {
  getIt.registerSingleton<StockRepository>(StockRepositoryImpl());
}

final stockRepository = getIt.get<StockRepository>();
