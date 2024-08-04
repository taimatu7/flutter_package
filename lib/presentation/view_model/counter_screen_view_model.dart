import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/counter.dart';

final counterScreenViewModelProvider =
    StateNotifierProvider<_CounterScreenViewModel, int>(
        (ref) => _CounterScreenViewModel());

class _CounterScreenViewModel extends StateNotifier<int> {
  final _counter = Counter();

  _CounterScreenViewModel() : super(0);

  void increment() {
    state = _counter.increment();
  }
}
