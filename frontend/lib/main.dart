import 'package:flutter/material.dart';
import 'screens/flight_schedule_screen.dart';

void main() => runApp(FlightApp());

class FlightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airline Ops',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FlightScheduleScreen(),
    );
  }
}
