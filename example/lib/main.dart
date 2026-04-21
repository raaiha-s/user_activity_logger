import 'package:flutter/material.dart';
import 'package:user_activity_logger/user_activity_logger.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Activity Logger Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const ActivityLoggerDemoPage(),
    );
  }
}

class ActivityLoggerDemoPage extends StatefulWidget {
  const ActivityLoggerDemoPage({super.key});

  @override
  State<ActivityLoggerDemoPage> createState() => _ActivityLoggerDemoPageState();
}

class _ActivityLoggerDemoPageState extends State<ActivityLoggerDemoPage> {
  final UserActivityLogger _logger = UserActivityLogger();

  void _addLoginActivity() {
    setState(() {
      _logger.logActivity(
        title: 'User logged in',
        type: 'auth',
        note: 'Successful login from example app',
      );
    });
  }

  void _addScreenViewActivity() {
    setState(() {
      _logger.logActivity(
        title: 'Viewed Home Screen',
        type: 'navigation',
        note: 'User opened the dashboard',
      );
    });
  }

  void _addButtonClickActivity() {
    setState(() {
      _logger.logActivity(
        title: 'Clicked Purchase Button',
        type: 'interaction',
        note: 'CTA button pressed',
      );
    });
  }

  void _clearLogs() {
    setState(() {
      _logger.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ActivityEntry> activities = _logger.getActivities();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Activity Logger Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _addLoginActivity,
                  child: const Text('Log Login'),
                ),
                ElevatedButton(
                  onPressed: _addScreenViewActivity,
                  child: const Text('Log Screen View'),
                ),
                ElevatedButton(
                  onPressed: _addButtonClickActivity,
                  child: const Text('Log Button Click'),
                ),
                OutlinedButton(
                  onPressed: _clearLogs,
                  child: const Text('Clear Logs'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Total Activities: ${_logger.count()}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: activities.isEmpty
                  ? const Center(
                      child: Text('No activities logged yet.'),
                    )
                  : ListView.separated(
                      itemCount: activities.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (BuildContext context, int index) {
                        final ActivityEntry entry = activities[index];
                        return Card(
                          child: ListTile(
                            title: Text(entry.title),
                            subtitle: Text(
                              'Type: ${entry.type}\n'
                              'Time: ${entry.timestamp}\n'
                              'Note: ${entry.note ?? "-"}',
                            ),
                            isThreeLine: true,
                            leading: const Icon(Icons.history),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}