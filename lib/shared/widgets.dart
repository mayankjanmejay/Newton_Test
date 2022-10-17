import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimation extends StatefulWidget {
  LoadingAnimation({Key? key}) : super(key: key);

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Center( child:  Container(
      width: 50,
      height: 50,

       child: SpinKitWanderingCubes(

          color: Color.fromARGB(255, 74, 45, 238),
          size: 50.0,
       ),
    ));
  }
}



class ShowError extends StatefulWidget {

  String? title;
  String? message;
  ShowError({Key? key, this.message, this.title}) : super(key: key);

  @override
  _ShowErrorState createState() => _ShowErrorState();
}

class _ShowErrorState extends State<ShowError> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData=Theme.of(context);
    return Center( child:  Container(
 

       child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Icon(
                        Icons.error,
                        size: 50,
                        color: themeData.colorScheme.error,
                      )),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          "Whoops",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                              letterSpacing: 0.2
                          )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          children: <Widget>[
                            Text(
                              widget.title??"An error has occured!",
                              style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                              letterSpacing: 0.2
                          ),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                               "${widget.message??''}",
                                style:TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                              letterSpacing: 0.2
                          )
                            ),
                        )],
                        ),
                      )]))));
  }
}

