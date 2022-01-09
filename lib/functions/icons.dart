import 'package:weather_app_for_internship/presentation/custom_icons_icons.dart';

getWeatherIcon(String _icon) {
  switch (_icon) {
    case '01d':
      return CustomIcons.sun;
    case '01n':
      return CustomIcons.moon;
    case '02d':
      return CustomIcons.cloud_sun;  
    case '02n':
      return CustomIcons.cloud_moon;  
    case '03d':
      return CustomIcons.cloud;
    case '03n':
      return CustomIcons.cloud_inv;
    case '04d':
      return CustomIcons.clouds;
    case '04n':
      return CustomIcons.clouds_inv;
    case '09d':
      return CustomIcons.rain;
    case '09n':
      return CustomIcons.rain_inv;  
    case '10d':
      return CustomIcons.rain;  
    case '10n':
      return CustomIcons.rain_inv; 
    case '11d':
      return CustomIcons.cloud_flash;  
    case '11n':
      return CustomIcons.cloud_flash_inv; 
    case '13d':
      return CustomIcons.snow;  
    case '13n':
      return CustomIcons.snow_inv;   
    default: 
      return CustomIcons.mist; 
  }
}