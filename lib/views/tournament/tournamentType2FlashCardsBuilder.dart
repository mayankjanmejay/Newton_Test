import 'package:flutter/material.dart';
import 'package:newton_test/components/tFlashCard.dart';
import 'package:newton_test/shared/models/nTournaments.dart';

class TournamentType2FlashCardsBuilder extends StatefulWidget {

  final List<Tournament>? tournaments;
  const TournamentType2FlashCardsBuilder({super.key, required this.tournaments});

  @override
  State<TournamentType2FlashCardsBuilder> createState() => _TournamentType2FlashCardsBuilderState();
}

class _TournamentType2FlashCardsBuilderState extends State<TournamentType2FlashCardsBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.tournaments?.length,
      itemBuilder: (BuildContext context, int index) {
        return index%2==0?  
        
        TFlashCardType2(tournament: widget.tournaments?.elementAt(index), mini: false,):  
        TFlashCardType2(tournament: widget.tournaments?.elementAt(index), mini: true,);
      },
    );
  }
}