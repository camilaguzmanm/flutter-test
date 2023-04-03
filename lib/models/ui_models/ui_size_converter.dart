import 'package:flutter_technical_test/models/ui_models/ui_size_singleton.dart';

double _pixelWidth = -1;
double _pixelHeight = -1;

int _platform = -1;

int getPlatform() => _platform;

double relativeWidth({required double iosValue, required double androidValue}) {
  if (_platform == 1) {
    return (androidValue / _pixelWidth) * getScreenWidth();
  }

  if (_platform == 2) {
    return (iosValue / _pixelWidth) * getScreenWidth();
  }

  return (androidValue / _pixelWidth) * getScreenWidth();
}

double relativeHeight(
    {required double iosValue, required double androidValue}) {
  if (_platform == 1) {
    return (androidValue / _pixelHeight) * getScreenHeight();
  }

  if (_platform == 2) {
    return (iosValue / _pixelHeight) * getScreenHeight();
  }

  return (androidValue / _pixelHeight) * getScreenHeight();
}
