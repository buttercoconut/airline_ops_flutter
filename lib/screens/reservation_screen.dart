import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _flightNumber;
  String? _passengerName;

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Here you would normally call an API to create a reservation.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Reservation for $_passengerName on flight $_flightNumber created.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Make Reservation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Flight Number'),
                validator: (value) => value == null || value.isEmpty ? 'Enter flight number' : null,
                onSaved: (value) => _flightNumber = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Passenger Name'),
                validator: (value) => value == null || value.isEmpty ? 'Enter passenger name' : null,
                onSaved: (value) => _passengerName = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Reserve'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
