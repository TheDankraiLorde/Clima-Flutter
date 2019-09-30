import 'location.dart';
import 'networking.dart';

const apiKey = "5708c611b181d76520b5da88125944f3";
const weatherUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  LocationType loc;

  Future<dynamic> getCityWeather(String city) async {
    String url = "$weatherUrl/?q=$city&appid=$apiKey&units=metric";
    NetworkHelper nhcity = NetworkHelper(url);
    var wdata = await nhcity.getData();
    return wdata;
  }

  Future<dynamic> getLocWeather() async {
    loc = LocationType();
    print("Getting location...");
    await loc.getLocation();
    print("Latitude: ${loc.getLat()},\nLongitude:${loc.getLong()}");
    print("Getting Weather...");
    NetworkHelper nh = NetworkHelper(
        "$weatherUrl?lat=${loc.getLat()}&lon=${loc.getLong()}&appid=$apiKey&units=metric");
    var data = await nh.getData();
    return data;
  }
}
