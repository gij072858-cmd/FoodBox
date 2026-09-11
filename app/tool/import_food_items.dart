// ===========================================================================
// 食材 / 调料整理表（CSV） → assets/data/food_items.json
//
// 用法（在 app/ 目录下）：
//     dart run tool/import_food_items.dart                 # 生成
//     dart run tool/import_food_items.dart --check         # 只检查，不写文件
//     dart run tool/import_food_items.dart --in <csv> --out <json>
//
// 整理表位置：docs/数据/食材调料整理表模板.csv（列口径见 docs/数据/整理表填写说明.md）
// 退出码：通过 0；有错误 1（有错误时不会写文件，避免生成半成品）
//
// 刻意不依赖 Flutter / 第三方包 —— 用 `dart run` 即可跑（本机路径含中文时
// flutter 工具链易挂死）。本脚本是「生成」环节，字段关卡仍是组长交付的
// tool/validate_assets.dart，两步都要绿。
// ===========================================================================

import 'dart:convert';
import 'dart:io';

// ---- 与《接口约定.md》第 2 章 / lib/data/models/enums.dart 对齐 ----
const Set<String> _kinds = <String>{'ingredient', 'seasoning'};
const Set<String> _storageLocations = <String>{'fridge', 'freezer', 'room'};

/// 整理表列名 → 输出 JSON 键名（顺序即 JSON 字段顺序）
const List<String> _columns = <String>[
  'name',
  'category',
  'kind',
  'shelfLifeDays',
  'storageLocation',
  'opened',
  'barcode',
  'introWhat',
  'introHow',
  'introStore',
  'introTip',
];

/// 填写说明第三章的 11 个分类（仅用于提示，不是硬约束）
const Set<String> _knownCategories = <String>{
  '蔬菜', '水果', '菌菇干货', '禽肉', '畜肉', '水产',
  '蛋豆制品', '主食面点', '调味汁', '香辛料', '油盐糖',
};

final List<String> _errors = <String>[];
final List<String> _warnings = <String>[];

