import 'package:json_ex/library.dart';

import 'EntityColumnInfo.dart';

class RowInfo<T> {
  final Map<EntityColumnInfo<T>, Object?> args;
  const RowInfo(
    this.args,
  );

  JsonObject toMap() {
    return args.map((key, value) => new MapEntry(key.name, value));
  }

  List<Object?> toList(Iterable<EntityColumnInfo<T>> columns) {
    return columns.map((e) => args[e]).toList();
  }
}