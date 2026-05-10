import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const _baseUrl = 'https://api.airlineops.example.com';

  static Future<List><Map<String, dynamic>> getFlightSchedules() async {
    final response = await http.get(Uri.parse('$_baseUrl/flights/schedules'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load flight schedules');
    }
  }

  static Future<bool> bookFlight(String flightId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/reservations'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'flight_id': flightId}),
    );
    return response.statusCode == 201;
  }
}
