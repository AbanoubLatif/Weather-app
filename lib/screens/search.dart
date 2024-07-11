import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

import '../providers/weather_provider.dart';
// ignore: must_be_immutable
class Search extends StatelessWidget {

String? cityName;

  Search({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Search a City'),
      ) ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16),
            child: TextField(
              onChanged: (data){
                cityName=data;
              },
              onSubmitted: (data)async{
                cityName=data;

                WeatherService service=WeatherService();

                WeatherModel? weather =  await service.getWeather(cityName:cityName!);

                Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;

                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 33),
                border: const OutlineInputBorder(

                ),
                label: const Text('Search',style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize: 20,
                ),),
                suffixIcon:
                GestureDetector(
                    onTap: ()async{

                      WeatherService service=WeatherService();

                      WeatherModel? weather =  await service.getWeather(cityName:cityName!);

                      Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                      Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;

                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.search)),
                hintText:'City Name',

              ),
            ),
          ),
        ],
      ),
    );
  }
}
