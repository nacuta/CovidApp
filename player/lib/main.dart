import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:player/api.dart';
import 'package:player/api_request.dart';
import 'package:player/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:player/counter.dart';

import 'covid_romania.dart';
import 'my_header.dart';

void main() {
  runApp(MyApp());
}

CovidRomania covidRomania;
int newCasesToday = covidRomania.newCasesToday;
int newRecoveredToday = covidRomania.newRecoveredToday;
int newDeathsToday = covidRomania.newDeathsToday;

class MyApp extends StatefulWidget {
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
          textTheme: TextTheme(headline1: TextStyle(color: kBodyTextColor))),
      // home: InfoScreen(),
      home: MyHomePage(title: 'Covid 19'),
      // home: Api(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<dynamic> apiResponse;
  fetchYesterday(data) {
    var x = data.countyData[0].totalCases;
    return x;
  }

  @override
  void initState() {
    super.initState();
    apiResponse = fetchApi();
    // dropDownValue = 'Romania';
  }

  List<String> dropDownValueItems;
  fetchCountyCases(String selected, data) {
    int index = dropDownValueItems.indexOf(selected);
    var x = data.countyData[index - 1].totalCases;
    return x;
  }

  String _dropDownValue = "Romania";
  int countyCases;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiResponse,
          builder: (content, snapshot) {
            dropDownValueItems = ["Romania"];
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              default:
                newCasesToday = snapshot.data.covidRomania[0].newCasesToday;
                newRecoveredToday =
                    snapshot.data.covidRomania[0].newRecoveredToday;
                newDeathsToday = snapshot.data.covidRomania[0].newDeathsToday;
                var county = snapshot.data.covidRomania[0].countyData;
                county.forEach(
                    (element) => dropDownValueItems.add(element.countyName));
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      MyHeader(
                        image: "assets/icons/Drcorona.svg",
                        textTop: "All you need",
                        textBottom: "is to stay at",
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color(0xFFE5E5E5E5),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                            SizedBox(width: 20),
                            Expanded(
                              child: DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                icon: SvgPicture.asset(
                                    "assets/icons/dropdown.svg"),
                                value: _dropDownValue,
                                onChanged: (value) {
                                  setState(() {
                                    _dropDownValue = value;
                                    if (_dropDownValue !=
                                        dropDownValueItems[0]) {
                                      var y = fetchCountyCases(_dropDownValue,
                                          snapshot.data.covidRomania[1]);
                                      var z = fetchCountyCases(_dropDownValue,
                                          snapshot.data.covidRomania[0]);
                                      countyCases = z - y;
                                    }

                                    print(_dropDownValue);
                                    print(dropDownValueItems);
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
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
                                Spacer(),
                                Text(
                                  "See details",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
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
                                        // Counter(
                                        //   color: kDeathColor,
                                        //   number: yesterdayTotal,
                                        //   tittle: "Deaths",
                                        // ),
                                        // Counter(
                                        //   color: kRecovercolor,
                                        //   number: yesterdayTotal,
                                        //   tittle: "Recovered",
                                        // ),
                                      ],
                                    ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.all(20),
                              height: 178,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 30,
                                    color: kShadowColor,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "assets/images/map.png",
                                fit: BoxFit.contain,
                              ),
                            ),
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
