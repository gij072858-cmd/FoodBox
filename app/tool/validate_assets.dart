// ===========================================================================
// 预置数据字段完整性校验（W2 组长交付 —— 见《02-开发总计划.md》W2 验收）
//
// 用法（在 app/ 目录下）：
//     dart run tool/validate_assets.dart
//
// 校验对象：assets/data/ 下的 food_items.json / recipes.json / alias_map.json
// 退出码：全部通过 0；发现问题 1（可直接接进 CI 或提交前钩子）
//
// 刻意不依赖 Flutter —— 用 `dart run` 即可跑，不经过 `flutter test`
// （本机路径含中文时 flutter 工具链易挂死）。
// ===========================================================================

import 'dart:convert';
import 'dart:io';

// 枚举取值口径见 lib/data/models/enums.dart 与《接口约定.md》第 2 章
const Set<String> _kinds = <String>{'ingredient', 'seasoning'};
const Set<String> _storageLocations = <String>{'fridge', 'freezer', 'room'};
const Set<String> _difficulties = <String>{'easy', 'medium', 'hard'};
const Set<String> _resources = <String>{'stove', 'board', 'hand', 'waiting'};
const Set<String> _safetyTags = <String>{
  'none',
  'rawMeat',
  'readyToEat',
  'highHeat',
};
const List<String> _introKeys = <String>[
  'introWhat',
  'introHow',
  'introStore',
  'introTip',
];

final List<String> _errors = <String>[];

void main() {
  final Directory dataDir = Directory(
    '${File(Platform.script.toFilePath()).parent.parent.path}/assets/data',
  );

  if (!dataDir.existsSync()) {
    stderr.writeln('找不到数据目录：${dataDir.path}');
    exit(1);
  }

  stdout.writeln('校验目录：${dataDir.path}');
  stdout.writeln('');

  _checkFoodItems(File('${dataDir.path}/food_items.json'));
  _checkRecipes(File('${dataDir.path}/recipes.json'));
  _checkAliasMap(File('${dataDir.path}/alias_map.json'));

  if (_errors.isEmpty) {
    stdout.writeln('校验通过：food_items.json / recipes.json / alias_map.json');
    exit(0);
  }

  stderr.writeln('校验未通过，共 ${_errors.length} 个问题：');
  for (final String e in _errors) {
    stderr.writeln('  · $e');
  }
  exit(1);
}

// ============================ food_items.json ============================

void _checkFoodItems(File file) {
  const String label = 'food_items.json';
  final List<dynamic>? items = _readArray(file, label);
  if (items == null) return;
  if (items.isEmpty) {
    _errors.add('$label: 数组不能为空');
    return;
  }

  final Map<String, int> seen = <String, int>{};
  for (int i = 0; i < items.length; i++) {
    final String at = '$label[$i]';
    final dynamic raw = items[i];
    if (raw is! Map<String, dynamic>) {
      _errors.add('$at: 元素必须是对象');
      continue;
    }

    final String name = _requireString(raw, 'name', at);
    _requireString(raw, 'category', at);
    _requireEnum(raw, 'kind', _kinds, at);
    _requireEnum(raw, 'storageLocation', _storageLocations, at);
    _requirePositiveInt(raw, 'shelfLifeDays', at);
    for (final String key in _introKeys) {
      _requireString(raw, key, at);
    }
    _optionalBool(raw, 'opened', at); // 调料专用
    _optionalString(raw, 'barcode', at); // 扫码自学习种子

    if (name.isEmpty) continue;
    final int? first = seen[name];
    if (first == null) {
      seen[name] = i;
    } else {
      _errors.add('$at: 名称「$name」重复（首次出现在 $label[$first]）');
    }
  }

  stdout.writeln('  food_items.json —— ${items.length} 条');
}

// ============================ recipes.json ============================

