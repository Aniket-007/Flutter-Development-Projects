import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
 
 double temp = 0;

  @override
  void initState() {
    super.initState();
    getCurrrentWeather();
  }

  Future getCurrrentWeather() async {
    try {
      String cityName = 'Mumbai';
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKEY',
        ),
      );

      final data = jsonDecode(res.body);

      if(data['cod'] != '200'){
        throw 'An Unexpected error ocurre';
      }

      setState(() {
        temp = data['list'][0]['main']['temp'];
      });

    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Navigate to settings screen
            },
          ),
        ],
      ),
      body: temp == 0 ? const CircularProgressIndicator() 
      : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '$temp K',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(height: 20),
                          Icon(Icons.cloud, size: 64),
                          SizedBox(height: 20),
                          Text("Rain", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Weather Forecast',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8),

            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: '9:00',
                    temperature: '301.17',
                    icon: Icons.cloud,
                  ),
                  HourlyForecastItem(
                    time: '9:00',
                    temperature: '301.17',
                    icon: Icons.cloud,
                  ),
                  HourlyForecastItem(
                    time: '9:00',
                    temperature: '301.17',
                    icon: Icons.cloud,
                  ),
                  HourlyForecastItem(
                    time: '9:00',
                    temperature: '301.17',
                    icon: Icons.cloud,
                  ),
                  HourlyForecastItem(
                    time: '9:00',
                    temperature: '301.17',
                    icon: Icons.cloud,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Additional Infromation',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInformationItem(
                  icon: Icons.water_drop,
                  label: 'Humadity',
                  value: '90',
                ),
                AdditionalInformationItem(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '90',
                ),
                AdditionalInformationItem(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '90',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
