class UserModel {
  final String id;
  final String email;
  final String? fullName;
  final String? studentId;
  final String? course;
  final String? profileImageUrl;
  final DateTime? createdAt;

  UserModel({
    required this.id,
    required this.email,
    this.fullName,
    this.studentId,
    this.course,
    this.profileImageUrl,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String? ?? '',
      fullName: json['full_name'] as String?,
      studentId: json['student_id'] as String?,
      course: json['course'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'student_id': studentId,
      'course': course,
      'profile_image_url': profileImageUrl,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
