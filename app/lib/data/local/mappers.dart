import 'package:drift/drift.dart';

import '../models/enums.dart';
import '../models/item.dart';
import '../models/profile.dart';
import '../models/recipe.dart';
import '../models/record.dart';
import '../models/schedule.dart';
import 'database.dart';

/// 数据表行（Row）↔ 领域模型（Domain）互转
///
/// 这一层是「接口与实现分离」的关键接缝：
///   - 上层的 Repository 接口只认领域模型（data/models/）；
///   - 只有本文件认识 Drift 生成的行类型。
/// 期2 接 Supabase 时，只需再写一份 `supabase_mappers.dart`，
/// Repository 接口与全部页面代码零改动。

// ============================ Item ============================

extension ItemRowMapper on ItemRow {
  Item toDomain() => Item(
    id: id,
    name: name,
    category: category,
    kind: kind,
    quantityMode: quantityMode,
    quantity: quantity,
    unit: unit,
    granularLevel: granularLevel,
    storedAt: storedAt,
    shelfLifeDays: shelfLifeDays,
    expireAt: expireAt,
    storageLocation: storageLocation,
    opened: opened,
    barcode: barcode,
    imagePath: imagePath,
    introWhat: introWhat,
    introHow: introHow,
    introStore: introStore,
    introTip: introTip,
    isCustom: isCustom,
    isDepleted: isDepleted,
    note: note,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

extension ItemDomainMapper on Item {
  ItemsCompanion toCompanion() => ItemsCompanion(
    id: id == null ? const Value<int>.absent() : Value<int>(id!),
    name: Value<String>(name),
    category: Value<String>(category),
    kind: Value<ItemKind>(kind),
    quantityMode: Value<QuantityMode>(quantityMode),
    quantity: Value<double?>(quantity),
    unit: Value<String?>(unit),
    granularLevel: Value<GranularLevel?>(granularLevel),
    storedAt: Value<DateTime?>(storedAt),
    shelfLifeDays: Value<int?>(shelfLifeDays),
    expireAt: Value<DateTime?>(expireAt),
    storageLocation: Value<StorageLocation>(storageLocation),
    opened: Value<bool?>(opened),
    barcode: Value<String?>(barcode),
    imagePath: Value<String?>(imagePath),
    introWhat: Value<String?>(introWhat),
    introHow: Value<String?>(introHow),
    introStore: Value<String?>(introStore),
    introTip: Value<String?>(introTip),
    isCustom: Value<bool>(isCustom),
    isDepleted: Value<bool>(isDepleted),
    note: Value<String?>(note),
    updatedAt: Value<DateTime>(updatedAt ?? DateTime.now()),
  );
}

// ============================ Recipe ============================

extension RecipeRowMapper on RecipeRow {
  Recipe toDomain() => Recipe(
    id: id,
    name: name,
    coverImagePath: coverImagePath,
    cuisine: cuisine,
    mainCategory: mainCategory,
    durationMinutes: durationMinutes,
    difficulty: difficulty,
    baseServings: baseServings,
    seasonMonths: seasonMonths,
    ingredients: ingredients,
    intro: intro,
    source: source,
    sharerName: sharerName,
    sharedAt: sharedAt,
    createdAt: createdAt,
  );
}

extension RecipeDomainMapper on Recipe {
  RecipesCompanion toCompanion() => RecipesCompanion(
    id: id == null ? const Value<int>.absent() : Value<int>(id!),
    name: Value<String>(name),
    coverImagePath: Value<String?>(coverImagePath),
    cuisine: Value<String?>(cuisine),
    mainCategory: Value<String?>(mainCategory),
    durationMinutes: Value<int?>(durationMinutes),
    difficulty: Value<Difficulty>(difficulty),
    baseServings: Value<int>(baseServings),
    seasonMonths: Value<List<int>>(seasonMonths),
    ingredients: Value<List<RecipeIngredient>>(ingredients),
    intro: Value<String?>(intro),
    source: Value<RecipeSource>(source),
    sharerName: Value<String?>(sharerName),
    sharedAt: Value<DateTime?>(sharedAt),
  );
}

// ============================ Step ============================

extension StepRowMapper on StepRow {
  Step toDomain() => Step(
    id: id,
    recipeId: recipeId,
    orderIndex: orderIndex,
    instruction: instruction,
    durationMinutes: durationMinutes,
    resources: resources,
    safetyTag: safetyTag,
    photoPaths: photoPaths,
    videoPath: videoPath,
    note: note,
  );
}

extension StepDomainMapper on Step {
  StepsCompanion toCompanion(int recipeId) => StepsCompanion(
    id: id == null ? const Value<int>.absent() : Value<int>(id!),
    recipeId: Value<int>(recipeId),
    orderIndex: Value<int>(orderIndex),
    instruction: Value<String>(instruction),
    durationMinutes: Value<double>(durationMinutes),
    resources: Value<Set<StepResource>>(resources),
    safetyTag: Value<SafetyTag>(safetyTag),
    photoPaths: Value<List<String>>(photoPaths),
    videoPath: Value<String?>(videoPath),
    note: Value<String?>(note),
  );
}

// ============================ ScheduleItem ============================

extension ScheduleItemRowMapper on ScheduleItemRow {
  ScheduleItem toDomain() => ScheduleItem(
    id: id,
    recipeId: recipeId,
    addedAt: addedAt,
    servings: servings,
    status: status,
    plannedFor: plannedFor,
  );
}

extension ScheduleItemDomainMapper on ScheduleItem {
  ScheduleItemsCompanion toCompanion() => ScheduleItemsCompanion(
    id: id == null ? const Value<int>.absent() : Value<int>(id!),
    recipeId: Value<int>(recipeId),
    servings: Value<int>(servings),
    status: Value<ScheduleStatus>(status),
    plannedFor: Value<DateTime?>(plannedFor),
  );
}

// ============================ CookRecord ============================

extension CookRecordRowMapper on RecordRow {
  CookRecord toDomain() => CookRecord(
    id: id,
    recipeId: recipeId,
    completedAt: completedAt,
    note: note,
    xpGained: xpGained,
  );
}

extension CookRecordDomainMapper on CookRecord {
  RecordsCompanion toCompanion() => RecordsCompanion(
    id: id == null ? const Value<int>.absent() : Value<int>(id!),
    recipeId: Value<int>(recipeId),
    completedAt: Value<DateTime>(completedAt),
    note: Value<String?>(note),
    xpGained: Value<int>(xpGained),
  );
}

// ============================ Profile ============================

extension ProfileRowMapper on ProfileRow {
  Profile toDomain() => Profile(
    id: id,
    nickname: nickname,
    avatarPath: avatarPath,
    xp: xp,
    totalMeals: totalMeals,
    favoriteRecipeIds: favoriteRecipeIds,
    cookedRecipeIds: cookedRecipeIds,
    wantedRecipeIds: wantedRecipeIds,
  );
}

extension ProfileDomainMapper on Profile {
  ProfilesCompanion toCompanion() => ProfilesCompanion(
    id: Value<int>(id),
    nickname: Value<String>(nickname),
    avatarPath: Value<String?>(avatarPath),
    xp: Value<int>(xp),
    totalMeals: Value<int>(totalMeals),
    favoriteRecipeIds: Value<List<int>>(favoriteRecipeIds),
    cookedRecipeIds: Value<List<int>>(cookedRecipeIds),
    wantedRecipeIds: Value<List<int>>(wantedRecipeIds),
  );
}
