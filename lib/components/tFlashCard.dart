import 'dart:math';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:newton_test/components/countdownCustom.dart';
import 'package:newton_test/components/imageCountDown.dart';
import 'package:newton_test/components/imageWithText.dart';
import 'package:newton_test/shared/functions.dart';
import 'package:newton_test/shared/models/enums.dart';

import 'package:newton_test/shared/models/nTournaments.dart';
import 'package:newton_test/shared/widgets.dart';

class TFlashCardType2 extends StatefulWidget {

  final Tournament? tournament;
  final bool mini;
  const TFlashCardType2({super.key, required this.tournament, required this.mini});

  @override
  State<TFlashCardType2> createState() => _TFlashCardType2State();
}

class _TFlashCardType2State extends State<TFlashCardType2> {

  final Random random = Random();
  final TextStyle leiStyle = TextStyle(
                      color: Color.fromRGBO(43, 207, 255, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w800
                    );
final TextStyle pointsStyle = TextStyle(
                      color: Color.fromRGBO(43, 207, 255, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w300
                    );
  
  @override
  Widget build(BuildContext context) {

    int startDay = widget.tournament?.startDate?.day??1;
    int startMonth = widget.tournament?.startDate?.month??0;
    int endDay = widget.tournament?.startDate?.day??1;
    int endMonth = widget.tournament?.startDate?.month??0;
    
    
    String startDate = startDay.toString() + ' '+ monthIntToString(startMonth);;
    String endDate = endDay.toString() + ' '+ monthIntToString(endMonth);;
    
    var themeData = Theme.of(context);
    final RoundedRectangleBorder shape = RoundedRectangleBorder( 
        borderRadius:BorderRadius.circular(20) ,
        
        side: BorderSide(
          width: 2,
      color: themeData.colorScheme.secondary.withOpacity(0.5),
      ));
    LanguageCodes lang = langCodes.map[translator.activeLanguageCode]??LanguageCodes.RO;
    return Column(
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Text('$startDate - $endDate', textAlign: TextAlign.left,),
           ],
         ),
      
        Expanded(
          child: Card(
            elevation: 5,
shape: shape,
            color: themeData.colorScheme.surface,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20) ,
                gradient: const  LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(20, 34, 50, 1),
                      Color.fromRGBO(55, 16, 99, 1),
                      
               
                    ],
                  ),
                  shape: BoxShape.rectangle
            
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      child: Row(
                 
                        children: [
                        Image.network(widget.tournament?.meta?.ui?.cornerImage?.url??'', 
                        height: 70,
                         loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress?.cumulativeBytesLoaded==loadingProgress?.expectedTotalBytes)
                          {
                            return child;
                          }
                           return LoadingAnimation();
                         },),
                      

                       Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.topRight,
                        width: widget.mini? 100: 200,
                        height: 70,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(lang==LanguageCodes.RO? 
                              widget.tournament?.meta?.ui?.prize1?.text?.ro??''
                              :  widget.tournament?.meta?.ui?.prize1?.text?.en??'', style: leiStyle,),
                              Text(lang==LanguageCodes.RO? 
                              widget.tournament?.meta?.ui?.prize2?.text?.ro??''
                              :  widget.tournament?.meta?.ui?.prize2?.text?.en??'', style: pointsStyle, ),
                              
                          ],
                        ),
                       )

                      ],),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(8),
                  child: Text((widget.tournament?.name??'').toUpperCase(), style:const TextStyle(
                    color: Color.fromRGBO(181, 156, 137, 1.0),
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 2,
                      width: widget.mini? 180: 275,
                      color: Colors.white,),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Container(
                        height: 90,
                        width:  95,
                        child: ImageWithText(imageUrl: widget.tournament?.meta?.ui?.gamesImage?.url??'', text: random.nextInt(50).toString())),
                        SizedBox(
                          width: 27,
                        ),

                     widget.mini? Container():  Container(
                        height: 90,
                        width: 125,
                        child: ImageWithCountdown( imageUrl: widget.tournament?.meta?.ui?.topImage?.url??'', 
                          endTime: widget.tournament?.endDate, imageHeight: 90, level: widget.tournament?.meta?.levels.toString()??'',),
                      )
                    ],),
                  ),
                  
widget.mini? Container(): Container(
                      width: 275,
                      height: 25,
                      decoration: BoxDecoration(
                        gradient: const RadialGradient(
                          radius :5,
                          focalRadius: 10,                    
                          colors: [
                          Color.fromRGBO(255, 25, 110, 1.0),
                          Color.fromRGBO(133, 13, 57, 1.0),                    
                        ]

                        )
                      ),
                      child: Center(
                        child: Text('Nu esti inca insris', textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
widget.mini? Container(): Container(
                      width: 275,
                      height: 35,
                      decoration:const BoxDecoration(
                        borderRadius:  BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                        gradient: LinearGradient(
                      
                          colors: [
                          Color.fromRGBO(234, 3, 78, 1.0),
                          Color.fromRGBO(57, 0, 240, 1.0),                    
                        ]

                        )
                      ),
                      child: Center(
                        child: Text('Participa'.toUpperCase(), textAlign: TextAlign.center,style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),),
                      ),
                    ),
                    
widget.mini? Padding(
  padding: const EdgeInsets.all(8.0),
  child:   CountdownTimer(duration: DateTime.now().difference(widget.tournament?.endDate??DateTime.now()), 
  
  
  
                                    textStyle1: null, 
  
  
  
                                    textStyle2: null, 
  
  
  
                                    mini: false),
): Container()
                ],
              ),
            ),
            
          ),
        ),
      ],
    );
  }
}