class CourseScrollData_model {
  final String part_1_unlocked;
  final String part_2_unlocked;
  final String part_3_unlocked;
  final String part_4_unlocked;

  CourseScrollData_model({required this.part_1_unlocked, required this.part_2_unlocked, required this.part_3_unlocked, required this.part_4_unlocked});

  factory CourseScrollData_model.fromJson(Map<String, dynamic> json) {
    return CourseScrollData_model(
      part_1_unlocked: json['part_1_unlocked'] ?? '',
      part_2_unlocked: json['part_2_unlocked'] ?? '',
      part_3_unlocked: json['part_3_unlocked'] ?? '',
      part_4_unlocked: json['part_4_unlocked'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'part_1_unlocked': part_1_unlocked,
      'part_2_unlocked': part_2_unlocked,
      'part_3_unlocked': part_3_unlocked,
      'part_4_unlocked': part_4_unlocked,
    };
  }
}
