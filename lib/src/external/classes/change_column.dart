import 'entity_column_info.dart';

class ChangedColumn<T> {
  ChangedColumn(
    this.column,
    this.oldValue,
    this.newValue,
  );

  final EntityColumnInfo<T> column;

  final T oldValue;

  final T newValue;
}