import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time; // Time in that location
  String flag; // url to asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; // is day or night

  //constructor
  WorldTime({this.location,this.flag, this.url});


  Future<void> getTime() async{

    try{


//  simulate network request for user
      // String username= await Future.delayed(Duration(seconds: 3),(){
      //   return'ubaidullah';
      // });
      //
      //
      // String bio= await Future.delayed(Duration(seconds: 5),(){
      //   return'Very impressive Personality!';
      // });
      //
      //
      // print('$username-$bio');

      //
      // Response response=await get('https://jsonplaceholder.typicode.com/todos/1');
      // // print(response.body);
      //
      //
      // Map data=jsonDecode(response.body);
      // print(data);
      //
      // print(data['title']);


      //make the request for real data
      Response response=await get('http://worldtimeapi.org/api/timezone/$url');
      // decoding json format and map it
      Map data=jsonDecode(response.body);
      // print(data);
      // key value pairs we've convert it to string datetime
      String datetime=data['datetime'];
      //convert the string int substring
      String offset= data['utc_offset'].substring(1,3);

      // print(datetime);
      // print(offset);

      //class and we put String in it 'datetime'
      DateTime now = DateTime.parse(datetime);
      // storing string to an object
      now =now.add(Duration(hours: int.parse(offset)));
      // print(now);

      //  get properties from data


      //  set the time property
      //  convert object to string
      //   time= now.toString();

      time=DateFormat.jm().format(now);
      isDaytime= now.hour>5 && now.hour<19 ? true : false;




    }
    catch(e){
      print('Caught error: $e');
      time='could not get time data';
    }




  }

}

