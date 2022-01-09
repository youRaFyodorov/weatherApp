class CurrentWeather {
  final String city;
  final String country;
  final int timezone;
  final int temp;
  final String main;
  final String icon;
  final int pop;
  final int humidity;
  final int pressure;
  final int windSpeed;
  final int windDeg;


  CurrentWeather({required this.city, required this.country, required this.timezone, required this.temp, required this.main, required this.icon, required this.pop, required this.humidity, required this.pressure, required this.windSpeed, required this.windDeg});
  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      city: json['city']['name'],
      country: json['city']['country'],
      timezone: json['city']['timezone'],
      temp: (json['list'][0]['main']['temp']).toInt(),
      main: json['list'][0]['weather'][0]['main'],
      icon: json['list'][0]['weather'][0]['icon'],
      pop: (json['list'][0]['pop'].toDouble() * 100) .toInt(),
      humidity: (json['list'][0]['main']['humidity']).toInt(),
      pressure: json['list'][0]['main']['pressure'].toInt(),
      windSpeed: (json['list'][0]['wind']['speed'].toDouble() * 3.6).toInt(),
      windDeg: (json['list'][0]['wind']['deg']).toInt(),
    );
  }
}