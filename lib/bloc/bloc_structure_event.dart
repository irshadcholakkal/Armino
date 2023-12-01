part of 'bloc_structure_bloc.dart';
 

abstract class WeatherEvent extends Equatable{
   const WeatherEvent();
}

class GetWeather extends WeatherEvent{
  
  @override
  List<Object> get props => [];

}
class SearchWeather extends WeatherEvent {
  final String city;

  SearchWeather(this.city);

  @override
  List<Object> get props => [city];
}

