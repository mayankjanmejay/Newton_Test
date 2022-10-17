import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newton_test/components/cardWithBG.dart';
import 'package:newton_test/components/tFlashCard.dart';
import 'package:newton_test/shared/db.dart';
import 'package:newton_test/shared/functions.dart';
import 'package:newton_test/shared/globals.dart';
import 'package:newton_test/shared/models/nTournaments.dart';
import 'package:newton_test/shared/webController.dart';
import 'package:newton_test/shared/widgets.dart';
import 'package:newton_test/views/tournament/tournamentType2FlashCardsBuilder.dart';
import 'package:socket_io_client/socket_io_client.dart';



class TournamentHome extends StatefulWidget {
  const TournamentHome({super.key});

  @override
  State<TournamentHome> createState() => _TournamentHomeState();
}

class _TournamentHomeState extends State<TournamentHome> {

  var opt = OptionBuilder().setTransports(['websocket']).setPath("/ws").disableAutoConnect().setQuery({'tenantId': 2, 'protocol': 'sio1'}).build();
  late Socket socket;

@override
  void dispose() {
    socket.close();
    super.dispose();
  }
@override
  void initState() {
    
    socket = io('https://test1-micros-1.play-online.com', opt);
    attachListeners(socket);  
    super.initState();
  }

  attachListeners(Socket inComingSocket)
  {
    //Assumption: in coming data is in Map<String, dynamic>
    inComingSocket.on('tournament_end', (data) {

     log('Websocket: tournament_end', name: 'TournamentHome initState', zone: Zone.current);

    var thisTournament = NTournaments.fromJson(data);

    if (savedTournaments!=null)
    {
      var index = savedTournaments?.indexWhere((element) => element.id==thisTournament.id);

      if (index!=null)
        {
          log('Websocket: tournament_end found in list and updated', name: 'TournamentHome initState', zone: Zone.current);
          savedTournaments![index] = thisTournament;
        }      
    }    

  });
  inComingSocket.on('tournament_created', (data) {
    setState(() {
       savedTournaments?.add(NTournaments.fromJson(data));
         log('Websocket: tournament_created & added', name: 'TournamentHome initState', zone: Zone.current);
    });
  });
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(    
      body:savedTournaments==null || savedTournaments!.isEmpty? Center(
        child: ElevatedButton(
          onPressed: () async {
            savedTournaments = await fetchTournamentData();
            setState(() {
              
            });
            
           var done = await storeTournaments(savedTournaments);
            if (done)
            {
              snackBat(context: context, text: 'Data Saved', bgColor: Colors.green.shade700, textColor: Colors.white, duration: Duration(seconds: 5));
            }
            else 
            {
              snackBat(context: context, text: 'Data NOT Saved', bgColor: Colors.red.shade700, textColor: Colors.white, duration: Duration(seconds: 5));
            }
          },
          child: const Text('Download Tournament Groups'),
        ),
      ):  ListView.builder(
              itemCount: savedTournaments?.length,
   
              itemBuilder: (BuildContext context, int index) {


                return savedTournaments?.elementAt(index).type==2? Container ( 
                  height:(savedTournaments?.elementAt(index).tournaments?.length??0)>0? 
                  savedTournaments?.elementAt(index).tournaments?.length==2? 650:420:0,
                  child:Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(savedTournaments?.elementAt(index).name??'', style: TextStyle(color: Colors.white, 
                        fontSize: 24),),
                      ),
                      Container(
                        height:savedTournaments?.elementAt(index).tournaments?.length==2? 600: 370,
                        child:savedTournaments?.elementAt(index).tournaments?.length==2? 
                        CardWithBg(child: TournamentType2FlashCardsBuilder(tournaments: savedTournaments?.elementAt(index).tournaments))                        :
                        TournamentType2FlashCardsBuilder(tournaments: savedTournaments?.elementAt(index).tournaments)),
                    ],
                  )): Container(
                    height: 0,
                  );
              },
            ));
            



           ;
  }
}