import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';


const colorRed=Color.fromRGBO(231, 28, 36, 1);
const colorDark=Color.fromRGBO(136, 28, 32, 1);
const colorGreen=Color.fromRGBO(36, 191, 115, 1);
const colorBlue=Color.fromRGBO(52, 152, 219, 1.0);
const colorOrange=Color.fromRGBO(230, 126, 34, 1.0);
const colorWhite=Color.fromRGBO(255, 255, 255, 1.0);
const colorDarkBlue=Color.fromRGBO(44, 62, 80, 1.0);
const colorLightGray=Color.fromRGBO(135, 142, 150, 1.0);
const colorLight=Color.fromRGBO(211, 211, 211, 1.0);

 SliverGridDelegateWithFixedCrossAxisCount  ProductGridViewStyle(){
   return SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 2,
     mainAxisSpacing: 2,
     mainAxisExtent: 250,
   );
 }


void ErrorToast(msg){

  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );

}



void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: Colors.white,
      fontSize: 16.0
  );
} 


ScreenBackground(context){

   return SvgPicture.asset(
   'assets/images/background.png',
   alignment: Alignment.center,
     width:MediaQuery.of(context).size.width ,
   height: MediaQuery.of(context).size.height,
   fit: BoxFit.cover,
 );
}



InputDecoration AppInputDecoration(label){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: colorGreen,width: 1)

    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
  borderSide: const BorderSide(color: colorWhite,width: 0)
    ),
    border: OutlineInputBorder(),
    labelText: label,
  );
}

DecoratedBox AppDropDownStyle(child){
  return DecoratedBox(
    decoration: BoxDecoration(
      color: colorWhite,border: Border.all(color: colorWhite,width: 1),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 30,right: 30),
      child: child,
    ),
  );
}


ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.all(0),
    primary: Colors.green,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}




 Ink SuccessButtonChild(ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),

    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(ButtonText,style: TextStyle(
          fontWeight: FontWeight.w400,
      ),),
    ),


  );
}
