import 'ColumnType.dart';

class ColumnInfo {
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
}