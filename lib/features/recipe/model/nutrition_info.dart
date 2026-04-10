/// Optional macros from Gemini / `nutrition` table ([DATABASE SCHEMA.md]).
class NutritionInfo {
  final int? calories;
  final double? proteins;
  final double? carbohydrates;
  final double? fiber;

  const NutritionInfo({
    this.calories,
    this.proteins,
    this.carbohydrates,
    this.fiber,
  });

  factory NutritionInfo.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const NutritionInfo();
    double? d(dynamic v) =>
        v == null ? null : (v is num ? v.toDouble() : double.tryParse('$v'));
    return NutritionInfo(
      calories: json['calories'] as int? ??
          int.tryParse('${json['calories'] ?? ''}'),
      proteins: d(json['proteins']),
      carbohydrates: d(json['carbohydrates']),
      fiber: d(json['fiber']),
    );
  }

  bool get hasAnyData =>
      calories != null ||
      proteins != null ||
      carbohydrates != null ||
      fiber != null;
}
