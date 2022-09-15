import 'ColumnType.dart';

class ColumnInfo<PARAM> {
  /// Must be an Enum to be passed in IEntity<PARAM>
  final PARAM param;
  final String name;
  final ColumnType type;
  final bool primaryKey;
  const ColumnInfo(
    this.param,
    this.name,
    this.type, {
      this.primaryKey = false,
  });


  @override
  String toString() => name;
}