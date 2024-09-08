import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_notifier.g.dart';

// @riverpod
// class CountNotifier extends _$CountNotifier {
//   @override
//   Count build() => Count(0);

//   void increment() {
//     state = state.increment();
//   }
// }

@riverpod
Future<int> count(CountRef ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return DateTime.now().second;
}
