class ActivityEntry {
  final String title;
  final String type;
  final DateTime timestamp;
  final String? note;

  const ActivityEntry({
    required this.title,
    required this.type,
    required this.timestamp,
    this.note,
  });

  ActivityEntry copyWith({
    String? title,
    String? type,
    DateTime? timestamp,
    String? note,
  }) {
    return ActivityEntry(
      title: title ?? this.title,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'type': type,
      'timestamp': timestamp.toIso8601String(),
      'note': note,
    };
  }

  factory ActivityEntry.fromMap(Map<String, dynamic> map) {
    return ActivityEntry(
      title: map['title'] as String,
      type: map['type'] as String,
      timestamp: DateTime.parse(map['timestamp'] as String),
      note: map['note'] as String?,
    );
  }

  @override
  String toString() {
    return 'ActivityEntry(title: $title, type: $type, timestamp: $timestamp, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActivityEntry &&
        other.title == title &&
        other.type == type &&
        other.timestamp == timestamp &&
        other.note == note;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        type.hashCode ^
        timestamp.hashCode ^
        note.hashCode;
  }
}