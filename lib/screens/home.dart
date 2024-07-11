import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/search.dart';

import '../providers/weather_provider.dart';
class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    var weatherData=Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
appBar: AppBar(
  title: const Text('Weather'),
  actions: [
    IconButton(onPressed: (){
      Navigator.push(context,MaterialPageRoute(builder:(BuildContext){
        return Search();
      }));
    }, icon:const Icon(Icons.search),)
  ],
),
      body:weatherData ==null? const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 20),
            child: Text(
                'there is no weather 😞 start searching now 🔍',
              style: TextStyle(
                fontSize:30,
              ),
        ),
          )
        ],
      ): Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              weatherData.getColor()[400]!,
              weatherData.getColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 3,),
            Text(Provider.of<WeatherProvider>(context).cityName!,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            const SizedBox(height: 25,),
            Text('updated at :  ${weatherData.date!}',style: const TextStyle(fontSize: 20,),),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(weatherData.getImage()!),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(' ${weatherData.temp!.toInt()}',style: const TextStyle(fontSize: 30,),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('maxTemp : ${weatherData.maxTemp != null ? weatherData.maxTemp!.toInt() : ""}', style: const TextStyle(fontSize: 17,),),
                      const SizedBox(height: 5,),
                      Text('minTemp : ${weatherData.minTemp != null ? weatherData.minTemp!.toInt() : ""}', style: const TextStyle(fontSize: 17,),),
                      const SizedBox(height: 5,),
                      Text('maxWind : ${weatherData.maxWind != null ? weatherData.maxWind!.toInt() : ""}', style: const TextStyle(fontSize:17,),),
                      const SizedBox(height: 5,),
                      //Text('avgRain : ${weatherData.avgRain!.toInt()}%',style: TextStyle(fontSize: 17,),),

                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25,),
            const Spacer(),
            Text(weatherData.weatherStateName!,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            const Spacer(flex: 6,),
          ],
        ),
      ),
    );
  }
}
