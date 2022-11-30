class ColumnType {
  static const NONE = ColumnType(
    database: "none",
    name: "none",
    sinceVersion: "none",
    deprecatedVersion: "none",
  );

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