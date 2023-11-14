import 'package:true_core/library.dart';

import '../entity_column_info.dart';
import '../interfaces/table.dart';

abstract class BaseTable extends BaseAsyncStateable implements ITable {
  BaseTable({
    required this.name,
    required List<EntityColumnInfo> columns,
  }) : _columns = columns {
    _primaryKey = columns.firstWhere((e) => e.isPrimaryKey);
  }

  @override
  final String name;

  @override
  Iterable<EntityColumnInfo> get columns => _columns;

  @override
  EntityColumnInfo get primaryKey => _primaryKey;

  final List<EntityColumnInfo> _columns;

  late final EntityColumnInfo _primaryKey;


  @override
  String toSql() {
    final sb = StringBuffer();
    sb.write("CREATE TABLE $name");

    {      
      sb.write(" (");
      sb.write(_columns.map((e) => e.toSql()).join(","));
      sb.write(")");
    } return sb.toString();
  }
}
