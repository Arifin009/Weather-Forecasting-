class ApiUrl {
  final String baseUrl =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/';

  String buildUrl(String location) {
    return '$baseUrl$location?unitGroup=us&include=days%2Ccurrent&key=VHU9N4EPWKWZSVES8KZW5UNY5&contentType=json';
  }
}
