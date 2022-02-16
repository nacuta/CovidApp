import 'package:flutter/material.dart';
import 'package:player/api_request.dart';
import 'package:player/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:player/counter.dart';
import 'package:player/map_widget.dart';

import 'covid_romania.dart';
import 'my_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme:
              const TextTheme(headline1: TextStyle(color: kBodyTextColor))),
      // home: InfoScreen(),
      home: const MyHomePage(title: 'Covid 19'),
      // home: Api(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<ApiResponse> apiResponse;
  @override
  void initState() {
    super.initState();
    apiResponse = fetchApi();
  }

  late List<String> dropDownValueItems;
  fetchCountyCases(String selected, data) {
    int index = dropDownValueItems.indexOf(selected);
    final int countyTotalCases = data.countyData[index - 1].totalCases;
    return countyTotalCases;
  }

  String _dropDownValue = "Romania";
  late int countyCases;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ApiResponse>(
          future: apiResponse,
          builder: (content, snapshot) {
            dropDownValueItems = ["Romania"];
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                CovidRomania presentDayData = snapshot.data!.covidRomania![0];
                final int? newCasesToday = presentDayData.newCasesToday;
                final int? newRecoveredToday = presentDayData.newRecoveredToday;
                final int? newDeathsToday = presentDayData.newDeathsToday;
                List<CountyData>? county = presentDayData.countyData;
                county?.forEach((element) =>
                    dropDownValueItems.add(element.countyName.toString()));
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const MyHeader(
                        image: "assets/icons/Drcorona.svg",
                        textTop: "All you need",
                        textBottom: "is to stay at",
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: const Color(0xFFE5E5E5E5),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                            const SizedBox(width: 20),
                            Expanded(
                              child: DropdownButton(
                                isExpanded: true,
                                underline: const SizedBox(),
                                icon: SvgPicture.asset(
                                    "assets/icons/dropdown.svg"),
                                value: _dropDownValue,
                                onChanged: (value) {
                                  setState(() {
                                    _dropDownValue = value.toString();
                                    if (_dropDownValue !=
                                        dropDownValueItems[0]) {
                                      int yesterdayCountyCases =
                                          fetchCountyCases(_dropDownValue,
                                              snapshot.data!.covidRomania![1]);
                                      int todayCountyCases = fetchCountyCases(
                                          _dropDownValue,
                                          snapshot.data!.covidRomania![0]);
                                      countyCases = todayCountyCases -
                                          yesterdayCountyCases;
                                    }
                                  });
                                },
                                items: dropDownValueItems
                                    .map<DropdownMenuItem<String>>(
                                      (String value) => DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Case Updates\n",
                                        style: kTitleTextstyle,
                                      ),
                                      TextSpan(
                                        text: "Newest updates ",
                                        style: TextStyle(
                                          color: kTextLightColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  "See details",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 4),
                                    blurRadius: 30,
                                    color: kShadowColor,
                                  ),
                                ],
                              ),
                              child: _dropDownValue == dropDownValueItems[0]
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Counter(
                                          color: kInfectedColor,
                                          number: newCasesToday,
                                          tittle: "Infected",
                                        ),
                                        Counter(
                                          color: kDeathColor,
                                          number: newDeathsToday,
                                          tittle: "Deaths",
                                        ),
                                        Counter(
                                          color: kRecovercolor,
                                          number: newRecoveredToday,
                                          tittle: "Recovered",
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Counter(
                                          color: kInfectedColor,
                                          number: countyCases,
                                          tittle: "Infected",
                                        ),
                                      ],
                                    ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Spread of Virus",
                                  style: kTitleTextstyle,
                                ),
                                Text(
                                  "See details",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const MapWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
            }
          }),
    );
  }
}
