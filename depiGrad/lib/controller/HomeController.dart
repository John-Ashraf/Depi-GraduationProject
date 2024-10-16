import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../model/current_weather_data.dart';
import '../model/five_days_data.dart';
import '../service/GPSService.dart';
import '../service/weatherService.dart';

class HomeController extends GetxController {
  String city="assiut";
  HomeController({required this.city}) ;
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<FiveDaysData> fiveDayData = [];
  List<CurrentWeatherData> datalist = [];
  Position? currentUser;
  @override
  Future<void> onInit() async {
    initState();
    try {
      Position position = await getCurrentPosition();
      currentUser=position;
      print('99999 Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    } catch (e) {
      print('Error getting current position: $e');
    }
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getFiveDaysData();
    getCurrentWeatherData();
    getTopFiveCities();
  }

  void getCurrentWeatherData() {
    print('Postion : ${currentUser}');
    WeatherService(city: city).getCurrentWeatherData(
      onSuccess: (data) {
        print("Success: Received weather data");
        if (data != null) {
          currentWeatherData = data;
          update();
        } else {
          print("Warning: Received null data");
        }
      },
      onError: (error) {
        print("Error fetching weather data: ${error.toString()}");
        if (error is Exception) {
          print("Exception details: ${error.runtimeType}");
        }
        update();
      },
    );
  }

  void getTopFiveCities() {
    List<String> cities = [
      'assiut',
      'cairo',
      'alexandria',
      'aswan',
      'sinai'
    ];
    cities.forEach((element) {
      WeatherService(city: element).getCurrentWeatherData(
        onSuccess: (data) {
          if (data != null) {
            datalist.add(data);
            print('Added to list');
            print(datalist);
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
