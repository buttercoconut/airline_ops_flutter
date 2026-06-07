import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/api_service.dart';
import 'screens/flight_schedule_screen.dart';
import 'screens/reservation_screen.dart';

void main() {
  runApp(const AirlineOpsApp());
}

class AirlineOpsApp extends StatelessWidget {
  const AirlineOpsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(
          create: (_) => ApiService(),
        ),
      ],
      child: MaterialApp(
        title: 'Airline Ops',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const FlightScheduleScreen(),
          '/reserve': (context) => const ReservationScreen(),
        },
      ),
    );
  }
}
