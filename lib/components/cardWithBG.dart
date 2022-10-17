import 'package:flutter/material.dart';

class CardWithBg extends StatefulWidget {
  final Widget child;
  const CardWithBg({super.key, required this.child});

  @override
  State<CardWithBg> createState() => _CardWithBgState();
}

class _CardWithBgState extends State<CardWithBg> {
  @override
  Widget build(BuildContext context) {

    final RoundedRectangleBorder shape = RoundedRectangleBorder( 
      
        borderRadius:BorderRadius.circular(20) ,
        
        
        side: BorderSide(
          width: 2,
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ));
    return Container(

      child: Card(
              elevation: 5,
shape: shape,
              color: Theme.of(context).colorScheme.surface,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage( 'https://t5a4q7k3.stackpathcdn.com/img-tournament-fighter-1649928344018.jpg')),
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 225, 5, 0),
                  child: Container(
                
                    child: widget.child),
                ))),
    );
  }
}