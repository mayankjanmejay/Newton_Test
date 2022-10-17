
import 'dart:developer';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:localize_and_translate/localize_and_translate.dart';

width(BuildContext context)
{
  return MediaQuery.of(context).size.width;
}


height(BuildContext context)
{
  return MediaQuery.of(context).size.height;
}
navTo(Widget widget, BuildContext context)
{
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

navToReplace(Widget widget, BuildContext context)
{
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

cleanDate(DateTime? curr)
{
  if (curr==null)
  {
    return 'N/A';
  }
  return '${curr.day}/${curr.month}/${curr.year}';
}
cleanDateTime(DateTime? curr)
{
  if (curr==null)
  {
    return 'N/A';
  }

  String min=curr.minute<9?'0'+curr.minute.toString() :curr.minute.toString();
  String hour=curr.hour<9?'0'+curr.hour.toString() :curr.hour.toString();
  
  return '${curr.day}/${curr.month}/${curr.year} ${hour}:${min}';
}
cleanTime(DateTime curr)
{
  if (curr==null)
  {
    return 'N/A';
  }
    String min=curr.minute<9?'0'+curr.minute.toString() :curr.minute.toString();
  String hour=curr.hour<9?'0'+curr.hour.toString() :curr.hour.toString();
  return '${hour}:${min}';
}

keyedAlertBat(GlobalKey<NavigatorState> _navigatorKey, {Widget? title, Widget? content, List<Widget>? actions, bool? barrierDismissible} )
async {

    return await showDialog(  
      barrierDismissible: barrierDismissible??false,
        context: _navigatorKey.currentContext!,  
        builder: (context) {  
          return AlertDialog(  
            title: title?? new Text('Alert'.tr()),  
            content: content?? new Text('No content defined'.tr()),  
            actions: actions?? [
              IconButton(icon: Icon(Icons.check_circle, color: Colors.black,), onPressed: () {
                Navigator.of(context).pop();
                
              },)
            ],  
          );  
        });  
 
}

alertBat(BuildContext context, {Widget? title, Widget? content, List<Widget>? actions, bool? barrierDismissible} )
async {

    return await showDialog(  
      barrierDismissible: barrierDismissible??false,
        context: context,  
        builder: (context) {  
          return AlertDialog(  
            title: title?? new Text(translator.translate('Alert')),  
            content: content?? new Text(translator.translate('No content defined')),  
            actions: actions?? [
              IconButton(icon: Icon(Icons.check_circle, color: Colors.black,), onPressed: () {
                Navigator.of(context).pop();
                
              },)
            ],  
          );  
        });  
 
}

  void snackBat({required BuildContext context,required String text,required Color bgColor,required Color textColor, required Duration duration}) {
    final snackBar = SnackBar(content: Text(text, style: TextStyle(color: textColor),), backgroundColor: bgColor, duration: duration,);

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


monthIntToString(int month)
{
  print('Month '+month.toString());
  switch (month) {
    case 0:
    log('Month was null', name: 'monthIntToString', zone: Zone.current);
    return 'Error';
    case 1:
    return 'Jan';

    case 2:
    return 'Feb';

    case 3:
    return 'Mar';

    case 4:
    return 'Apr';

    case 5:
    return 'May';

    case 6:
    return 'Jun';

    case 7:
    return 'Jul';

    case 8:
    return 'Aug';

    case 9:
    return 'Sep';

    case 10:
    return 'Oct';

    case 11:
    return 'Nov';

    case 12:
    return 'Dec';   
     
  }
}