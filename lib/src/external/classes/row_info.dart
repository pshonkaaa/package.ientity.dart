import 'entity_column_info.dart';

class RowInfo {
  const RowInfo(
    this.args,
  );
  
  final Map<EntityColumnInfo, Object?> args;

  Map<String, dynamic> toMap() {
    return args.map((key, value) => MapEntry(key.name, value));
  }

  List<Object?> toList(Iterable<EntityColumnInfo> columns) {
    return columns.map((e) => args[e]).toList();
  }
}