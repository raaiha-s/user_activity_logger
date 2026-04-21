import 'package:flutter_test/flutter_test.dart';
import 'package:user_activity_logger/user_activity_logger.dart';

void main() {
  group('UserActivityLogger', () {
    test('logs an activity', () {
      final UserActivityLogger logger = UserActivityLogger();

      logger.logActivity(
        title: 'Opened dashboard',
        type: 'navigation',
      );

      final List<ActivityEntry> entries = logger.getActivities();

      expect(entries.length, 1);
      expect(entries.first.title, 'Opened dashboard');
      expect(entries.first.type, 'navigation');
    });

    test('filters by type', () {
      final UserActivityLogger logger = UserActivityLogger();

      logger.logActivity(title: 'Login', type: 'auth');
      logger.logActivity(title: 'Viewed profile', type: 'navigation');
      logger.logActivity(title: 'Logout', type: 'auth');

      final List<ActivityEntry> authEntries = logger.getActivitiesByType('auth');

      expect(authEntries.length, 2);
      expect(authEntries[0].type, 'auth');
      expect(authEntries[1].type, 'auth');
    });

    test('clears all activities', () {
      final UserActivityLogger logger = UserActivityLogger();

      logger.logActivity(title: 'Test', type: 'misc');
      expect(logger.count(), 1);

      logger.clear();
      expect(logger.count(), 0);
    });
  });
}