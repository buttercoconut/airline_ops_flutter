import 'package:flutter/material.dart';
import '../services/api_service.dart';

class FlightCard extends StatelessWidget {
  final Flight flight;

  const FlightCard({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.flight),
        title: Text('${flight.airline} ${flight.flightNumber}'),
        subtitle: Text('From ${flight.origin} to ${flight.destination}'),
        trailing: Text('${flight.departureTime} → ${flight.arrivalTime}'),
      ),
    );
  }
}
