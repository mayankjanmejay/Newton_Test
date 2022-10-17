import 'package:flutter/material.dart';

class UnderConstruction extends StatefulWidget {
  const UnderConstruction({super.key});

  @override
  State<UnderConstruction> createState() => _UnderConstructionState();
}

class _UnderConstructionState extends State<UnderConstruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 248, 249, 1.0),
      body: Center( 
        child: Image.asset('assets/images/uc.jpg'),
      ),
    );
  }
}