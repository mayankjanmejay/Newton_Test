import 'package:flutter/material.dart';
import 'package:newton_test/components/countdownCustom.dart';

class CountDown extends StatefulWidget {
  final DateTime countDownTo;
  final TextStyle textStyle1;
  final TextStyle textStyle2;
  final bool mini;
  CountDown({super.key, required this.countDownTo, required this.textStyle1, required this.textStyle2, required this.mini});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {

  late final Duration _duration;


  @override
  void initState() {
    _duration = DateTime.now().difference(widget.countDownTo);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.black,
      height: 30,
      width: 130,
      child: CountdownTimer (duration: _duration, textStyle1: widget.textStyle1, textStyle2: widget.textStyle2, mini: widget.mini,));
    // return SlideCountdown(
    //   textStyle:widget.textStyle ,
    //   decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0)), color:Colors.black),
    //   shouldShowDays:(Duration remainingDuration) => remainingDuration.inDays >= 1, 
    //           duration: _duration,
    //           padding: EdgeInsets.all(5),
    //           slideDirection: SlideDirection.up,                
    //           );
  }
}