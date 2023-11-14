import 'package:true_core/library.dart';

import '../entity_column_info.dart';
import 'to_sql_convertable.dart';

abstract class ITable implements IAsyncStateable, IToSqlConvertable {

  String get name;

  Iterable<EntityColumnInfo> get columns;

  EntityColumnInfo get primaryKey;
}