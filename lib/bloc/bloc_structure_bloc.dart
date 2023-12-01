
import 'package:arnimo_test/Data/model_class_current_data.dart';
import 'package:arnimo_test/Data/model_class_forecast_data.dart';
import 'package:arnimo_test/Domin/fetching_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


part 'bloc_structure_event.dart';
part 'bloc_structure_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()){
    on<GetWeather>(_onGetWeather);
    on<SearchWeather>(_onSearchWeather);
  }

  
 Future<void>_onGetWeather(GetWeather event, Emitter<WeatherState>emit)async{
  emit(WeatherLoading());
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        final weather =
            await weatherRepository.getWeather(position.latitude, position.longitude);
             final forecastweather =
            await weatherRepository.getForecastWeather(position.latitude, position.longitude);
            

        emit (WeatherLoaded(weather,forecastweather));
      } catch (e) {
       emit (WeatherError('Failed to get weather data'));
      }
    }

    void _onSearchWeather(SearchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final coordinates = await getCoordinatesForCity(event.city);
      final weather = await weatherRepository.getWeather(
        coordinates.latitude,
        coordinates.longitude,
      );
      final forecastWeather = await weatherRepository.getForecastWeather(
        coordinates.latitude,
        coordinates.longitude,
      );

     emit(WeatherLoaded(weather, forecastWeather));
    } catch (e) {
      emit(WeatherError('Failed to get weather data for ${event.city}'));
    }
  }

  Future<Position> getCoordinatesForCity(String city) async {
  try {
    List<Location> locations = await locationFromAddress(city);
    if (locations.isNotEmpty) {
      Location location = locations.first;
      return Position(
        latitude: location.latitude ,
        longitude: location.longitude ,
        timestamp: DateTime.now(), // Provide an appropriate timestamp if needed
        accuracy: 0.0, // Provide an appropriate accuracy if needed
        altitude: 0.0, // Provide an appropriate altitude if needed
        altitudeAccuracy: 0.0, // Provide an appropriate altitudeAccuracy if needed
        heading: 0.0, // Provide an appropriate heading if needed
        headingAccuracy: 0.0, // Provide an appropriate headingAccuracy if needed
        speed: 0.0, // Provide an appropriate speed if needed
        speedAccuracy: 0.0, // Provide an appropriate speedAccuracy if needed
      );
    } else {
      throw Exception('Could not find coordinates for the city');
    }
  } catch (e) {
    throw Exception('Error fetching coordinates for the city');
  }
}


}
