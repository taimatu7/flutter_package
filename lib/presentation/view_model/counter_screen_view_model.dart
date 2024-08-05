import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/counter.dart';

final counterScreenViewModelProvider =
    StateNotifierProvider<_CounterScreenViewModel, Counter>((ref) {
  final viewModel = _CounterScreenViewModel();
  // 初期化処理
  viewModel.get();
  return viewModel;
});

class _CounterScreenViewModel extends StateNotifier<Counter> {
  _CounterScreenViewModel() : super(Counter(0));

  void increment() {
    final updatedCounter = counterRepository.update(state.increment());
    state = updatedCounter;
  }

  void get() {
    final counter = counterRepository.get();
    state = counter;
  }
}
