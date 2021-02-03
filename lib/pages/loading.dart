import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {


  void setWorldTime() async{

    WorldTime instance= WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime': instance.isDaytime,
    });


  }



  @override
  void initState() {
    super.initState();
    // print('init function ran');
    setWorldTime();
    // print('statement run in init!');

  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
        //Adding spinner in Loading screen
        child:SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),

    );
  }
}
