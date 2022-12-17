import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCard extends StatelessWidget {
  final String subject;
  final String lectureDate;
  final String startTime;
  final String endTime;
  const MyCard({ Key? key,required this.subject,required this.lectureDate,required this.startTime,required this.endTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: MediaQuery.of(context).size.width*0.98,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,10,0,0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(subject,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Row(
                      children: const[
                        Icon(Icons.timer_rounded),
                        Text('2hrs')
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('Lecture Date',style: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold),),
                      Row(
                        children:  [
                          SvgPicture.asset('assets/icons/event.svg',color: Colors.black87,),
                          Text(lectureDate)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Start Time',style: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          const Icon(Icons.watch_later,color: Colors.green,),
                          Text(startTime)
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text('End Time',style: TextStyle(color: Colors.black38,fontWeight: FontWeight.bold)),
                      Row(
                        children:  [
                          const Icon(Icons.watch_later,color: Colors.red,),
                          Text(endTime)
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}