import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  final Map<String, dynamic> flight;
  FlightCard({required this.flight});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text('${flight['flight_number']}'),
        subtitle: Text('From ${flight['origin']} to ${flight['destination']}'),
        trailing: Text('${flight['departure_time']}'),
      ),
    );
  }
}
