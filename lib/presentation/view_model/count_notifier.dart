import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/count.dart';

part 'count_notifier.g.dart';

@riverpod
class CountNotifier extends _$CountNotifier {
  @override
  Count build() => Count(0);

  void increment() {
    state = state.increment();
  }
}
