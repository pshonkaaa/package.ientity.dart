import 'ColumnInfo.dart';
import 'ColumnType.dart';

class EntityColumnInfo<T> extends ColumnInfo {
  final T Function(T value)? transformer;
  const EntityColumnInfo(
    String name,
    ColumnType type, {
      this.transformer,
      super.defaultValue,
      super.isPrimaryKey = false,
      super.isAutoIncrement = false,
      super.isNullable = null is T,
      super.extra,
  }) : super(
    name: name,
    type: type,
  );

  @override
  String toString() => name;
}