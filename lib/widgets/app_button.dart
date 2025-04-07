import 'package:flutter/material.dart';
import 'package:tourists_guide/widgets/app_text.dart';

class AppButton extends StatelessWidget {

  final Color color;
  final Color backgroundColor;
  String? text;
  IconData? icon;
  bool? isIcon;
  final double size;
  final Color borderColor; 
  AppButton({super.key, 
  required this.color,
   required this.backgroundColor,
    required this.size,
     required this.borderColor,
     this.text="Hi",
     this.icon,
     this.isIcon =false});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: size,
       height: size,
       decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15)
       ),

       child: isIcon==false?Center(child: AppText(text: text!,color: color,)) : Center(child: Icon(icon,color: color,)),
    );
  }
}