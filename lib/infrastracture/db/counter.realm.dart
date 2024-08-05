// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Counter extends _Counter with RealmEntity, RealmObjectBase, RealmObject {
  Counter(
    int number,
  ) {
    RealmObjectBase.set(this, 'number', number);
  }

  Counter._();

  @override
  int get number => RealmObjectBase.get<int>(this, 'number') as int;
  @override
  set number(int value) => RealmObjectBase.set(this, 'number', value);

  @override
  Stream<RealmObjectChanges<Counter>> get changes =>
      RealmObjectBase.getChanges<Counter>(this);

  @override
  Stream<RealmObjectChanges<Counter>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Counter>(this, keyPaths);

  @override
  Counter freeze() => RealmObjectBase.freezeObject<Counter>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'number': number.toEJson(),
    };
  }

  static EJsonValue _toEJson(Counter value) => value.toEJson();
  static Counter _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'number': EJsonValue number,
      } =>
        Counter(
          fromEJson(number),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Counter._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Counter, 'Counter', [
      SchemaProperty('number', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
