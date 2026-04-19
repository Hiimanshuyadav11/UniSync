class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime eventDate;
  final String? startTime;
  final String? endTime;
  final String location;
  final String? imageUrl;
  final bool isActive;
  final DateTime? createdAt;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.eventDate,
    this.startTime,
    this.endTime,
    required this.location,
    this.imageUrl,
    this.isActive = true,
    this.createdAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      eventDate: DateTime.parse(json['event_date'] as String),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      location: json['location'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'event_date': eventDate.toIso8601String(),
      'start_time': startTime,
      'end_time': endTime,
      'location': location,
      'image_url': imageUrl,
      'is_active': isActive,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  String get formattedDate {
    return '${eventDate.day}/${eventDate.month}/${eventDate.year}';
  }

  String get formattedTime {
    if (startTime != null && endTime != null) {
      return '$startTime - $endTime';
    } else if (startTime != null) {
      return startTime!;
    }
    return 'All Day';
  }
}
