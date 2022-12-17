import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  final String textFormFieldLabel;
  final Widget ? textFormFieldIcon;
  final Icon ? preTextFormFieldIcon;
  final EdgeInsets ? size;
  final bool  showText;
  final dynamic control;
  const MyTextFormField({ Key? key,required this.textFormFieldLabel, this.textFormFieldIcon,this.preTextFormFieldIcon,this.size,required this.showText,required this.control}) : super(key: key);

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: widget.showText,
        controller: widget.control,
        decoration: InputDecoration(
          contentPadding: widget.size,
          suffixIcon: widget.textFormFieldIcon,
          prefixIcon: widget.preTextFormFieldIcon,
          labelText: widget.textFormFieldLabel,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
        ),
      ),
    );
  }
}