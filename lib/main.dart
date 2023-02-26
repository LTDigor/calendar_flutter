import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(const MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  DateTime current = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      current = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Я календарь. Я календарь."),
      ),
      body: content(),
    );
  }

  Widget content() {
    return TableCalendar(
      rowHeight: 50,
      availableGestures: AvailableGestures.all,
      headerStyle:
          const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      focusedDay: current,
      selectedDayPredicate: (day) => isSameDay(day, current),
      firstDay: DateTime.utc(2000),
      lastDay: DateTime.utc(2035),
      onDaySelected: _onDaySelected,
    );
  }
}
