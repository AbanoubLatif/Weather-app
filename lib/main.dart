import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/home.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: Builder(
        builder: (context) {
          final weatherProvider = Provider.of<WeatherProvider>(context);
          return WeatherApp(weatherProvider: weatherProvider,);
        },
      ),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  final WeatherProvider weatherProvider;

  const WeatherApp({super.key, required this.weatherProvider});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData==null? Colors.blue:
        Provider.of<WeatherProvider>(context).weatherData!.getColor()
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}


