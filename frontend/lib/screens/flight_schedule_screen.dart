import 'package:flutter/material.dart';
import '../widgets/flight_card.dart';
import '../services/api_service.dart';

class FlightScheduleScreen extends StatefulWidget {
  @override
  _FlightScheduleScreenState createState() => _FlightScheduleScreenState();
}

class _FlightScheduleScreenState extends State<FlightScheduleScreen> {
  List<dynamic> flights = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadFlights();
  }

  Future<void> _loadFlights() async {
    final data = await ApiService.getFlightSchedules();
    setState(() {
      flights = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flight Schedule')),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: flights.length,
              itemBuilder: (context, index) {
                return FlightCard(flight: flights[index]);
              },
            ),
    );
  }
}
