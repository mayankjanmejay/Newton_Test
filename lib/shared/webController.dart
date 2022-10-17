import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:newton_test/shared/models/nTournaments.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
webSocketConnection()
{
  var opt = OptionBuilder().setTransports(['websocket']).setPath("/ws").disableAutoConnect().setQuery({'tenantId': 2, 'protocol': 'sio1'}).build();

Socket socket = io('https://test1-micros-1.play-online.com', opt);


socket.on('tournament_end', (data) => print(data));
socket.on('tournament_created', (data) => print(data));


}



Future<List<NTournaments>?> fetchTournamentData({String? endpoint}) async {

  Uri uri = Uri.parse('https://test1-micros-1.play-online.com/missions/tournaments/list?tenant_id=2');
  
  final response = await get(uri);
  log('Data received, computing now', name: 'webController fetchTournamentData', zone: Zone.current);
  return compute(parseLocations, response.body);

}

List<NTournaments>? parseLocations(String responseBod) {
  try {
      return List<NTournaments>.from(json.decode(responseBod).map((x) => NTournaments.fromJson(x)));
  } on Exception catch (_, e) {
    log('Parsing Error', name: 'webController parseLocations', zone: Zone.current, error: e, );
    return null;
  }
  

}
