// enum ColumnType {
//   integer,
//   real,
//   text,
//   blob,
// }

class ColumnType {
  /// Database name
  final String database;
  
  /// Type name
  final String name;

  /// The version it works with
  final String sinceVersion;

  /// The version it doesnt work anymore
  final String deprecatedVersion;
  
  const ColumnType({
    required this.database,
    required this.name,
    required this.sinceVersion,
    required this.deprecatedVersion,
  });
}