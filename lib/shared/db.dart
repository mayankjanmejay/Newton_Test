import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:newton_test/shared/models.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<bool> storeTournaments(List<NTournaments>? data)
async {
  SharedPreferences prefs = await SharedPreferences.getInstance();


  await prefs.setStringList('savedData', (data??[]).map((e) => jsonEncode(e.toJson())).toList());
  log('Tournaments Stored', name: 'storeTournaments', zone: Zone.current);
  return true;
}