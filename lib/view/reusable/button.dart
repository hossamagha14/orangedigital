import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double mywidth;
  final double myheight;
  final Color color;
  final String buttonName;
  final Color textColor;
  final dynamic function;
  
  const MyButton(
      {Key? key,
      required this.mywidth,
      required this.color,
      required this.buttonName,
      required this.textColor,
      required this.myheight,
      required this.function,
      
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * mywidth,
      height: myheight,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(color: Colors.deepOrange)))),
          onPressed: function,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Text(
                buttonName,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              
            ],
          )),
    );
  }
}
