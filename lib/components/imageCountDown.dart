import 'package:flutter/material.dart';
import 'package:newton_test/components/countdown.dart';

class ImageWithCountdown extends StatefulWidget {
  final String imageUrl;
  final String level;
  final DateTime? endTime;
  final double imageHeight;
  const ImageWithCountdown({super.key, required this.imageUrl, required this.endTime, required this.imageHeight, required this.level, });

  @override
  State<ImageWithCountdown> createState() => _ImageWithCountdownState();
}

class _ImageWithCountdownState extends State<ImageWithCountdown> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        
    
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.network(widget.imageUrl, height: widget.imageHeight,)),
               Container(
                alignment: Alignment.center,
                child: Text(
                  'Top\n${widget.level}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0),
                )),
          ],
        ),
      ),
      Positioned(
        bottom: 0.1,

        height: 25,
        child:widget.endTime==null? Container(): CountDown(
          mini: true,
          countDownTo: widget.endTime!,  textStyle1: TextStyle(
          fontSize: 14,
          color: Color.fromRGBO(220, 114, 87, 1.0),
          fontWeight: FontWeight.w800
        ), textStyle2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color.fromRGBO(243, 105, 6, 1.0)
        ),  ),
      )
    ],);
  }
}