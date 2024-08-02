import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockquote/view/ui/bloc/search_notifier.dart';
import 'package:stockquote/view/ui/bloc/search_state.dart';

import '../../../../data/di/dependency_manager.dart';

final StockProvider =
    StateNotifierProvider.autoDispose<StockNotifier, StockState>(
  (ref) => StockNotifier(stockRepository),
);
