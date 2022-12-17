import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyContainer extends StatelessWidget {
  final String containerTitle;
  final String containerSVG;
  final  dynamic function;
  const MyContainer({Key? key,required this.function,required this.containerSVG,required this.containerTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black12,
                child: SvgPicture.asset('assets/icons/$containerSVG.svg',height: 35,color: Colors.deepOrange,)
                ),
              Text(
                containerTitle,
                style: const TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
