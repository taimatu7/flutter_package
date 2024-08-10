import 'package:flutter/material.dart';
import 'package:flutter_package/presentation/view_model/holiday_notifier.dart';
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
    final holiday = ref.watch(holidayNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '今年はじめの祝日',
            ),
            Text(
              '${holiday?.countryCode ?? ''} : ${holiday?.date ?? ''}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(holidayNotifierProvider.notifier).fetch,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
