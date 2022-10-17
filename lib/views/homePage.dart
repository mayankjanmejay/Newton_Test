import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:newton_test/views/tournament/tournamentHome.dart';
import 'package:newton_test/views/underConstruction.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    //The implemented UI does not contain a language switch and the data being pulled does not have all translations so loading ro
    translator.setNewLanguage(context, newLanguage: 'ro', remember: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
            leading:GestureDetector(

              onTap: () {
                if (Scaffold.hasDrawer(context))
                {
                  Scaffold.of(context).openDrawer();
                }
                
              },
              child:  Image.asset('assets/images/menu.png'),
            ),
            
            bottom: TabBar(
              indicatorWeight: 5,
              padding:const EdgeInsets.all(2),
              indicatorColor:const Color.fromRGBO(253, 110, 0, 1.0),
              labelPadding:const EdgeInsets.all(2),
              labelStyle:const TextStyle(fontSize: 12),
              tabs: [
                Tab(icon: Image.asset('assets/icons/home.png', height: 35,),text: 'Acasa',  ),
                Tab(icon: Image.asset('assets/icons/search.png', height: 35,),text: 'Cauta',),
                Tab(icon: Image.asset('assets/icons/slots.png', height: 35,),text: 'Slots',),
                Tab(icon: Image.asset('assets/icons/rulet.png', height: 35,),text: 'Ruleta',),
                Tab(icon: Image.asset('assets/icons/casino.png', height: 35,),text: 'Casino',),
                Tab(icon: Image.asset('assets/icons/tour.png', height: 35,),text: 'Turnee',),
                Tab(icon: Image.asset('assets/icons/instant.png', height: 35,),text: 'Instant',),     
                Tab(icon: Image.asset('assets/icons/fav.png', height: 35,),text: 'Favorite',),                   
              ],
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/logo.png', height: 25,),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
Color.fromRGBO(255, 194, 0, 1.0),
Color.fromARGB(255, 212, 163, 0),
        ]),

      ),
                child: ElevatedButton(onPressed:  () {}, child: Text('Înregistrare'.toUpperCase()), style:   ElevatedButton.styleFrom(
                  elevation: 5,
                  side: BorderSide(width: 3.0, color: Colors.black,),
                  backgroundColor : Colors.transparent,
                  shadowColor: Colors.black,
                  
                  textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w900))),
              ),

              Container(
                decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
Color.fromARGB(255, 0, 17, 255),
Color.fromARGB(255, 0, 102, 255)
        ]),

      ),
                child: ElevatedButton(onPressed:  () {}, child: Text('Conectare'.toUpperCase()), style:   ElevatedButton.styleFrom(
                  elevation: 5,
                  side: BorderSide(width: 3.0, color: Colors.black,),
                  backgroundColor : Colors.transparent,
                  shadowColor: Colors.black,
                  
                  textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w900))),
              ),

              
            ],
          ),
          body: const TabBarView(
            children: [            
            UnderConstruction(),
            UnderConstruction(),
            UnderConstruction(),
            UnderConstruction(),
            UnderConstruction(),
            TournamentHome(),
            UnderConstruction(),
            UnderConstruction(),
            
            
            ],
          ),
        ),
      );
  }
}