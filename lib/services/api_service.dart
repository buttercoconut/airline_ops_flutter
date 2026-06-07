import 'dart:convert';
import 'package:http/http.dart' as http;

class Flight {
  final String flightNumber;
  final String airline;
  final String origin;
  final String destination;
  final String departureTime;
  final String arrivalTime;

  Flight({
    required this.flightNumber,
    required this.airline,
    required this.origin,
    required this.destination,
    required this.departureTime,
    required this.arrivalTime,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      flightNumber: json['flightNumber'] as String,
      airline: json['airline'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      departureTime: json['departureTime'] as String,
      arrivalTime: json['arrivalTime'] as String,
    );
  }
}

class ApiService {
  final String _baseUrl = 'https://api.example.com'; // Replace with real endpoint

  Future<List<Flight>> fetchFlights() async {
    final response = await http.get(Uri.parse('$_baseUrl/flights'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
      return data.map((e) => Flight.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load flights: ${response.statusCode}');
    }
  }
}
