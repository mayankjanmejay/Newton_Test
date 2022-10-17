import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ImageWithText extends StatefulWidget {
  final String imageUrl;
  final String text;
  const ImageWithText({super.key, required this.imageUrl, required this.text});

  @override
  State<ImageWithText> createState() => _ImageWithTextState();
}

class _ImageWithTextState extends State<ImageWithText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
         fit: BoxFit.fill,
         image: NetworkImage(widget.imageUrl)
      ),
    border: Border.all(
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
  ),
      child:Padding(
      padding: EdgeInsets.only(bottom: 0), //some spacing to the child from bottom
      child: Text('+'+widget.text+' '+ 'games'.tr(), textAlign: TextAlign.center,style: TextStyle(

        shadows: <Shadow>[
      Shadow(
        offset: Offset(0.2, 0.2),
        blurRadius: 3.0,
        color: Color.fromARGB(124, 84, 84, 85),
      ),
      Shadow(
        offset: Offset(0.5, 0.1),
        blurRadius: 3.0,
        color: Color.fromARGB(124, 84, 84, 85),
      ),
    ],
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w900
        ),))
   
    );
  }
}