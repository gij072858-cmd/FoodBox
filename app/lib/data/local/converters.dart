import 'dart:convert';

import 'package:drift/drift.dart';

import '../models/enums.dart';
import '../models/recipe.dart';

/// Drift 类型转换器集合
///
/// 用于把「值对象型」字段（列表 / 集合）序列化进 TEXT 列，
/// 让表结构保持六张表的简化口径（详见《接口约定.md》2.2）。

/// List&lt;String&gt; ↔ JSON 文本（步骤照片流等）
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return const <String>[];
    final Object? decoded = jsonDecode(fromDb);
    if (decoded is! List) return const <String>[];
    return decoded.map((Object? e) => e.toString()).toList(growable: false);
  }

  @override
  String toSql(List<String> value) => jsonEncode(value);
}

/// List&lt;int&gt; ↔ JSON 文本（适宜月份、三栏清单菜式 id）
class IntListConverter extends TypeConverter<List<int>, String> {
  const IntListConverter();

  @override
  List<int> fromSql(String fromDb) {
    if (fromDb.isEmpty) return const <int>[];
    final Object? decoded = jsonDecode(fromDb);
    if (decoded is! List) return const <int>[];
    return decoded
        .map((Object? e) => e is num ? e.toInt() : int.tryParse('$e'))
        .whereType<int>()
        .toList(growable: false);
  }

  @override
  String toSql(List<int> value) => jsonEncode(value);
}

/// Set&lt;StepResource&gt; ↔ 逗号分隔文本（步骤占用资源）
class StepResourceSetConverter extends TypeConverter<Set<StepResource>, String> {
  const StepResourceSetConverter();

  @override
  Set<StepResource> fromSql(String fromDb) {
    if (fromDb.isEmpty) return const <StepResource>{};
    return fromDb
        .split(',')
        .map(StepResource.parse)
        .whereType<StepResource>()
        .toSet();
  }

  @override
  String toSql(Set<StepResource> value) =>
      value.map((StepResource e) => e.name).join(',');
}

/// List&lt;RecipeIngredient&gt; ↔ JSON 文本（菜式配方明细）
class RecipeIngredientListConverter
    extends TypeConverter<List<RecipeIngredient>, String> {
  const RecipeIngredientListConverter();

  @override
  List<RecipeIngredient> fromSql(String fromDb) {
    if (fromDb.isEmpty) return const <RecipeIngredient>[];
    final Object? decoded = jsonDecode(fromDb);
    if (decoded is! List) return const <RecipeIngredient>[];
    return decoded
        .whereType<Map<String, dynamic>>()
        .map(RecipeIngredient.fromJson)
        .toList(growable: false);
  }

  @override
  String toSql(List<RecipeIngredient> value) => jsonEncode(
    value.map((RecipeIngredient e) => e.toJson()).toList(growable: false),
  );
}
