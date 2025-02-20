import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

final logger = Logger(); // Initialize logger

class ApiService {
  static Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      logger.d("API Request: $url"); // Log the request URL
      logger.d(
        "API Response Status Code: ${response.statusCode}",
      ); // Log status code

      if (response.statusCode == 200) {
        logger.d(
          "API Response Body: ${response.body}",
        ); // Log the response body (for debugging)
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        logger.e(
          "Bad Request: ${response.body}",
        ); // Log 400 errors with details
        throw Exception(
          "Bad Request. Status Code: ${response.statusCode}. ${response.body}",
        );
      } else if (response.statusCode == 401) {
        logger.e("Unauthorized: ${response.body}");
        throw Exception(
          "Unauthorized. Status Code: ${response.statusCode}. ${response.body}",
        );
      } else if (response.statusCode == 403) {
        logger.e("Forbidden: ${response.body}");
        throw Exception(
          "Forbidden. Status Code: ${response.statusCode}. ${response.body}",
        );
      } else if (response.statusCode == 404) {
        logger.e("Not Found: ${response.body}");
        throw Exception(
          "Not Found. Status Code: ${response.statusCode}. ${response.body}",
        );
      } else if (response.statusCode == 500) {
        logger.e("Internal Server Error: ${response.body}");
        throw Exception(
          "Internal Server Error. Status Code: ${response.statusCode}. ${response.body}",
        );
      } else {
        logger.e("Unexpected Error: ${response.statusCode} - ${response.body}");
        throw Exception(
          "Failed to load data. Status Code: ${response.statusCode}. ${response.body}",
        );
      }
    } catch (e) {
      logger.e("Error during API call: $e"); // Log the exception
      throw Exception("Error during API call: $e");
    }
  }
}
