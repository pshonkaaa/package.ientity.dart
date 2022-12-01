import 'package:ientity/src/external/EntityColumnInfo.dart';

class ChangedColumn<T> {
  final EntityColumnInfo<T> column;
  final T oldValue;
  final T newValue;
  ChangedColumn(this.column, this.oldValue, this.newValue);
}