void main(List<String> args) {
  final Map<String, String?> opts = _parseArgs(args);
  if (opts.containsKey('help')) {
    _printHelp();
    return;
  }

  final Directory appDir =
      File(Platform.script.toFilePath()).parent.parent;
  final Directory repoDir = appDir.parent;

  final String inPath = opts['in'] ??
      '${repoDir.path}${Platform.pathSeparator}docs'
          '${Platform.pathSeparator}数据'
          '${Platform.pathSeparator}食材调料整理表模板.csv';
  final String outPath = opts['out'] ??
      '${appDir.path}${Platform.pathSeparator}assets'
          '${Platform.pathSeparator}data'
          '${Platform.pathSeparator}food_items.json';
  final bool checkOnly = opts.containsKey('check');

  stdout.writeln('整理表：$inPath');
  stdout.writeln('输出：  $outPath${checkOnly ? '（--check：不写入）' : ''}');
  stdout.writeln('');

  final File inFile = File(inPath);
  if (!inFile.existsSync()) {
    stderr.writeln('找不到整理表：$inPath');
    exit(1);
  }

  final String text = _readUtf8(inFile);
  if (_errors.isNotEmpty) {
    _report();
    exit(1);
  }

  final List<List<String>> rows = _parseCsv(text);
  if (rows.isEmpty) {
    _errors.add('整理表是空的');
    _report();
    exit(1);
  }

  // ---- 表头 ----
  final List<String> header = rows.first.map((String s) => s.trim()).toList();
  final Map<String, int> index = <String, int>{};
  for (int i = 0; i < header.length; i++) {
    index[header[i]] = i;
  }
  final List<String> missing =
      _columns.where((String c) => !index.containsKey(c)).toList();
  if (missing.isNotEmpty) {
    _errors.add('表头缺少列：${missing.join(' / ')}（表头不要改名、不要删列）');
    _report();
    exit(1);
  }

  // ---- 数据行 ----
  final List<Map<String, dynamic>> items = <Map<String, dynamic>>[];
  final Map<String, int> seen = <String, int>{};
  final Map<String, int> categoryCount = <String, int>{};

  for (int r = 1; r < rows.length; r++) {
    final List<String> row = rows[r];
    // 跳过空行（单列且内容为空）
    if (row.length <= 1 && row.join().trim().isEmpty) continue;

    final int lineNo = r + 1; // CSV 里的实际行号（含表头）
    final int errorsBefore = _errors.length;
    String cell(String col) {
      final int i = index[col]!;
      return i < row.length ? row[i].trim() : '';
    }

    final String name = cell('name');
    final String at = name.isEmpty ? '第 $lineNo 行' : '第 $lineNo 行「$name」';

    if (name.isEmpty) {
      _errors.add('$at：name 为空');
      continue;
    }
    if (name.length > 60) {
      _errors.add('$at：name 超过 60 字（接口约定 items.name 限 1–60 字）');
    }
    final String? category = _require(cell('category'), 'category', at);
    final String? kind = _requireEnum(cell('kind'), _kinds, 'kind', at);
    final String? storage =
        _requireEnum(cell('storageLocation'), _storageLocations, 'storageLocation', at);
    final int? shelfLife = _requirePositiveInt(cell('shelfLifeDays'), at);
    final bool? opened = _optionalBool(cell('opened'), at);
    final String barcode = cell('barcode');

    final List<String> intros = <String>[];
    for (final String key in const <String>[
      'introWhat',
      'introHow',
      'introStore',
      'introTip',
    ]) {
      final String value = cell(key);
      if (value.isEmpty) {
        _errors.add('$at：$key 为空（四段简介必填，含 introTip）');
      } else if (value.length < 10) {
        _warnings.add('$at：$key 只有 ${value.length} 字，像是占位符，确认一下');
      }
      intros.add(value);
    }

    if (category != null && !_knownCategories.contains(category)) {
      _warnings.add('$at：category「$category」不在填写说明第三章的 11 类里，'
          '卡片配色可能取不到');
    }
    if (barcode.isNotEmpty && !RegExp(r'^\d{6,32}$').hasMatch(barcode)) {
      _errors.add('$at：barcode 应为 6–32 位纯数字，当前「$barcode」');
    }

    if (name.isNotEmpty) {
      final int? first = seen[name];
      if (first == null) {
        seen[name] = lineNo;
      } else {
        _errors.add('$at：名称「$name」重复（首次出现在第 $first 行）'
            '—— 别名写法也算重复，只留标准名，别名交给 alias_map.json');
      }
    }

    if (kind == null || storage == null || shelfLife == null ||
        category == null || _errors.length > errorsBefore) {
      continue; // 该行有错误，不生成（错误已在上面记录）
    }

    // ---- 组装：键顺序与整理表列顺序一致 ----
    final Map<String, dynamic> item = <String, dynamic>{'name': name};
    item['category'] = category;
    item['kind'] = kind;
    item['shelfLifeDays'] = shelfLife;
    item['storageLocation'] = storage;
    if (opened != null) item['opened'] = opened;
    if (barcode.isNotEmpty) item['barcode'] = barcode;
    item['introWhat'] = intros[0];
    item['introHow'] = intros[1];
    item['introStore'] = intros[2];
    item['introTip'] = intros[3];
    items.add(item);
    categoryCount[category] = (categoryCount[category] ?? 0) + 1;
  }

  // ---- 汇总 ----
  if (items.isNotEmpty) {
    stdout.writeln('整理表读入 ${items.length} 条：');
    for (final String cat in _knownCategories) {
      final int n = categoryCount[cat] ?? 0;
      if (n > 0) stdout.writeln('  $cat —— $n 条');
    }
    for (final String cat in categoryCount.keys) {
      if (!_knownCategories.contains(cat)) {
        stdout.writeln('  $cat —— ${categoryCount[cat]} 条（非标准分类）');
      }
    }
    stdout.writeln('');
    if (items.length < 200) {
      _warnings.add('当前 ${items.length} 条，未达任务书要求的下限 200 条');
    }
  }

  if (_errors.isNotEmpty) {
    _report();
    exit(1);
  }

  if (!checkOnly) {
    final File outFile = File(outPath);
    outFile.parent.createSync(recursive: true);
    outFile.writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(items)}\n',
    );
    stdout.writeln('已写入 ${items.length} 条 → $outPath');
  } else {
    stdout.writeln('仅检查：${items.length} 条全部通过，未写文件');
  }
  stdout.writeln('');
  stdout.writeln('下一步：dart run tool/validate_assets.dart');
  _report(warningsOnly: true);
}

// ============================ 参数 / 输出 ============================

