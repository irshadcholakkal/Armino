// ignore_for_file: must_be_immutable

part of 'bloc_structure_bloc.dart';

 


abstract class WeatherState extends Equatable{
 const WeatherState();

}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {

  Datas  datassss;
  ForecastDatas forecastdata;
  WeatherLoaded(this.datassss,this.forecastdata);
  

  @override
  List<Object> get props => [datassss,forecastdata];

  
}

class WeatherError extends WeatherState{
  final String message;

  const WeatherError(this.message);
  @override
  List<Object> get props => [message];

}




