import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  final String flightNumber;
  final String origin;
  final String destination;
  final String departureTime;

  const FlightCard({
    Key? key,
    required this.flightNumber,
    required this.origin,
    required this.destination,
    required this.departureTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text('$flightNumber - $origin → $destination'),
        subtitle: Text('Departure: $departureTime'),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Book'),
        ),
      ),
    );
  }
}
