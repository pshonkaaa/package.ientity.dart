import 'package:json_ex/library.dart';

import 'EntityColumnInfo.dart';

class RowInfo {
  final Map<EntityColumnInfo, Object?> args;
  const RowInfo(
    this.args,
  );

  JsonObject toMap() {
    return args.map((key, value) => new MapEntry(key.name, value));
  }

  List<Object?> toList(Iterable<EntityColumnInfo> columns) {
    return columns.map((e) => args[e]).toList();
  }
}