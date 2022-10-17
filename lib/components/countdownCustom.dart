import 'dart:async';

import 'package:flutter/material.dart';
class CountdownTimer extends StatefulWidget {

  final Duration duration;
  final TextStyle? textStyle1;
  final TextStyle? textStyle2;
  final bool mini;
  const CountdownTimer({super.key, required this.duration, required this.textStyle1, required this.textStyle2, required this.mini});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}


class _CountdownTimerState extends State<CountdownTimer> {
  // Step 2
  Timer? countdownTimer;
  late Duration myDuration;
  final TextStyle thick = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600
      );
  @override
  void initState() {
    myDuration=widget.duration;
    super.initState();
  }

  @override
  void dispose() {
   stopTimer();
   countdownTimer?.cancel();
    super.dispose();
  }
  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    startTimer();
  }
  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }
  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
  numberWithLabel({required String number, required String label})
  {
    return Column(children: [
      Text('$number', style: thick,),
      Text('$label', textScaleFactor: 0.9, style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300
      ),),
      
    ],);
  }
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return  Center(
        child:!widget.mini?  Container(
          height: 75,
          child: Column(
            children: [
              Container(
                height: 20,
                child: Text(
      'Incepe In:\n'.toUpperCase(),
    style: thick,
),
              ),
Row(children: [
  Container(width: 60, child: numberWithLabel(number: days, label: 'ZILE'),),
  Container(width: 30, child: numberWithLabel(number: hours, label: 'ORE'),),
  Container(width: 30, child: numberWithLabel(number: minutes, label: 'MIN'),),
  Container(width: 30, child: numberWithLabel(number: seconds, label: 'SEC'),),
  
],)
            ],
          ),
        ) : RichText(
  text: TextSpan(
    text:  days+'z',
    style: widget.textStyle1,
    children: [
      TextSpan(
        text: ' $hours : $minutes : $seconds',
        style: widget.textStyle2
      )
    ],
  ),
)  );
  }
}