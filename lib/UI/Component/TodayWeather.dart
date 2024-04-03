import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_forcasting/Model/WeatherModel.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';

class TodayWeather extends StatefulWidget {
  final WeatherModel? weatherModel;

  const TodayWeather({Key? key, required this.weatherModel}) : super(key: key);

  @override
  _TodayWeatherState createState() => _TodayWeatherState();
}

class _TodayWeatherState extends State<TodayWeather> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (widget.weatherModel == null) {
      return Container(
          margin: EdgeInsets.only(top: 15),
          child: Center(
              child: Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  " No weather data available")));
    }
    final String locationName =
        widget.weatherModel?.address?.toString() ?? "Unknown location";
    final String Temperature =
        widget.weatherModel?.currentConditions?.temp.toString() ??
            "Unknown temp";
    final String condition =
        widget.weatherModel?.currentConditions?.conditions?.toString() ??
            "Unknown temp";
    final String humidity =
        widget.weatherModel?.currentConditions?.humidity.toString() ??
            "Unknown temp";
    final String windSpeed =
        widget.weatherModel?.currentConditions?.windspeed.toString() ??
            "Unknown temp";
    print(windSpeed);
    final String feelLike =
        widget.weatherModel?.currentConditions?.feelslike.toString() ??
            "Unknown temp";
    final String pressure =
        widget.weatherModel?.currentConditions?.pressure?.toString() ??
            "Unknown temp";

    DateTime currentDate = DateTime.now();

    String formateyear = "${currentDate.year}";

    String formattedDate = DateFormat('d').format(currentDate);
    String formattedMonth = DateFormat('MMMM').format(currentDate);

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: 20, right: 20, top: 10), // Set the margin as needed
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
              top: Radius.circular(20.0),
            ),
            child: WeatherBg(
              weatherType: _getWeatherType(condition),
              width: MediaQuery.of(context).size.width,
              height: screenHeight * 0.4, //cng
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 200,
          width: 200,
          child: Image.asset(
            "assets/img.png",
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 100, top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on, // Location icon
                    size: 20.0,
                    color: Color.fromARGB(255, 10, 10, 10),
                  ),
                  Text(
                    locationName,
                    style: kTextStyle, // Use the defined text style constant
                  ),
                ],
              ),
              Text(
                Temperature + " °F",
                style: TmpTextStyle, // Use the defined text style constant
              ),
              Text(
                formattedDate + " " + formattedMonth + " " + formateyear,
                style: kTextStyle, // Use the defined text style constant
              ),
              Text(
                condition,
                style: kTextStyle, // Use the defined text style constant
              ),
              Text(
                pressure + " mb",
                style: kTextStyle, // Use the defined text style constant
              ),
            ],
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 250, left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text(
                    humidity + " %",
                    style: GoogleFonts.ubuntuMono(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ), // Use the defined text style constant
                  ),
                  Text(
                    "Humidity",
                    style: GoogleFonts.ubuntuMono(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ), // Use the defined text style constant
                  ),
                ]),
                Column(children: [
                  Text(
                    windSpeed + " kph",
                    style: GoogleFonts.ubuntuMono(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ), // Use the defined text style constant
                  ),
                  Text(
                    "Wind Speed",
                    style: GoogleFonts.ubuntuMono(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ), // Use the defined text style constant
                  ),
                ]),
                Column(children: [
                  Text(
                    feelLike + " °F",
                    style: GoogleFonts.ubuntuMono(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    // Use the defined text style constant
                  ),
                  Text(
                    "Feels like",
                    style: GoogleFonts.ubuntuMono(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ), // Use the defined text style constant
                  ),
                ]),
              ],
            )),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant TodayWeather oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the weatherModel has changed
    if (widget.weatherModel != oldWidget.weatherModel) {
      // Call setState to trigger a rebuild
      setState(() {});
    }
  }
}

WeatherType _getWeatherType(String condition) {
  if (condition.toLowerCase().contains('Sunny')) {
    return WeatherType.sunny;
  } else if (condition.toLowerCase().contains('rainy')) {
    return WeatherType.heavyRainy;
  } else if (condition.toLowerCase().contains('cloudy')) {
    return WeatherType.cloudy;
  } else if (condition.contains('Partially cloudy')) {
    return WeatherType.cloudy;
  } else if (condition.toLowerCase().contains('snowy')) {
    return WeatherType.lightSnow;
  } else {
    return WeatherType.sunny; // Default to sunny if condition is unknown
  }
}

// Constant for text style
const TextStyle kTextStyle = TextStyle(
  color: Color.fromARGB(255, 37, 36, 36),
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);
const TextStyle TmpTextStyle = TextStyle(
  color: Color.fromARGB(255, 37, 36, 36),
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);
