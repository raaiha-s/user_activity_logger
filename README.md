# User Activity Logger

A simple Dart-only Flutter package to log basic user activities such as screen views, button clicks, and login events.

---

## Features

- Log activities with title, type, timestamp, and optional note  
- View all logged activities  
- Filter activities by type  
- Count total activities  
- Clear all logs  
- Includes a working example app  

---

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  user_activity_logger: ^0.0.1
```

Run:

```bash
flutter pub get
```

---

## Import

```dart
import 'package:user_activity_logger/user_activity_logger.dart';
```

---

## Basic Usage

```dart
final logger = UserActivityLogger();

// Log activity
logger.logActivity(
  title: 'Viewed Home Screen',
  type: 'navigation',
  note: 'User opened dashboard',
);

// Get all logs
final logs = logger.getActivities();

// Filter logs
final navLogs = logger.getActivitiesByType('navigation');

// Count logs
print(logger.count());

// Clear logs
logger.clear();
```

---

## Example App (UI Showcase)

The package includes an example app inside the `/example` folder.

### What it shows

- Buttons to log activities (Login, Screen View, Button Click)  
- Live activity list  
- Total activity counter  
- Clear logs button  

### How to run

```bash
cd example
flutter pub get
flutter run -d chrome
```

### Example UI flow

1. Click **Log Login**  
2. Click **Log Screen View**  
3. Click **Log Button Click**  
4. Activities appear instantly  
5. Click **Clear Logs** to reset  

---

## Example Usage from App

```dart
ElevatedButton(
  onPressed: () {
    logger.logActivity(
      title: 'User logged in',
      type: 'auth',
    );
  },
  child: Text('Log Login'),
);
```

---

## API Overview

### UserActivityLogger

- logActivity(...)
- getActivities()
- getActivitiesByType(type)
- count()
- clear()

### ActivityEntry

- title  
- type  
- timestamp  
- note  

---

## Notes

- Data is stored in-memory only  
- No database or persistence used  
- Designed to be simple and lightweight  