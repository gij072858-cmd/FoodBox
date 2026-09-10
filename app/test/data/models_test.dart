import 'package:flutter_test/flutter_test.dart';
import 'package:foodbox/data/models/enums.dart';
import 'package:foodbox/data/models/item.dart';
import 'package:foodbox/data/models/profile.dart';
import 'package:foodbox/data/models/recipe.dart';

/// 领域模型逻辑测试（不依赖 Flutter / 数据库）
void main() {
  group('Item 有效期语义（Q1-B / Q2-B 剩余天数为主）', () {
    final DateTime now = DateTime(2026, 9, 11);

    test('剩余天数按自然日计算', () {
      final Item item = Item(
        name: '牛奶',
        kind: ItemKind.ingredient,
        expireAt: DateTime(2026, 9, 14),
      );
      expect(item.remainingDays(now: now), 3);
      expect(item.isNearingExpiry(now: now), isTrue);
      expect(item.isExpired(now: now), isFalse);
    });

    test('已过期返回负数并命中过期状态', () {
      final Item item = Item(
        name: '菠菜',
        kind: ItemKind.ingredient,
        expireAt: DateTime(2026, 9, 9),
      );
      expect(item.remainingDays(now: now), -2);
      expect(item.isExpired(now: now), isTrue);
      expect(item.isNearingExpiry(now: now), isFalse);
    });

    test('未设到期日时剩余天数为 null', () {
      const Item item = Item(name: '盐', kind: ItemKind.seasoning);
      expect(item.remainingDays(now: now), isNull);
      expect(item.isExpired(now: now), isFalse);
    });
  });

  group('Item 数量双模式（Q5-C）', () {
    test('粗粒度给出档位文案', () {
      const Item item = Item(
        name: '生抽',
        kind: ItemKind.seasoning,
        granularLevel: GranularLevel.low,
      );
      expect(item.quantityLabel, '快没了');
    });

    test('精确模式拼接单位，整数不带小数点', () {
      const Item item = Item(
        name: '五花肉',
        kind: ItemKind.ingredient,
        quantityMode: QuantityMode.precise,
        quantity: 500,
        unit: 'g',
      );
      expect(item.quantityLabel, '500g');
    });
  });

  group('Profile 厨阶等级表（构想 2.6 / Q9-B）', () {
    test('等级表数值与文档一致', () {
      expect(Profile.ladder, hasLength(7));
      expect(Profile.ladder.first.title, '见习厨工');
      expect(Profile.ladder.last.title, '食匣主厨');
      expect(Profile.ladder.last.requiredXp, 800);
    });

    test('按累计 XP 落级且取上界', () {
      expect(Profile.levelOf(0).level, 1);
      expect(Profile.levelOf(49).level, 1);
      expect(Profile.levelOf(50).level, 2);
      expect(Profile.levelOf(119).level, 2);
      expect(Profile.levelOf(120).level, 3);
      expect(Profile.levelOf(9999).level, 7);
    });

    test('距下一级差值与进度条比例', () {
      const Profile profile = Profile(xp: 60);
      expect(profile.level.title, '帮厨');
      expect(profile.xpToNextLevel, 60); // 120 - 60
      expect(profile.levelProgress, closeTo(10 / 70, 0.0001));

      const Profile maxed = Profile(xp: 800);
      expect(maxed.xpToNextLevel, 0);
      expect(maxed.levelProgress, 1);
    });
  });

  group('RecipeIngredient 份量换算基础（F2）', () {
    const RecipeIngredient tomato = RecipeIngredient(
      name: '番茄',
      amount: 2,
      unit: '个',
    );

    test('按基准份量原样输出', () {
      expect(tomato.label(), '番茄 2个');
    });

    test('按目标份量等比换算', () {
      expect(tomato.label(servings: 4, baseServings: 2), '番茄 4个');
      expect(tomato.label(servings: 1, baseServings: 2), '番茄 1个');
    });
  });

  group('Recipe 属性行与清单拆分', () {
    test('属性行拼接耗时 / 难度 / 菜系', () {
      const Recipe recipe = Recipe(
        name: '番茄炒蛋',
        cuisine: '家常菜',
        durationMinutes: 15,
        difficulty: Difficulty.easy,
      );
      expect(recipe.attributeLine, '15 分钟 · 简单 · 家常菜');
    });

    test('食材与调料按 isSeasoning 拆分', () {
      const Recipe recipe = Recipe(
        name: '测试菜',
        ingredients: <RecipeIngredient>[
          RecipeIngredient(name: '番茄'),
          RecipeIngredient(name: '盐', isSeasoning: true),
          RecipeIngredient(name: '糖', isSeasoning: true),
        ],
      );
      expect(recipe.foodIngredients, hasLength(1));
      expect(recipe.seasonings, hasLength(2));
    });
  });
}
