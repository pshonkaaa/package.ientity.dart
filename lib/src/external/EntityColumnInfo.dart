import 'ColumnInfo.dart';
import 'ColumnType.dart';

class EntityColumnInfo<T> extends ColumnInfo {
  const EntityColumnInfo(
    String name,
    ColumnType type, {
      super.defaultValue,
      super.isPrimaryKey = false,
      super.isAutoIncrement = false,
      super.isNullable = true,
      super.extra,
  }) : super(
    name: name,
    type: type,
  );

  @override
  String toString() => name;
}