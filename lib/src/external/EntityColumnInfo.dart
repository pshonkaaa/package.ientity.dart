import 'ColumnInfo.dart';
import 'ColumnType.dart';

class EntityColumnInfo<PARAM> extends ColumnInfo{
  /// Must be an Enum to be passed in IEntity<PARAM>
  final PARAM param;
  const EntityColumnInfo(
    this.param,
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