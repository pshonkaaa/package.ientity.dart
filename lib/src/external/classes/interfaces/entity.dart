import '../change_column.dart';
import '../entity_column_info.dart';
import '../../enums.dart';
import '../row_info.dart';

abstract class IEntity {
  int get id;

  /// Returns false if values have changed
  bool isIdentical(
    IEntity entity, {
      List<EntityColumnInfo> include = const [],
      List<EntityColumnInfo> exclude = const [],
      List<ChangedColumn>? differences,
  });
    
  RowInfo toTable({
    required ERequestType requestType,
    List<EntityColumnInfo> include = const [],
    List<EntityColumnInfo> exclude = const [],
  });
}