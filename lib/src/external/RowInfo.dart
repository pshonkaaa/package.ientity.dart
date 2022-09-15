import 'package:json_ex/library.dart';

import 'ColumnInfo.dart';

class RowInfo<T> {
  final Map<ColumnInfo<T>, Object?> args;
  const RowInfo(
    this.args,
  );

  JsonObject toMap() {
    return args.map((key, value) => new MapEntry(key.name, value));
  }

  List<Object?> toList(Iterable<ColumnInfo<T>> columns) {
    return columns.map((e) => args[e]).toList();
  }
}