import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const apiKey = 'CWB-AF051CEE-9972-4C1E-92FB-FF0604BAED32&';
const openWeatherMapURL = 'https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-063';

//https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-063?Authorization=CWB-AF051CEE-9972-4C1E-92FB-FF0604BAED32&format=JSON&locationName=%E5%8D%97%E6%B8%AF%E5%8D%80&elementName=MinT'


class WeatherModel {
  Future<dynamic> getCityMintWeather(String locationName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?Authorization=$apiKey&format=JSON&locationName=%E5%8D%97%E6%B8%AF%E5%8D%80&elementName=MinT');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location
            .longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}


