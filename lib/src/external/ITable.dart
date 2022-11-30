import 'package:meta/meta.dart';

import 'EntityColumnInfo.dart';

abstract class ITable {
  final String name;
  final List<EntityColumnInfo> _columns;
  late final EntityColumnInfo _primaryKey;

  Iterable<EntityColumnInfo> get columns => _columns;

  EntityColumnInfo get primaryKey => _primaryKey;

  ITable({
    required this.name,
    required List<EntityColumnInfo> columns,
  }) : _columns = columns {
    _primaryKey = columns.firstWhere((e) => e.isPrimaryKey);
  }
  
  @mustCallSuper
  Future<void> initState() async {
  }

  @mustCallSuper
  Future<void> dispose() async {
  }
}
