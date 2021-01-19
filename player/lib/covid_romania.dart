class ApiResponse {
  List<CovidRomania> covidRomania;

  ApiResponse({this.covidRomania});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['covid_romania'] != null) {
      covidRomania = new List<CovidRomania>();
      var v = json['covid_romania'];
      json['covid_romania'].forEach((v) {
        covidRomania.add(new CovidRomania.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.covidRomania != null) {
      data['covid_romania'] = this.covidRomania.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CovidRomania {
  String reportingDate;
  int totalCases;
  int newCasesToday;
  int totalTests;
  int newTestsToday;
  int totalDeaths;
  int newDeathsToday;
  int totalRecovered;
  int newRecoveredToday;
  int intensiveCareRightNow;
  int emergencyCalls;
  int informationCalls;
  int personsInQuarantine;
  int personsInHomeIsolation;
  int testsForCaseDefinition;
  int testsUponRequest;
  int testsDoneBeforeTodayAndReportedToday;
  int infectedAsymptomatic;
  int infectedHospitalized;
  int infectedPositiveRetests;
  int personsInInstitutionalIsolation;
  int personsInHomeQuarantine;
  int personsInInstitutionalQuarantine;
  String romaniaPopulation2020;
  String sourceUrl;
  List<CountyData> countyData;

  CovidRomania(
      {this.reportingDate,
      this.totalCases,
      this.newCasesToday,
      this.totalTests,
      this.newTestsToday,
      this.totalDeaths,
      this.newDeathsToday,
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
      this.infectedAsymptomatic,
      this.infectedHospitalized,
      this.infectedPositiveRetests,
      this.personsInInstitutionalIsolation,
      this.personsInHomeQuarantine,
      this.personsInInstitutionalQuarantine,
      this.romaniaPopulation2020,
      this.sourceUrl,
      this.countyData});

  CovidRomania.fromJson(Map<String, dynamic> json) {
    reportingDate = json['reporting_date'];
    totalCases = json['total_cases'];
    newCasesToday = json['new_cases_today'];
    totalTests = json['total_tests'];
    newTestsToday = json['new_tests_today'];
    totalDeaths = json['total_deaths'];
    newDeathsToday = json['new_deaths_today'];
    totalRecovered = json['total_recovered'];
    newRecoveredToday = json['new_recovered_today'];
    intensiveCareRightNow = json['intensive_care_right_now'];
    emergencyCalls = json['emergency_calls'];
    informationCalls = json['information_calls'];
    personsInQuarantine = json['persons_in_quarantine'];
    personsInHomeIsolation = json['persons_in_home_isolation'];
    testsForCaseDefinition = json['tests_for_case_definition'];
    testsUponRequest = json['tests_upon_request'];
    testsDoneBeforeTodayAndReportedToday =
        json['tests_done_before_today_and_reported_today'];
    infectedAsymptomatic = json['infected_asymptomatic'];
    infectedHospitalized = json['infected_hospitalized'];
    infectedPositiveRetests = json['infected_positive_retests'];
    personsInInstitutionalIsolation =
        json['persons_in_institutional_isolation'];
    personsInHomeQuarantine = json['persons_in_home_quarantine'];
    personsInInstitutionalQuarantine =
        json['persons_in_institutional_quarantine'];
    romaniaPopulation2020 = json['romania_population_2020'];
    sourceUrl = json['sourceUrl'];
    if (json['county_data'] != null) {
      countyData = new List<CountyData>();
      json['county_data'].forEach((v) {
        countyData.add(new CountyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reporting_date'] = this.reportingDate;
    data['total_cases'] = this.totalCases;
    data['new_cases_today'] = this.newCasesToday;
    data['total_tests'] = this.totalTests;
    data['new_tests_today'] = this.newTestsToday;
    data['total_deaths'] = this.totalDeaths;
    data['new_deaths_today'] = this.newDeathsToday;
    data['total_recovered'] = this.totalRecovered;
    data['new_recovered_today'] = this.newRecoveredToday;
    data['intensive_care_right_now'] = this.intensiveCareRightNow;
    data['emergency_calls'] = this.emergencyCalls;
    data['information_calls'] = this.informationCalls;
    data['persons_in_quarantine'] = this.personsInQuarantine;
    data['persons_in_home_isolation'] = this.personsInHomeIsolation;
    data['tests_for_case_definition'] = this.testsForCaseDefinition;
    data['tests_upon_request'] = this.testsUponRequest;
    data['tests_done_before_today_and_reported_today'] =
        this.testsDoneBeforeTodayAndReportedToday;
    data['infected_asymptomatic'] = this.infectedAsymptomatic;
    data['infected_hospitalized'] = this.infectedHospitalized;
    data['infected_positive_retests'] = this.infectedPositiveRetests;
    data['persons_in_institutional_isolation'] =
        this.personsInInstitutionalIsolation;
    data['persons_in_home_quarantine'] = this.personsInHomeQuarantine;
    data['persons_in_institutional_quarantine'] =
        this.personsInInstitutionalQuarantine;
    data['romania_population_2020'] = this.romaniaPopulation2020;
    data['sourceUrl'] = this.sourceUrl;
    if (this.countyData != null) {
      data['county_data'] = this.countyData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountyData {
  String countyId;
  String countyName;
  int countyPopulation;
  int totalCases;

  CountyData(
      {this.countyId, this.countyName, this.countyPopulation, this.totalCases});

  CountyData.fromJson(Map<String, dynamic> json) {
    countyId = json['county_id'];
    countyName = json['county_name'];
    countyPopulation = json['county_population'];
    totalCases = json['total_cases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['county_id'] = this.countyId;
    data['county_name'] = this.countyName;
    data['county_population'] = this.countyPopulation;
    data['total_cases'] = this.totalCases;
    return data;
  }
}
