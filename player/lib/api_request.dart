import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'covid_romania.dart';
// import 'package:flutter/material.dart';

// class ApiResponse {
//   final int infected;
//   final int recovered;
//   final int deceased;
//   final List totalCases;

//   String date;

//   ApiResponse(
//       {this.totalCases,
//       this.infected,
//       this.recovered,
//       this.deceased,
//       this.date});
//   factory ApiResponse.fromJson(Map<String, dynamic> json) {
//     var x = json["covid_romania"];
//     var y = x[0];
//     var z = y["total_tests"];
//     return ApiResponse(
//       // totalCases: List<ApiResponse>.from(
//       //     json["covid_Romania"].map((x) => ApiResponse.fromJson(x))),
//       infected: x.map((x) => ApiResponse.fromJson(x[0])),
//       // recovered: json['recovered'] as int,
//       // deceased: json['deceased'] as int,
//       // date: json['lastUpdatedAtApify'] as String
//     );
//   }
// }

Future<ApiResponse> fetchApi() async {
  // final response = await http.get('https://www.graphs.ro/json_apify.php');
  final response = await http.get("https://www.graphs.ro/json.php");
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> employeeData = jsonDecode(response.body);
    return ApiResponse.fromJson(employeeData);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Api');
  }
}
