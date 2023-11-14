import 'dart:convert' as dart;

import 'package:meta/meta.dart';

import '../ChangedColumn.dart';
import '../ERequestType.dart';
import '../EntityColumnInfo.dart';
import '../RowInfo.dart';
import '../interfaces/entity.dart';

abstract class BaseEntity implements IEntity {
  static List<EntityColumnInfo> makeParamsList<EntityColumnInfo>(
    Iterable<EntityColumnInfo> allParams,
    Iterable<EntityColumnInfo> include,
    Iterable<EntityColumnInfo> exclude,
  ) {
    final out = <EntityColumnInfo>[];
    if(include.isEmpty)
      out.addAll(allParams);
    else out.addAll(include);

    if(exclude.isNotEmpty)
      out.removeWhere((e) => exclude.contains(e));
    return out;
  }

  // static List<EntityColumnInfo> makeColumnsFromParamsList<T>(
  //   Iterable<EntityColumnInfo> columns,
  //   Iterable<EntityColumnInfo> include,
  //   Iterable<EntityColumnInfo> exclude,
  // ) {
  //   final params = makeParamsList(columns.map((e) => e.param), include, exclude);
  //   return columns.where((e) => params.contains(e.param)).toList();
  // }

  static String? jsonEncode(Object? value) {
    if(value == null)
      return null;
    if(value is Map) {
      if(value is! Map<String, dynamic>) {
        value = value.map((key, value) => MapEntry(key.toString(), value));
      }
    } return dart.jsonEncode(value);
  }

  static Map<T, T2>? jsonDecode<T, T2>(String? value) {
    if(value == null)
      return null;
    Map json = dart.jsonDecode(value) as Map<String, dynamic>;
    if(T == int)
      json = json.map((key, value) => MapEntry(int.parse(key), value));
    else if(T == double)
      json = json.map((key, value) => MapEntry(double.parse(key), value));
    return json.cast<T, T2>();
  }
  
  BaseEntity.create() {
    _options = EntityOptions(this);
  }
  
  BaseEntity.fromTable(Map<String, dynamic> json) {
    _options = EntityOptions(this);
    getOptions().state = EEntityState.LOADED;
  }
  
  set id(int id);


  EntityOptions getOptions()
    => _options;

  @mustCallSuper
  void initState() {
    // assert(() {
      if(getOptions().state == EEntityState.INITED)
        throw(Exception("Entity have been already initialized"));
      else if(getOptions().state == EEntityState.DISPOSED)
        throw(Exception("Entity have been already disposed"));
      getOptions().state += EEntityState.INITED;
      // return true;
    // }());
  }

  @mustCallSuper
  void dispose() {
    // assert(() {
      if(getOptions().state == EEntityState.DISPOSED)
        throw(Exception("Entity have been already disposed"));
      if(getOptions().state != EEntityState.INITED)
        throw(Exception("Entity havent been initialized"));
      if(getOptions().locked)
        throw(Exception("Entity locked"));
      getOptions().state += EEntityState.DISPOSED;
      // return true;
    // }());
  }

  void copyTo(
    BaseEntity entity, {
      List<EntityColumnInfo> include = const [],
      List<EntityColumnInfo> exclude = const [],
      List<ChangedColumn>? differences,
  });

  /// Returns true if values have changed
  bool copyChangesTo(
    BaseEntity entity, {
      List<EntityColumnInfo> include = const [],
      List<EntityColumnInfo> exclude = const [],
      List<ChangedColumn>? differences,
  });


  void lock()
    => getOptions().lock();
    
  void unlock()
    => getOptions().unlock();

  void setLoaded(
    bool loaded,
  ) {
    if(loaded) getOptions().state += EEntityState.LOADED;
    else getOptions().state -= EEntityState.LOADED;
  }
  
  void setEdited(
    bool edited, {
      Iterable<EntityColumnInfo> changed = const [],
  }) {
    if(!edited) {
      getOptions()._changedParams.clear();
      getOptions().state -= EEntityState.EDITED;
      return;
    }
    
    if(changed.isEmpty)
      throw(Exception("setEdited(true) should provide changes list; changed is empty"));

    getOptions().state += EEntityState.EDITED;
    
    for(final param in changed)
      if(!getOptions()._changedParams.contains(param))
        getOptions()._changedParams.add(param);
  }


  late final EntityOptions _options;
}

class EntityOptions {
  final BaseEntity entity;
  EntityOptions(this.entity);



  final List<EntityColumnInfo>  _changedParams = [];

  int _locks = 0;

  

  Iterable<EntityColumnInfo> get changedParams => _changedParams;

  // EEntityState get state => state;
  EEntityState state = EEntityState.NONE;

  bool get initialized => state == EEntityState.INITED;

  bool get disposed => state == EEntityState.DISPOSED;

  bool get locked => _locks > 0;

  bool get loaded => state == EEntityState.LOADED;

  bool get edited => state == EEntityState.EDITED;

  bool get stored => state == EEntityState.STORED;

  void lock() => _locks += 1;
  void unlock() => _locks -= 1;
}

class EEntityState {
  final int value;
  const EEntityState(this.value);

  static const EEntityState NONE        = EEntityState(0);
  static const EEntityState LOADED      = EEntityState(1);
  static const EEntityState EDITED      = EEntityState(2);
  static const EEntityState INITED      = EEntityState(4);
  static const EEntityState DISPOSED    = EEntityState(8);
  static const EEntityState STORED      = EEntityState(16);
  static const EEntityState PROCESSING  = EEntityState(32);

  static const EEntityState QUEUE_INSERT  = EEntityState(64);
  static const EEntityState QUEUE_UPDATE  = EEntityState(128);
  static const EEntityState QUEUE_DELETE  = EEntityState(256);

  @override
  operator ==(Object other) => other is EEntityState && (this.value & other.value) == other.value;

  EEntityState operator +(EEntityState state) => EEntityState(this.value | state.value);

  EEntityState operator -(EEntityState state) => EEntityState(this.value & ~state.value);

  @override
  int get hashCode => value.hashCode;
}



// abstract class IEntityParams<EntityColumnInfo> {
//   // @override
//   // operator ==(Object other) => throw(Exception(
//   //   "IEntityParams must @override operator ==\n"
//   //   "return other is T && this.primaryKey != null && other.primaryKey != null && this.primaryKey == other.primaryKey",
//   // ));

//   // @override
//   // operator ==(Object other)
//   //   => other is IEntityParams<EntityColumnInfo>
//   //     && this.primaryKey != 0 && other.primaryKey != 0
//   //     && this.primaryKey == other.primaryKey;

//   // @override
//   // int get hashCode => super.hashCode;

//   int get pid;
  
//   set pid(int id);
// }