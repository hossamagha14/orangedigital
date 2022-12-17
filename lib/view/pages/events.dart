import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.deepOrange),
          title: const Text(
            'Events',
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body:const Center(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Text('Wait for our upcoming events ...',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black54),),
          ),
        )
      
    );
  }
}