import 'ColumnType.dart';
import 'IToSqlConvertable.dart';

class ColumnInfo implements IToSqlConvertable {
  final String name;
  final ColumnType type;
  final String? defaultValue;
  final bool isPrimaryKey;
  final bool isAutoIncrement;
  final bool isNullable;
  final Map<String, dynamic>? extra;
  const ColumnInfo({
    required this.name,
    required this.type,
    required this.defaultValue,
    required this.isPrimaryKey,
    required this.isAutoIncrement,
    required this.isNullable,
    this.extra,
  });
  
  @override
  String toSql() {
    final sb = StringBuffer();
    sb.write("$name ${type.name}");
    if(!isNullable)
      sb.write(" NOT NULL");
    if(defaultValue != null)
      sb.write(" DEFAULT '$defaultValue'");
    if(isPrimaryKey)
      sb.write(" PRIMARY KEY");
    if(isAutoIncrement)
      sb.write(" AUTO_INCREMENT");
    return sb.toString();
  }
}