import 'dart:convert';
import 'dart:developer';

import 'package:alfred_test/models/episodes.dart';
import 'package:alfred_test/models/locations.dart';
import 'package:flutter/material.dart';

import '../models/character.dart';
import 'package:http/http.dart' as http;

class ApiRemote {
  Future<List<Results>?> getCharacters(pageKey) async {
    var response = await http.get(Uri.parse(
        'https://rickandmortyapi.com/api/character/?page=' +
            pageKey.toString().substring(0, 1)));
    var characterResponse = CharacterModel.fromJson(json.decode(response.body));
    return characterResponse.results;
  }

  Future<EpisodesModel> getEpisodes() async {
    var response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/episode/'));
    var episodeResponse = EpisodesModel.fromJson(json.decode(response.body));
    return episodeResponse;
  }

  Future<LocationsModel> getLocations(pageKey) async {
    var response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/location'));
    var locationResponse = LocationsModel.fromJson(json.decode(response.body));
    return locationResponse;
  }

  Future<ResultsL> getLocationWithMaxResidents() async {
    List<ResultsL> resultsA = [];
    var responseInit = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/location/?page=1'));
    var locationResponseInit =
        LocationsModel.fromJson(json.decode(responseInit.body));

    for (var i = 1; i < locationResponseInit.info!.pages!.toInt(); i++) {
      var responseInit = await http.get(Uri.parse(
          'https://rickandmortyapi.com/api/location/?page=' + i.toString()));
      var locationResponseInit =
          LocationsModel.fromJson(json.decode(responseInit.body));
      for (var i = 0; i < locationResponseInit.results!.length; i++) {
        resultsA.add(locationResponseInit.results![i]);
      }
    }

    /* get The Location Result With More Residents */
    var max = 0;
    var maxIndex = 0;
    for (var i = 0; i < resultsA.length; i++) {
      if (resultsA[i].residents!.length > max) {
        max = resultsA[i].residents!.length;
        maxIndex = i;
      }
    }
    return resultsA[maxIndex];
  }
}

final apiRemote = ApiRemote();
