// import 'package:flutter/material.dart';

// import 'api_request.dart';

// class Api extends StatefulWidget {
//   @override
//   _ApiState createState() => _ApiState();
// }

// class _ApiState extends State<Api> {
//   Future<ApiResponse> apiResponse;
//   @override
//   void initState() {
//     super.initState();
//     apiResponse = fetchAlbum();
//     print(apiResponse.toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//           future: apiResponse,
//           builder: (content, snapshot) {
//             final int infected = snapshot.data.infected;
//             final int recovered = snapshot.data.recovered;
//             final int deceased = snapshot.data.deceased;
//             if (snapshot.hasData) {
//               return Text('Asa ceva $infected');
//             } else {
//               return Text("no data");
//             }
//           }),
//     );
//   }
// }
