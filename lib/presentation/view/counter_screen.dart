import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/count_notifier.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    // final count = ref.watch(countNotifierProvider);
    // 非同期処理の結果を取得
    final value = ref.watch(countProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: value.when(
        data: (data) {
          // 非同期処理の結果を表示
          return Text(data.toString());
        },
        error: (error, stackTrace) {
          // エラーが発生した場合
          return Text(error.toString());
        },
        loading: () {
          // ローディング中
          return const CircularProgressIndicator();
        },
        skipLoadingOnRefresh: false,
      ),
      floatingActionButton: FloatingActionButton(
        // tap時に非同期処理を実行
        onPressed: () => ref.invalidate(countProvider),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
