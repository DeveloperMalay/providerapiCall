import 'package:catapp/data/model/cat_model.dart';
import 'package:catapp/data/repository/get_cat_details_repo.dart';
import 'package:flutter/material.dart';

enum HomeState { initial, loading, loaded, error }

class CatDetailsProider extends ChangeNotifier {
  List<Cat> dataList = [];

  void updateDataModel(List<Cat> dataList) {
    this.dataList = dataList;
    notifyListeners();
  }
}

// class CatDetailsProvider with ChangeNotifier {
//   HomeState _homeState = HomeState.initial;
//   List<Cat> catsData = [];
//   String message = '';
//   CatDetailsProvider() {
//     _fetchcatdata();
//   }
//   HomeState get homeState => _homeState;

//   Future<void> _fetchcatdata() async {
//     _homeState = HomeState.loading;
//     try {
//       await Future.delayed(const Duration(seconds: 5));
//       final apicat = await getcatDetails();
//       catsData = apicat;
//       _homeState = HomeState.loaded;
//     } catch (e) {
//       message = '$e';
//       _homeState = HomeState.error;
//     }
//     notifyListeners();
//   }
// }
