import 'package:flutter/material.dart';

class WeatherModel{
  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  double? maxWind;
  //int? avgRain;
  String? weatherStateName;
  WeatherModel({required this.date,required this.temp,required this.maxTemp,required this.minTemp,required this.maxWind,//required this.avgRain,
   required this.weatherStateName,});

  factory WeatherModel.fromJson(dynamic data) {
    var jasonData = data['list'];
    var jsonDataItem = jasonData[0]; // افترض أن العنصر الأول هو العنصر المطلوب
    return WeatherModel(
      date: jsonDataItem['dt_txt'],
      temp:jsonDataItem['main']['temp']- 273.15,
      maxTemp: jsonDataItem['main']['temp_max'] - 273.15,
      minTemp: jsonDataItem['main']['temp_min'] -273.15,
      maxWind: jsonDataItem['wind']['speed'],
      // avgRain: jsonDataItem['daily_chance_of_rain'],
      weatherStateName: jsonDataItem['weather'][0]['main'],
    );
  }


  String? getImage(){
   if (weatherStateName=='Clear'||weatherStateName=='Light Cloud'){
     return 'assets/images/clear.png';
   }
   else if (weatherStateName=='Sleet'||weatherStateName=='Snow'||weatherStateName=='Hail'){
     return 'assets/images/snow.png';
   }
   else if (weatherStateName=='Heavy Cloud'||weatherStateName=='Cloudy'||weatherStateName=='Clouds'){
     return 'assets/images/cloudy.png';
   }
   else if (weatherStateName=='Light Rain'||weatherStateName=='Showers '||weatherStateName=='Heavy Rain'||weatherStateName=='Patchy rain possible'||weatherStateName=='Rain'){
     return 'assets/images/rainy.png';
   }
   else if (weatherStateName=='Thunderstorm'||weatherStateName=='Thunder'){
     return 'assets/images/thunderstorm.png';
   }
   else{
     return 'assets/images/clear.png';
   }

 }

  MaterialColor getColor(){
    if (weatherStateName=='Clear'||weatherStateName=='Light Cloud'||weatherStateName=='Sunny'){
      return Colors.yellow;
    }
    else if (weatherStateName=='Sleet'||weatherStateName=='Snow'||weatherStateName=='Hail'){
      return Colors.blueGrey;
    }
    else if (weatherStateName=='Heavy Cloud'||weatherStateName=='Cloudy'||weatherStateName=='Clouds'){
      return Colors.blue;
    }
    else if (weatherStateName=='Light Rain'||weatherStateName=='Showers '||weatherStateName=='Heavy Rain'||weatherStateName=='Patchy rain possible'||weatherStateName=='Rain'){
      return Colors.lightBlue;
    }
    else if (weatherStateName=='Thunderstorm'||weatherStateName=='Thunder'){
      return Colors.orange;
    }
    else{
      return Colors.amber;
    }

  }

}