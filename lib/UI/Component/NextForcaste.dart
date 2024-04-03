import 'package:flutter/material.dart';
import 'package:weather_forcasting/UI/app_decoration.dart';
import 'package:weather_forcasting/Model/WeatherModel.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class NextForcaste extends StatefulWidget {
  final List<Days>? dailyWeather;

  const NextForcaste({Key? key, required this.dailyWeather}) : super(key: key);

  @override
  _NextForcasteState createState() => _NextForcasteState();
}

class _NextForcasteState extends State<NextForcaste> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (widget.dailyWeather == null || widget.dailyWeather!.isEmpty) {
      return Container(
          child: Center(
              child: Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  'No weather data available')));
    }

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      padding: EdgeInsets.only(left: 30, right: 30, top: 15),
      height: screenHeight * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        children: [
          Text(
            "Next Day Forecast", // Add your title here
            style: titleTxt,
          ),
          // Adjust the space between the title and the list
          ListView.builder(
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) {
              final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                widget.dailyWeather![index + 1].datetimeEpoch! * 1000,
              );

              final String dayOfWeek =
                  DateFormat('EEEE').format(dateTime).substring(0, 3);
              int precipitationProbability =
                  widget.dailyWeather![index + 1].precipprob?.ceil() ?? 0;
              int dailyTemp = widget.dailyWeather![index + 1].temp?.ceil() ?? 0;

              return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${dayOfWeek} ", // Modify this line
                      style: GoogleFonts.ubuntuMono(
                        color: Color.fromARGB(255, 244, 247, 247),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      "Rain ${precipitationProbability} %", // Modify this line
                      style: GoogleFonts.ubuntuMono(
                        color: Color.fromARGB(255, 247, 248, 248),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      "${dailyTemp}  °F", // Modify this line
                      style: GoogleFonts.ubuntuMono(
                        color: Color.fromARGB(255, 235, 239, 239),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

const TextStyle titleTxt = TextStyle(
  color: Color.fromARGB(255, 247, 246, 246),
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);
