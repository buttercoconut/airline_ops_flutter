import 'package:flutter/material.dart';
import '../widgets/flight_card.dart';

class FlightScheduleScreen extends StatelessWidget {
  const FlightScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flight Schedule')),
      body: const Center(child: Text('Flight schedule will be displayed here.')),
    );
  }
}
