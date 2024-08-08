import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/count.dart';

// 生成されるファイル名: count_notifier.riverpod.dart
part 'count_notifier.g.dart';

// @riverpodのアノテーションを付与
// countNotifierProviderというグローバル変数が自動で宣言される(生成ファイル内にあり)
@riverpod
class CountNotifier extends _$CountNotifier {
  // 保持する値の型を戻り値に指定
  // buildは初期値を返すようにする
  @override
  Count build() => Count(0);

  // 状態を更新する
  void increment() {
    state = state.increment();
  }
}
