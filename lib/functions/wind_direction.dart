windDirection(int _windDeg) {
  if (_windDeg < 23 || _windDeg > 337) {
    return 'E';
  } else if (_windDeg >= 23 && _windDeg <= 77) {
    return 'NE';
  } else if (_windDeg > 77 && _windDeg < 113) {
    return 'N';
  } else if (_windDeg >= 113 && _windDeg <= 157) {
    return 'NW';
  } else if (_windDeg > 157 && _windDeg < 203) {
    return 'W';
  } else if (_windDeg >= 203 && _windDeg <= 247) {
    return 'SW';
  } else if (_windDeg > 247 && _windDeg < 293) {
    return 'S';
  } else {
    return 'SE';
  } 
}