void _checkRecipes(File file) {
  const String label = 'recipes.json';
  final List<dynamic>? recipes = _readArray(file, label);
  if (recipes == null) return;

  for (int i = 0; i < recipes.length; i++) {
    final String at = '$label[$i]';
    final dynamic raw = recipes[i];
    if (raw is! Map<String, dynamic>) {
      _errors.add('$at: 元素必须是对象');
      continue;
    }
    _requireString(raw, 'name', at);
    _optionalEnum(raw, 'difficulty', _difficulties, at);
    _checkSeasonMonths(raw, at);
    _checkIngredients(raw, at);
    _checkSteps(raw, at);
  }

  stdout.writeln('  recipes.json —— ${recipes.length} 道');
}

void _checkSeasonMonths(Map<String, dynamic> recipe, String at) {
  final dynamic months = recipe['seasonMonths'];
  if (months == null) {
    _errors.add('$at: 缺少 seasonMonths（F12 时令推荐数据源，每道菜都要标）');
    return;
  }
  if (months is! List) {
    _errors.add('$at: seasonMonths 必须是数组');
    return;
  }
  for (final dynamic m in months) {
    if (m is! int || m < 1 || m > 12) {
      _errors.add('$at: seasonMonths 含非法月份「$m」，应为 1–12 的整数');
    }
  }
}

void _checkIngredients(Map<String, dynamic> recipe, String at) {
  final dynamic list = recipe['ingredients'];
  if (list is! List || list.isEmpty) {
    _errors.add('$at: 缺少非空的 ingredients 数组（配方明细内嵌于 recipes，见接口约定 2.7）');
    return;
  }
  for (int i = 0; i < list.length; i++) {
    final String ingAt = '$at.ingredients[$i]';
    final dynamic raw = list[i];
    if (raw is! Map<String, dynamic>) {
      _errors.add('$ingAt: 元素必须是对象');
      continue;
    }
    _requireString(raw, 'name', ingAt);

    final dynamic amount = raw['amount'];
    if (amount != null && amount is! num) {
      _errors.add('$ingAt: amount 必须是数值或省略');
    }
    final dynamic unit = raw['unit'];
    if (unit != null && unit is! String) {
      _errors.add('$ingAt: unit 必须是字符串或省略');
    }
    if (raw['isRequired'] is! bool) {
      _errors.add('$ingAt: isRequired 必须是布尔值（决定「可做」判定，不可省）');
    }
    if (raw['isSeasoning'] is! bool) {
      _errors.add('$ingAt: isSeasoning 必须是布尔值（决定详情页食材/调料分列，不可省）');
    }
  }
}

void _checkSteps(Map<String, dynamic> recipe, String at) {
  final dynamic steps = recipe['steps'];
  if (steps is! List || steps.isEmpty) {
    _errors.add('$at: 缺少非空的 steps 数组');
    return;
  }
  for (int i = 0; i < steps.length; i++) {
    final String stepAt = '$at.steps[$i]';
    final dynamic raw = steps[i];
    if (raw is! Map<String, dynamic>) {
      _errors.add('$stepAt: 元素必须是对象');
      continue;
    }
    _requireString(raw, 'instruction', stepAt);

    // 步骤质量三必填：缺一项时序规则引擎就无法正确排程（接口约定 2.3）
    final dynamic duration = raw['durationMinutes'];
    if (duration is! num || duration < 0) {
      _errors.add('$stepAt: durationMinutes 必须是 ≥ 0 的数值（时序引擎输入，必填）');
    }

    final dynamic resources = raw['resources'];
    if (resources is! List || resources.isEmpty) {
      _errors.add('$stepAt: resources 必须是非空数组（时序引擎输入，必填）');
    } else {
      for (final dynamic r in resources) {
        if (r is! String || !_resources.contains(r)) {
          _errors.add(
            '$stepAt: resources 含非法值「$r」，合法值 ${_resources.join(' / ')}',
          );
        }
      }
    }

    final dynamic safety = raw['safetyTag'];
    if (safety is! String || !_safetyTags.contains(safety)) {
      _errors.add(
        '$stepAt: safetyTag 缺失或非法「$safety」，合法值 ${_safetyTags.join(' / ')}',
      );
    }
  }
}

// ============================ alias_map.json ============================

