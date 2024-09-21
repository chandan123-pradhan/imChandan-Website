import 'package:flutter/material.dart';
import 'package:my_website/utils/color_constant.dart';
import 'package:my_website/utils/globalMethods.dart';

class BottonWidgets{
 static Widget getMainBotton({required BuildContext context,required String title, required Function onPressed}){
    return Container(
      height: displayHeight(context)/20,
      width: displayWidth(context)/10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8
        ),
        color: ColorConstant.lightRedColor
      ),
      alignment: Alignment.center,
      child: Text(title
      ,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600
      ),
      ),
    );
  }


static Widget textBotton({required String title,required BuildContext context,required Function onPressed})
{
  return Container(
    alignment:Alignment.center,
    height: displayHeight(context)/20,
    child: Text(title,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
    ),
  );
}


static Widget textBottonWithIcon({required String title,required BuildContext context,required Function onPressed,

required IconData icon
})
{
  return Container(
    alignment:Alignment.center,
    height: displayHeight(context)/20,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600
        ),
        ),
        Icon(icon,
        size: 15,
        
        )
      ],
    ),
  );
}

}