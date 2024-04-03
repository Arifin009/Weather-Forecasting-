import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_forcasting/Model/WeatherModel.dart';
import 'package:weather_forcasting/UI/Component/NextForcaste.dart';
import 'package:weather_forcasting/UI/Component/TodaySunRise.dart';
import 'package:weather_forcasting/UI/Component/TodayWeather.dart';
import 'package:weather_forcasting/services/ApiService.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService service = ApiService();
  WeatherModel? weatherData;
  TextEditingController _searchController = TextEditingController();
  Color get blueGray900 => Color.fromARGB(255, 14, 56, 114);
  final _focusNode = FocusNode();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    // Initial fetch for default city (Dhaka)
    fetchInitialData();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          isLoading = false;
          print('Input box clicked');
        });
      } else {
        setState(() {
          if (!isLoading) {
            isLoading = false;
          } else {
            isLoading = true;
          }
          print('Input box not in focus');
        });
      }
    });
  }

  Future<void> fetchInitialData() async {
    try {
      setState(() {
        // Reset weatherData to null to show the progress indicator
        weatherData = null;
        isLoading = true;
      });

      WeatherModel? data = await service.fetchWeatherData("Dhaka");
      setState(() {
        weatherData = data;
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching weather data: $error');
      isLoading = false;
    }
  }

  Future<void> fetchWeatherData(String city) async {
    try {
      setState(() {
        // Reset weatherData to null to show the progress indicator
        weatherData = null;
        isLoading = true;
      });

      WeatherModel? data = await service.fetchWeatherData(city);
      setState(() {
        weatherData = data;
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching weather data: $error');
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print("screen height: " + screenHeight.toString());
    return WillPopScope(
        onWillPop: () async {
          // Show confirmation dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirmation"),
                content: Text("Are you sure you want to exit the app?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      // Close the dialog and exit the app
                      Navigator.of(context).pop();
                      exit(0);
                    },
                    child: Text("Exit"),
                  ),
                ],
              );
            },
          );

          // Return false to prevent default back button behavior
          return Future.value(false);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: blueGray900,
              ),
              child: Column(
                children: [
                  // Search Box
                  Container(
                    height: screenHeight * 0.04,
                    margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 26, 26, 108),
                          Color.fromARGB(255, 52, 52, 125),
                          Color.fromARGB(255, 71, 110, 154),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      focusNode: _focusNode,
                      style: TextStyle(
                        color: Color.fromARGB(255, 158, 172, 218),
                      ),
                      controller: _searchController,
                      onSubmitted: (value) {
                        print('Search submitted with value: $value');
                        if (value.isNotEmpty) {
                          fetchWeatherData(value);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Search For a City',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 158, 172, 218),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 13, 13, 69),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 158, 172, 218),
                        ),
                      ),
                    ),
                  ),

                  // Circular Progress Indicator
                  if (isLoading)
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Center(child: CircularProgressIndicator()),
                    ),

                  // Weather Data Widgets
                  if (!isLoading && weatherData != null)
                    Column(
                      children: [
                        TodayWeather(
                          weatherModel: weatherData,
                        ),
                        todaySunrise(
                          weatherModel: weatherData,
                        ),
                        NextForcaste(
                          dailyWeather: weatherData?.days,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
