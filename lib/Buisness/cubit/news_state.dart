part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLocatyinNavBar extends NewsState {}

class GetBuisnessDataLoading extends NewsState {}

class GetBuisnessDataSaccess extends NewsState {}

class GetBuisnessDataErorr extends NewsState {}

class GetSportDataLoading extends NewsState {}

class GetSportDataSaccess extends NewsState {}

class GetSportDataErorr extends NewsState {}

class GetScienceDataLoading extends NewsState {}

class GetScienceDataSaccess extends NewsState {}

class GetScienceDataErorr extends NewsState {}