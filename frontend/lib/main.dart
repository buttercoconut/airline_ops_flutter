import 'package:flutter/material.dart';
import 'screens/flight_schedule_screen.dart';

void main() {
  runApp(const AirlineOpsApp());
}

class AirlineOpsApp extends StatelessWidget {
  const AirlineOpsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airline Ops',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlightScheduleScreen(),
    );
  }
}
