import '../model/current_weather_data.dart';
import '../api/apiRepo.dart';
import '../model/five_days_data.dart';

class WeatherService{
  String city="Cairo";
  WeatherService({required this.city});

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=9fda6d1e7c8133de3788755f1709cb08';

  void getCurrentWeatherData({
    Function() ?beforSend,
    Function(CurrentWeatherData currentWeatherData)?onSuccess,
    Function(dynamic error) ?onError,
  }) {
    final url = '$baseUrl/weather?q=$city&$apiKey';
    print('here ${city}');

    ApiRepo(url: url, payload: null).getData(
        beforeSend: () => beforSend!(),
        onSuccess: (data) => onSuccess!(CurrentWeatherData.fromJson(data)),
        onError: (error)  => onError!(error),
    );
  }

  void getFiveDaysThreeHoursForcastData({

    Function()? beforSend,
    Function(List<FiveDaysData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
print(url);
    ApiRepo(url: '$url', payload: null).getData(
      beforeSend: () => beforSend!(),
      onSuccess: (data) => {
        onSuccess!((data['list'] as List)
      ?.map((t) => FiveDaysData.fromJson(t))
       ?.toList()??
      List.empty()),
      },
      onError: (error)  => {
              onError!(error),
            });
  }
}