import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:game_app/models/get_concurs_model.dart';
import 'package:game_app/models/get_gifts_model.dart';
import 'package:game_app/models/user_models/auth_model.dart';

import '../models/con_catigory.dart';

class ConCatigoryProvider with ChangeNotifier {
  bool isLoading = false;
  bool waiting = false;
  List<ConCatigory> conCatigory = [];

  static Dio dio = Dio();

  Future<void> getConCatigory(BuildContext context) async {
    isLoading = true;

    final token = await Auth().getToken();
    conCatigory = [];

    try {
      var response = await dio.get(
        "http://216.250.11.240/api/category/",
      );

      if (response.statusCode == 200) {
        if (response.data != null) {
          conCatigory = List<ConCatigory>.from(response.data.map((e) {
            return ConCatigory.fromJson(e);
          }));
          print(response.data);
          isLoading = false;
          notifyListeners();
        }

        return;
      }
      // ignore: deprecated_member_use
    } on DioError {
      isLoading = false;

      notifyListeners();
    }
    return;
  }
}

class getGiftsProvider with ChangeNotifier {
  bool isLoading = false;
  bool waiting = false;
  List<GiftsMOdel> giftsCart = [];

  static Dio dio = Dio();

  Future<void> getGiftsCart(BuildContext context) async {
    isLoading = true;

    final token = await Auth().getToken();
    giftsCart = [];

    try {
      var response = await dio.get(
        "http://216.250.11.240/api/category/getGifts/",
      );

      if (response.statusCode == 200) {
        if (response.data != null) {
          giftsCart = List<GiftsMOdel>.from(response.data.map((e) {
            return GiftsMOdel.fromJson(e);
          }));
          print(response.data);
          isLoading = false;
          notifyListeners();
        }

        return;
      }
      // ignore: deprecated_member_use
    } on DioError {
      isLoading = false;

      notifyListeners();
    }
    return;
  }
}

class getConcursProvider with ChangeNotifier {
  bool isLoading = false;
  bool waiting = false;
  List<GEtConcursModel> concursCart = [];

  static Dio dio = Dio();

  Future<void> getConcursCart(BuildContext context) async {
    isLoading = true;

    final token = await Auth().getToken();
    concursCart = [];

    try {
      var response = await dio.get(
        "http://216.250.11.240/api/category/getkonkurs/",
      );

      if (response.statusCode == 200) {
        if (response.data != null) {
          concursCart = List<GEtConcursModel>.from(response.data.map((e) {
            return GEtConcursModel.fromJson(e);
          }));
          print(response.data);
          isLoading = false;
          notifyListeners();
        }

        return;
      }
      // ignore: deprecated_member_use
    } on DioError {
      isLoading = false;

      notifyListeners();
    }
    return;
  }
}

class getConcursByIDProvider with ChangeNotifier {
  bool isLoading = false;
  bool waiting = false;
  GEtConcursModel? concursCartById;

  static Dio dio = Dio();

  Future<void> getConcursCartById(BuildContext context, String id) async {
    isLoading = true;

    final token = await Auth().getToken();

    try {
      var response = await dio.get(
        "http://216.250.11.240/api/category/getkonkurs/$id/",
      );

      if (response.statusCode == 200) {
        if (response.data != null) {
          concursCartById = GEtConcursModel.fromJson(response.data);
          print(response.data);
          isLoading = false;
          notifyListeners();
        }

        return;
      }
      // ignore: deprecated_member_use
    } on DioError {
      isLoading = false;

      notifyListeners();
    }
    return;
  }
}
