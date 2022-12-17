import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final String buttonText;
  final dynamic function;
  const SettingsButton({Key? key, required this.buttonText,required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: function,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  buttonText,
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width * 0.95,
          color: Colors.black26,
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
