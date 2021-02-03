import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;


    String bgImage= data['isDaytime'] ? 'day.png': 'night.png';

    //Color for background of top space where time/ wifi and other things are shown
    Color bgColor= data['isDaytime'] ? Colors.blue: Colors.blue[900];

    print(data);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          //make container to fit the incoming image froom 'world_time'
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                //fit the image on screen
                fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(onPressed: ()async{
                  dynamic result=await Navigator.pushNamed(context, '/location');
                  // set 'choose_location' data in 'Home.dart'
                  setState(() {
                    data={
                      'time': result['time'],
                      'location': result['location'],
                      'flag': result['flag'],
                      'isDaytime': result['isDaytime']
                    };
                  });

                },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[350],
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}

