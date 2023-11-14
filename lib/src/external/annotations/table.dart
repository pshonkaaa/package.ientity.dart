import 'package:json_annotation_ex/library.dart';

class TableAnnotation {
  // /// Ignore fields havent annotation `@AnTableColumn`
  // final bool ignoreFields;

  final String entityName;
  
  final Type? model;

  final List<Type> mixins;
  
  final String removePrefix;

  final FieldRename fieldRename;
  const TableAnnotation({
    required this.entityName,
    this.model,
    this.mixins = const [],
    // this.ignoreFields = false,
    this.removePrefix = "COLUMN_",
    this.fieldRename = FieldRename.camel,
  });
}