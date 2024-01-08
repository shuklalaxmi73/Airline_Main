import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/app_styles.dart';


class AppDobleTextWidget extends StatelessWidget {
  final String bigText;
  final String smallText;
  const AppDobleTextWidget({Key? key, required this.bigText,required this.smallText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(bigText, style: Styles.headlineStyle2,),
        InkWell(
            onTap: (){
              print("You are tapped");
            },
            child: Text(smallText,style: Styles.textStyle.copyWith(color: Styles.primaryColor),)),
      ],
    );
  }
}