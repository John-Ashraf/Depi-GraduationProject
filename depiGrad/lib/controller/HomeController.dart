import 'package:get/get.dart';
import '../model/current_weather_data.dart';
import '../model/five_days_data.dart';
import '../service/weatherService.dart';

class HomeController extends GetxController {
  String city;
  HomeController({required this.city}) : assert(city != null);
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<FiveDaysData> fiveDayData = [];
  List<CurrentWeatherData> datalist = [];

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getFiveDaysData();
    getCurrentWeatherData();
  }

  void getCurrentWeatherData() {
    WeatherService(city: city).getCurrentWeatherData(
      onSuccess: (data) {
        if (data != null) {
          currentWeatherData = data;
          update();
        }
      },
      onError: (error) {
        print(error);
        update();
      },
    );
  }

  void getTopFiveCities() {
    List<String> cities = [
      'zagazig',
      'cairo',
      'alexandria',
      'ismailia',
      'fayoum'
    ];
    cities.forEach((element) {
      WeatherService(city: element).getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          if (data != null) {
            datalist.add(data as CurrentWeatherData);
            update();
          }
        },
        onError: (error) {
          print(error);
          update();
        },
      );
    });
  }

  void getFiveDaysData() {
    WeatherService(city: city).getFiveDaysThreeHoursForcastData(
      onSuccess: (data) {
        if (data != null) {
          fiveDayData = data;
          update();
        }
      },
      onError: (error) {
        print(error);
        update();
      },
    );
  }
}
