import 'dart:convert' as dart;

import 'package:meta/meta.dart';

import '../ChangedColumn.dart';
import '../EntityColumnInfo.dart';
import '../ERequestType.dart';
import '../RowInfo.dart';

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