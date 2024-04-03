import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_forcasting/Model/WeatherModel.dart';
import 'package:weather_forcasting/UI/app_decoration.dart';
import 'package:weather_icons/weather_icons.dart';

class todaySunrise extends StatefulWidget {
  final WeatherModel? weatherModel;

  @override
  const todaySunrise({Key? key, required this.weatherModel}) : super(key: key);

  @override
  _todaySunriseState createState() => _todaySunriseState();
}

class _todaySunriseState extends State<todaySunrise> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final String sunrise =
        widget.weatherModel?.currentConditions?.sunrise?.toString() ??
            "Unknown temp";
    final String sunset =
        widget.weatherModel?.currentConditions?.sunset?.toString() ??
            "Unknown temp";
    final double moonPhase =
        (widget.weatherModel?.currentConditions?.moonphase ?? 0) * 100;

    final IconData sunriseIcon =
        WeatherIcons.sunrise; // Replace with your sunrise icon
    final IconData sunsetIcon =
        WeatherIcons.sunset; // Replace with your sunset icon
    final IconData moonPhaseIcon = WeatherIcons.moonset;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      padding: EdgeInsets.only(left: 30, right: 30, top: 15),
      height: screenHeight * 0.13,
      width: MediaQuery.of(context).size.width,
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sunrise    ",
                style: GoogleFonts.ubuntuMono(
                  color: Color.fromARGB(255, 244, 247, 247),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Icon(sunriseIcon,
                  size: 15.0, color: Color.fromARGB(255, 255, 255, 255)),
              Text(
                sunrise,
                style: GoogleFonts.ubuntuMono(
                  color: Color.fromARGB(255, 244, 247, 247),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sunset     ",
                style: GoogleFonts.ubuntuMono(
                  color: Color.fromARGB(255, 244, 247, 247),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Icon(sunsetIcon,
                  size: 15.0, color: Color.fromARGB(255, 255, 255, 255)),
              Text(
                sunset,
                style: GoogleFonts.ubuntuMono(
                  color: Color.fromARGB(255, 244, 247, 247),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textAlign: TextAlign.left,
                "Moonphase",
                style: GoogleFonts.ubuntuMono(
                  color: Color.fromARGB(255, 244, 247, 247),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              Icon(moonPhaseIcon,
                  size: 15.0, color: Color.fromARGB(255, 255, 255, 255)),
              Text(
                moonPhase.toString() + " %",
                style: GoogleFonts.ubuntuMono(
                  color: Color.fromARGB(255, 244, 247, 247),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
