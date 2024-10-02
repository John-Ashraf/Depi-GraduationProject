
import '../model/current_weather_data.dart';
import '../api/fiveDaysData.dart';
import '../api/apiRepo.dart';

class WeatherService{
  String city;
  WeatherService({this.city});

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=e6324cd99bd6387f7b0c69bc4ac65a61';


  void getCurrentWeatherData({
    Function() beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/weather?q=$city&$apiKey';

    ApiRepo(url: url, payload: null).getdata(
        beforeSend: () => beforSend(),
    onSuccess: (data) => onSuccess(CurrentWeatherData.fromJson(data)),
    onError: (error)  => onError(error),
    );
  }


  void getFiveDaysThreeHoursForcastData({

    Function() beforSend,
    Function(List<FiveDayData> fiveDayData) onSuccess,
    Function(dynamic error) onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
print(url);
    ApiRepo(url: '$url', payload: null).getData(
      beforeSend: () => beforSend(),
      onSuccess: (data) => {
        onSuccess((data['list'] as List)
      ?.map((t) => FiveDayData.fromJson(t))
       ?.toList()??
      List.empty()),
      },
      onError: (error)  => {
              onError(error),
            });
  }


}