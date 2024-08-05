import 'package:realm/realm.dart';

part 'counter.realm.dart';

@RealmModel()
class _Counter {
  late int number;
}
