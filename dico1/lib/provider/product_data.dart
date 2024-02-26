import 'dart:convert';

import 'package:dico1/model/tourism_place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductData with ChangeNotifier {
  String urlMaster =
      "https://doscom-university-m2h6f.ondigitalocean.app/api/v1/tourism-places/";

  List<TourismPlace> _allData = [];
  List<TourismPlace> get allData => _allData;

  Future<void> fetchData() async {
    _allData = [];
    try {
      final response = await http.get(Uri.parse(urlMaster));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body)['data'];
        print(responseData);
        for (var item in responseData) {
          // print(item);
          // print(_allData);
          _allData.add(TourismPlace.fromJson(item));
          // print("data baru: $_allData");
        }
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  void toggleFavorite(int id) {
    final index = _allData.indexWhere((place) => place.id == id);
    if (index != -1) {
      _allData[index].isFavorite = !_allData[index].isFavorite;
      notifyListeners();
    }
  }
}
