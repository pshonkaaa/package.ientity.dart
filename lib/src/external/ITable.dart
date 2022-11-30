import 'package:meta/meta.dart';

import 'EntityColumnInfo.dart';

abstract class ITable<PARAM> {
  final String name;
  final List<EntityColumnInfo<PARAM>> _columns;
  late final EntityColumnInfo<PARAM> _primaryKey;

  Iterable<EntityColumnInfo<PARAM>> get columns => _columns;

  EntityColumnInfo<PARAM> get primaryKey => _primaryKey;

  ITable({
    required this.name,
    required List<EntityColumnInfo<PARAM>> columns,
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
