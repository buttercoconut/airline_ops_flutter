import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/flight_card.dart';

class FlightScheduleScreen extends StatefulWidget {
  const FlightScheduleScreen({super.key});

  @override
  State<FlightScheduleScreen> createState() => _FlightScheduleScreenState();
}

class _FlightScheduleScreenState extends State<FlightScheduleScreen> {
  late Future<List<Flight>> _flightsFuture;

  @override
  void initState() {
    super.initState();
    _flightsFuture = ApiService().fetchFlights();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight Schedule'),
        actions: [
          IconButton(
            icon: const Icon(Icons.book),
            onPressed: () => Navigator.pushNamed(context, '/reserve'),
          ),
        ],
      ),
      body: FutureBuilder<List<Flight>>(
        future: _flightsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          final flights = snapshot.data ?? [];
          if (flights.isEmpty) {
            return const Center(child: Text('No flights available.'));
          }
          return ListView.builder(
            itemCount: flights.length,
            itemBuilder: (context, index) {
              return FlightCard(flight: flights[index]);
            },
          );
        },
      ),
    );
  }
}