void _checkAliasMap(File file) {
  const String label = 'alias_map.json';
  if (!file.existsSync()) {
    _errors.add('$label: 文件不存在（W2 应已就位结构骨架，见 assets/data/README.md）');
    return;
  }

  dynamic decoded;
  try {
    decoded = jsonDecode(file.readAsStringSync());
  } on FormatException catch (e) {
    _errors.add('$label: JSON 解析失败 —— ${e.message}');
    return;
  }

  if (decoded is! Map<String, dynamic>) {
    _errors.add('$label: 顶层必须是对象');
    return;
  }
  if (decoded['version'] is! int) {
    _errors.add('$label: version 必须是整数');
  }

  final dynamic groups = decoded['groups'];
  if (groups is! List) {
    _errors.add('$label: groups 必须是数组');
    return;
  }

  // canonical 与别名共用同一个命名空间 —— 跨组重复会让归一结果不确定
  final Set<String> taken = <String>{};
  for (int i = 0; i < groups.length; i++) {
    final String at = '$label.groups[$i]';
    final dynamic raw = groups[i];
    if (raw is! Map<String, dynamic>) {
      _errors.add('$at: 元素必须是对象');
      continue;
    }

    final dynamic canonical = raw['canonical'];
    if (canonical is! String || canonical.trim().isEmpty) {
      _errors.add('$at: canonical 必须是非空字符串');
    } else if (!taken.add(canonical)) {
      _errors.add('$at: canonical「$canonical」在别处已出现');
    }

    final dynamic aliases = raw['aliases'];
    if (aliases is! List || aliases.isEmpty) {
      _errors.add('$at: aliases 必须是非空字符串数组');
      continue;
    }
    for (final dynamic a in aliases) {
      if (a is! String || a.trim().isEmpty) {
        _errors.add('$at: aliases 含非字符串或空值');
      } else if (!taken.add(a)) {
        _errors.add('$at: 名称「$a」重复（canonical 与别名不能重名）');
      }
    }
  }

  stdout.writeln('  alias_map.json —— ${groups.length} 组别名');
}

// ============================ 工具函数 ============================

List<dynamic>? _readArray(File file, String label) {
  if (!file.existsSync()) {
    _errors.add('$label: 文件不存在（${file.path}）');
    return null;
  }
  try {
    final dynamic decoded = jsonDecode(file.readAsStringSync());
    if (decoded is! List) {
      _errors.add('$label: 顶层必须是数组');
      return null;
    }
    return decoded;
  } on FormatException catch (e) {
    _errors.add('$label: JSON 解析失败 —— ${e.message}');
    return null;
  }
}

String _requireString(Map<String, dynamic> map, String key, String at) {
  final dynamic value = map[key];
  if (value is! String || value.trim().isEmpty) {
    _errors.add('$at: 缺少必填字段 $key（应为非空字符串）');
    return '';
  }
  return value;
}

void _requireEnum(
  Map<String, dynamic> map,
  String key,
  Set<String> allowed,
  String at,
) {
  final dynamic value = map[key];
  if (value is! String || !allowed.contains(value)) {
    _errors.add('$at: $key 缺失或非法「$value」，合法值 ${allowed.join(' / ')}');
  }
}

void _optionalEnum(
  Map<String, dynamic> map,
  String key,
  Set<String> allowed,
  String at,
) {
  if (!map.containsKey(key) || map[key] == null) return;
  _requireEnum(map, key, allowed, at);
}

void _requirePositiveInt(Map<String, dynamic> map, String key, String at) {
  final dynamic value = map[key];
  if (value is! int || value <= 0) {
    _errors.add('$at: $key 必须是正整数');
  }
}

void _optionalBool(Map<String, dynamic> map, String key, String at) {
  final dynamic value = map[key];
  if (value != null && value is! bool) {
    _errors.add('$at: $key 必须是布尔值');
  }
}

void _optionalString(Map<String, dynamic> map, String key, String at) {
  final dynamic value = map[key];
  if (value != null && value is! String) {
    _errors.add('$at: $key 必须是字符串');
  }
}
