
import 'package:flutter/material.dart';
import 'package:login_app/colores.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key, required this.buttonName, 
  }) : super(key: key);

 final String buttonName;
 
  
  @override
  
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ) ,
      child: TextButton(
        child: Text(buttonName, style: kBodyText.copyWith(fontWeight: FontWeight.bold),),
        onPressed: (){},
        )
      );
  }
}