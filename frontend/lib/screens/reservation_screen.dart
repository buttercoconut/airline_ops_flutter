import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservation')),
      body: const Center(child: Text('Reservation screen placeholder')),
    );
  }
}