Map<String, String?> _parseArgs(List<String> args) {
  final Map<String, String?> opts = <String, String?>{};
  for (int i = 0; i < args.length; i++) {
    final String a = args[i];
    if (a == '--check') {
      opts['check'] = 'true';
    } else if (a == '-h' || a == '--help') {
      opts['help'] = 'true';
    } else if (a == '--in' || a == '--out') {
      if (i + 1 >= args.length) {
        stderr.writeln('$a 后面要跟一个路径');
        exit(1);
      }
      opts[a.substring(2)] = args[++i];
    } else {
      stderr.writeln('无法识别的参数：$a（-h 看用法）');
      exit(1);
    }
  }
  return opts;
}

void _printHelp() {
  stdout.writeln('''
整理表 CSV → food_items.json

  dart run tool/import_food_items.dart [选项]

  --in  <csv>   整理表路径（默认 docs/数据/食材调料整理表模板.csv）
  --out <json>  输出路径（默认 assets/data/food_items.json）
  --check       只校验不写文件
  -h, --help    显示本帮助

列的填写口径见 docs/数据/整理表填写说明.md。''');
}

void _report({bool warningsOnly = false}) {
  if (_errors.isNotEmpty && !warningsOnly) {
    stderr.writeln('整理表有 ${_errors.length} 个问题，未生成文件：');
    for (final String e in _errors) {
      stderr.writeln('  · $e');
    }
  }
  if (_warnings.isNotEmpty) {
    stderr.writeln('');
    stderr.writeln('提醒（不阻断，共 ${_warnings.length} 条）：');
    for (final String w in _warnings) {
      stderr.writeln('  · $w');
    }
  }
}

// ============================ 读取 / 解析 ============================

String _readUtf8(File file) {
  final List<int> bytes = file.readAsBytesSync();
  // 去掉 UTF-8 BOM
  final List<int> body = (bytes.length >= 3 &&
          bytes[0] == 0xEF &&
          bytes[1] == 0xBB &&
          bytes[2] == 0xBF)
      ? bytes.sublist(3)
      : bytes;
  try {
    return utf8.decode(body);
  } on FormatException {
    _errors.add('整理表不是 UTF-8 编码 —— 用 Excel/WPS 打开后「另存为 → '
        'CSV UTF-8（逗号分隔）」，普通的「CSV」保存成的是 GBK，会乱码');
    return '';
  }
}

/// RFC4180 风格解析：支持双引号包裹、`""` 转义、CRLF/LF 换行
List<List<String>> _parseCsv(String text) {
  final List<List<String>> rows = <List<String>>[];
  List<String> row = <String>[];
  final StringBuffer field = StringBuffer();
  bool inQuotes = false;

  for (int i = 0; i < text.length; i++) {
    final String ch = text[i];
    if (inQuotes) {
      if (ch == '"') {
        if (i + 1 < text.length && text[i + 1] == '"') {
          field.write('"');
          i++;
        } else {
          inQuotes = false;
        }
      } else {
        field.write(ch);
      }
      continue;
    }
    if (ch == '"') {
      inQuotes = true;
    } else if (ch == ',') {
      row.add(field.toString());
      field.clear();
    } else if (ch == '\n') {
      row.add(field.toString());
      field.clear();
      rows.add(row);
      row = <String>[];
    } else if (ch != '\r') {
      field.write(ch);
    }
  }
  if (field.isNotEmpty || row.isNotEmpty) {
    row.add(field.toString());
    rows.add(row);
  }
  return rows;
}

// ============================ 字段校验 ============================

String? _require(String value, String col, String at) {
  if (value.isEmpty) {
    _errors.add('$at：$col 为空');
    return null;
  }
  return value;
}

String? _requireEnum(String value, Set<String> allowed, String col, String at) {
  if (!allowed.contains(value)) {
    _errors.add('$at：$col 缺失或非法「$value」，合法值 ${allowed.join(' / ')}');
    return null;
  }
  return value;
}

int? _requirePositiveInt(String value, String at) {
  final int? n = int.tryParse(value);
  if (n == null || n <= 0) {
    _errors.add('$at：shelfLifeDays 必须是正整数，当前「$value」'
        '（只有数字，不写「约7天」）');
    return null;
  }
  return n;
}

bool? _optionalBool(String value, String at) {
  if (value.isEmpty) return null;
  const Map<String, bool> truthy = <String, bool>{
    'true': true, 'false': false,
    '1': true, '0': false,
    '是': true, '否': false,
  };
  final bool? v = truthy[value.toLowerCase()];
  if (v == null) {
    _errors.add('$at：opened 只能是 true / false / 是 / 否，留空表示未开封；'
        '当前「$value」');
  }
  return v;
}
