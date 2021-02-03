import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';



class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // int count=0;

  List<WorldTime> locations=[
    WorldTime(url: 'Africa/Abidjan', location: 'Abidjan', flag:'Abidjan.png' ),
    WorldTime(url: 'Africa/Accra', location: 'Accra', flag:'Accra.png' ),
    WorldTime(url: 'Africa/Algiers', location: 'Algiers', flag:'Algiers.png' ),
    WorldTime(url: 'Africa/Casablanca', location: 'Casablanca', flag:'casablanca morocco.jpg' ),
    WorldTime(url: 'Africa/Ceuta', location: 'Ceuta', flag:'ceuta.png' ),
    WorldTime(url: 'Africa/El_Aaiun', location: 'El_Aaiun', flag:'casablanca morocco.jpg' ),
    WorldTime(url: 'Africa/Bissau', location: 'Bissau', flag:'Bissau.png' ),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag:'Cairo.png' ),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag:'Pakistan.png' ),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag:'Kolkata.png' ),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag:'Riyadh.png' ),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag:'Istanbul.png' ),

  ];

  void updateTime(index)async{
    WorldTime instance= locations[index];
    await instance.getTime();
// Navigate to home screen
    Navigator.pop(context, {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime': instance.isDaytime,
    });
  }


  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  //print lcation
                  // print(locations[index].location);


                  updateTime(index);

                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),

            ),
          );

        },
      ),



      // body:  RaisedButton(
      //   onPressed: (){
      //     setState(() {
      //       count+=1;
      //     });
      //   },
      //   child: Text('counter-$count'),
      // ),
    );
  }
}
