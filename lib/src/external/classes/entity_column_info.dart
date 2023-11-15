import 'column_info.dart';
import 'column_type.dart';

class EntityColumnInfo<T> extends ColumnInfo {
  const EntityColumnInfo(
    String name,
    ColumnType type, {
      this.transformer,
      super.defaultValue,
      super.isPrimaryKey = false,
      super.isAutoIncrement = false,
      super.isNullable = false,
      super.extra,
  }) : super(
    name: name,
    type: type,
  );
  
  final T Function(T value)? transformer;

  @override
  String toString()
    => name;
}