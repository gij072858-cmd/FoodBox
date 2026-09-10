import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// 食匣 FoodBox 入口
///
/// 双端启动：
///   Android  flutter run -d <设备>
///   Windows  flutter run -d windows
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: FoodBoxApp()));
}
