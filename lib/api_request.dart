import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'covid_romania.dart';

Future<ApiResponse> fetchApi() async {
  final url = Uri.parse("https://www.graphs.ro/json.php");
  // Await the HTTP GET response, then decode the
  // JSON data it contains.
  final response = await http.get(url);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> responseMap = convert.jsonDecode(response.body);

    return ApiResponse.fromJson(responseMap);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Api');
  }
}
