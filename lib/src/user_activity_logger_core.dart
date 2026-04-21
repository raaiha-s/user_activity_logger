import 'activity_entry.dart';

class UserActivityLogger {
  final List<ActivityEntry> _entries = <ActivityEntry>[];

  void logActivity({
    required String title,
    required String type,
    String? note,
  }) {
    final ActivityEntry entry = ActivityEntry(
      title: title,
      type: type,
      timestamp: DateTime.now(),
      note: note,
    );

    _entries.insert(0, entry);
  }

  List<ActivityEntry> getActivities() {
    return List<ActivityEntry>.unmodifiable(_entries);
  }

  List<ActivityEntry> getActivitiesByType(String type) {
    return _entries
        .where((ActivityEntry entry) => entry.type.toLowerCase() == type.toLowerCase())
        .toList(growable: false);
  }

  int count() {
    return _entries.length;
  }

  void clear() {
    _entries.clear();
  }
}