import 'package:realm/realm.dart';

import '../infrastracture/db/counter.dart' as db;

class Counter {
  final int value;

  Counter(this.value);

  Counter increment() {
    return Counter(value + 1);
  }
}

final counterRepository = CounterRepository();

class CounterRepository {
  late Realm _realm;

  CounterRepository() {
    var config = Configuration.local([db.Counter.schema],
        initialDataCallback: _addInitialData);
    _realm = Realm(config);
  }

  Counter update(Counter counter) {
    // Realmの処理
    // DBからカウンターモデルを取得
    final counterModel = _realm.all<db.Counter>().first;
    // カウンターモデルを更新
    _realm.write(() {
      counterModel.number = counter.value;
    });
    // 再度取得し直す
    final updatedCounterModel = _realm.all<db.Counter>().first;

    return Counter(updatedCounterModel.number);
  }

  Counter get() {
    final counterModel = _realm.all<db.Counter>().first;
    return Counter(counterModel.number);
  }
}

// 初期データを追加
void _addInitialData(Realm realm) {
  realm.add(db.Counter(0));
}
