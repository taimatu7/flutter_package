import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterScreen extends HookConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // 画面で状態管理したい変数定義
    final count = useState(0);
    // 初回のbuildかどうかを判定する変数
    final isFirstRun = useState(true);

    // initStateの代わり
    useEffect(() {
      print("初回処理");
      return null;
      // 初回のみの場合は空の配列を返す
    }, []);

    // 値が変更された場合の処理
    useEffect(() {
      if (isFirstRun.value) {
        isFirstRun.value = false;
        return null;
      }
      print("countが変更されました");
      return null;
      // countが変更された場合の処理
    }, [count.value]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              count.value.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
