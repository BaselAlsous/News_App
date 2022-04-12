// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/Constents/constents_variable.dart';
import 'package:test/Data/Api/dio_helper.dart';
import 'package:test/Presintation/Screens/business.dart';
import 'package:test/Presintation/Screens/science.dart';
import 'package:test/Presintation/Screens/sport.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> pages = [
    const BuisnessScreen(),
    const ScienceScreen(),
    const SportScreen(),
  ];

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sport'),
  ];

  // todo: Function To Do Bottom Nvaigation Bar
  void bottomNavBar({required int index}) {
    currentIndex = index;
    if (currentIndex == 1) {
      getAllScienceData();
    }
    if (currentIndex == 2) {
      getAllSportData();
    }
    emit(NewsLocatyinNavBar());
  }

  // todo: Function To Get All Buiseness Data From Api
  List<dynamic> buisness = [];

  void getAllBuisnessData() {
    emit(GetBuisnessDataLoading());
    DioHelper.getAllData(
      method: ConstentsVariable.method,
      qurey: ConstentsVariable.qureyBusiness,
    ).then((value) {
      buisness = value!.data['articles'];
      emit(GetBuisnessDataSaccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetBuisnessDataErorr());
    });
  }

  // todo: Function To Get All Science Data From Api
  List<dynamic> science = [];

  void getAllScienceData() {
    if (science.isEmpty) {
      emit(GetScienceDataLoading());
      DioHelper.getAllData(
        method: ConstentsVariable.method,
        qurey: ConstentsVariable.qureyScience,
      ).then((value) {
        science = value!.data['articles'];
        emit(GetScienceDataSaccess());
      }).catchError((error) {
        print(error.toString());
        emit(GetScienceDataErorr());
      });
    } else {
      emit(GetScienceDataSaccess());
    }
  }

  // todo: Function To Get All Sport Data From Api
  List<dynamic> sport = [];

  void getAllSportData() {
    if (sport.isEmpty) {
      emit(GetSportDataLoading());
      DioHelper.getAllData(
        method: ConstentsVariable.method,
        qurey: ConstentsVariable.querySport,
      ).then((value) {
        sport = value!.data['articles'];
        print(sport);
        emit(GetSportDataSaccess());
      }).catchError((error) {
        print(error.toString());
        emit(GetSportDataErorr());
      });
    } else {
      emit(GetSportDataSaccess());
    }
  }
}
