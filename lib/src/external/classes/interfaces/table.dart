import 'package:true_core/library.dart';

import '../entity_column_info.dart';
import 'to_sql_convertable.dart';

abstract class ITable extends BaseAsyncStateable implements IToSqlConvertable {
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
