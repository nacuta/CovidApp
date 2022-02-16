class ApiResponse {
  final List<CovidRomania>? covidRomania;

  ApiResponse({
    this.covidRomania,
  });

  ApiResponse.fromJson(Map<String, dynamic> json)
      : covidRomania = (json['covid_romania'] as List?)
            ?.map(
                (dynamic e) => CovidRomania.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'covid_romania': covidRomania?.map((e) => e.toJson()).toList()};
}

class CovidRomania {
  final String? reportingDate;
  final int? totalCases;
  final int? newCasesToday;
  final int? totalTests;
  final int? newTestsToday;
  final int? totalDeaths;
  final int? newDeathsToday;
  final int? oLDDeaths;
  final int? totalRecovered;
  final int? newRecoveredToday;
  final int? intensiveCareRightNow;
  final int? emergencyCalls;
  final int? informationCalls;
  final dynamic personsInQuarantine;
  final int? personsInHomeIsolation;
  final int? testsForCaseDefinition;
  final int? testsUponRequest;
  final dynamic testsDoneBeforeTodayAndReportedToday;
  final int? rapidTests;
  final dynamic infectedAsymptomatic;
  final int? infectedHospitalized;
  final int? infectedPositiveRetests;
  final int? personsInInstitutionalIsolation;
  final int? personsInHomeQuarantine;
  final int? personsInInstitutionalQuarantine;
  final String? romaniaPopulation2020;
  final String? sourceUrl;
  final List<CountyData>? countyData;

  CovidRomania({
    this.reportingDate,
    this.totalCases,
    this.newCasesToday,
    this.totalTests,
    this.newTestsToday,
    this.totalDeaths,
    this.newDeathsToday,
    this.oLDDeaths,
    this.totalRecovered,
    this.newRecoveredToday,
    this.intensiveCareRightNow,
    this.emergencyCalls,
    this.informationCalls,
    this.personsInQuarantine,
    this.personsInHomeIsolation,
    this.testsForCaseDefinition,
    this.testsUponRequest,
    this.testsDoneBeforeTodayAndReportedToday,
    this.rapidTests,
    this.infectedAsymptomatic,
    this.infectedHospitalized,
    this.infectedPositiveRetests,
    this.personsInInstitutionalIsolation,
    this.personsInHomeQuarantine,
    this.personsInInstitutionalQuarantine,
    this.romaniaPopulation2020,
    this.sourceUrl,
    this.countyData,
  });

  CovidRomania.fromJson(Map<String, dynamic> json)
      : reportingDate = json['reporting_date'] as String?,
        totalCases = json['total_cases'] as int?,
        newCasesToday = json['new_cases_today'] as int?,
        totalTests = json['total_tests'] as int?,
        newTestsToday = json['new_tests_today'] as int?,
        totalDeaths = json['total_deaths'] as int?,
        newDeathsToday = json['new_deaths_today'] as int?,
        oLDDeaths = json['OLD_deaths'] as int?,
        totalRecovered = json['total_recovered'] as int?,
        newRecoveredToday = json['new_recovered_today'] as int?,
        intensiveCareRightNow = json['intensive_care_right_now'] as int?,
        emergencyCalls = json['emergency_calls'] as int?,
        informationCalls = json['information_calls'] as int?,
        personsInQuarantine = json['persons_in_quarantine'],
        personsInHomeIsolation = json['persons_in_home_isolation'] as int?,
        testsForCaseDefinition = json['tests_for_case_definition'] as int?,
        testsUponRequest = json['tests_upon_request'] as int?,
        testsDoneBeforeTodayAndReportedToday =
            json['tests_done_before_today_and_reported_today'],
        rapidTests = json['rapid_tests'] as int?,
        infectedAsymptomatic = json['infected_asymptomatic'],
        infectedHospitalized = json['infected_hospitalized'] as int?,
        infectedPositiveRetests = json['infected_positive_retests'] as int?,
        personsInInstitutionalIsolation =
            json['persons_in_institutional_isolation'] as int?,
        personsInHomeQuarantine = json['persons_in_home_quarantine'] as int?,
        personsInInstitutionalQuarantine =
            json['persons_in_institutional_quarantine'] as int?,
        romaniaPopulation2020 = json['romania_population_2020'] as String?,
        sourceUrl = json['sourceUrl'] as String?,
        countyData = (json['county_data'] as List?)
            ?.map((dynamic e) => CountyData.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'reporting_date': reportingDate,
        'total_cases': totalCases,
        'new_cases_today': newCasesToday,
        'total_tests': totalTests,
        'new_tests_today': newTestsToday,
        'total_deaths': totalDeaths,
        'new_deaths_today': newDeathsToday,
        'OLD_deaths': oLDDeaths,
        'total_recovered': totalRecovered,
        'new_recovered_today': newRecoveredToday,
        'intensive_care_right_now': intensiveCareRightNow,
        'emergency_calls': emergencyCalls,
        'information_calls': informationCalls,
        'persons_in_quarantine': personsInQuarantine,
        'persons_in_home_isolation': personsInHomeIsolation,
        'tests_for_case_definition': testsForCaseDefinition,
        'tests_upon_request': testsUponRequest,
        'tests_done_before_today_and_reported_today':
            testsDoneBeforeTodayAndReportedToday,
        'rapid_tests': rapidTests,
        'infected_asymptomatic': infectedAsymptomatic,
        'infected_hospitalized': infectedHospitalized,
        'infected_positive_retests': infectedPositiveRetests,
        'persons_in_institutional_isolation': personsInInstitutionalIsolation,
        'persons_in_home_quarantine': personsInHomeQuarantine,
        'persons_in_institutional_quarantine': personsInInstitutionalQuarantine,
        'romania_population_2020': romaniaPopulation2020,
        'sourceUrl': sourceUrl,
        'county_data': countyData?.map((e) => e.toJson()).toList()
      };
}

class CountyData {
  final String? countyId;
  final String? countyName;
  final int? countyPopulation;
  final int? totalCases;

  CountyData({
    this.countyId,
    this.countyName,
    this.countyPopulation,
    this.totalCases,
  });

  CountyData.fromJson(Map<String, dynamic> json)
      : countyId = json['county_id'] as String?,
        countyName = json['county_name'] as String?,
        countyPopulation = json['county_population'] as int?,
        totalCases = json['total_cases'] as int?;

  Map<String, dynamic> toJson() => {
        'county_id': countyId,
        'county_name': countyName,
        'county_population': countyPopulation,
        'total_cases': totalCases
      };
}
