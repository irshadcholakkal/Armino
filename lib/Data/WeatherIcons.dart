// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget WeatherIcons(data,coolr) {
  switch (data) {
    case 'scattered clouds':
      return Image.asset("asset/cloudy.png",color: coolr,scale: 1.2,);

    case 'clear sky':
      return Image.asset("asset/sun.png",color: coolr,);
    case 'few clouds':
      return Image.asset("asset/clearsky.png",color: coolr,);
    case 'broken clouds':
      return Image.asset("asset/cloudy.png",color: coolr,);

    case 'shower rain':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'rain':
      return Image.asset("asset/rain.png",color: coolr,);
    case 'thunderstorm':
      return Image.asset("asset/strom.png",color: coolr,);
    case 'snow':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'mist':
      return Image.asset("asset/fog.png",color: coolr,);

    case 'thunderstorm with light rain':
      return Image.asset("asset/strom.png",color: coolr,);
    case 'thunderstorm with rain':
      return Image.asset("asset/strom.png",color: coolr,);
    case 'thunderstorm with heavy rain':
      return Image.asset("asset/strom.png",color: coolr,);
    case 'light thunderstorm':
      return Image.asset("asset/strom.png",color: coolr,);
    case 'heavy thunderstorm':
      return Image.asset("asset/strom.png",color: coolr,);
    case 'ragged thunderstorm':
      return Image.asset("asset/strom.png",color: coolr,);
    case 'thunderstorm with light drizzle':
      return Image.asset("asset/strom.png",color: coolr,);
    case 'thunderstorm with heavy drizzle	':
      return Image.asset("asset/strom.png",color: coolr,);

    case 'light intensity drizzle':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'drizzle':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'heavy intensity drizzle':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'light intensity drizzle rain':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'drizzle rain':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'heavy intensity drizzle rain':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'shower rain and drizzle':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'heavy shower rain and drizzle':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'shower drizzle':
      return Image.asset("asset/raincloud.png",color: coolr,);

    case 'light rain':
      return Image.asset("asset/rain.png",color: coolr,);
    case 'moderate rain':
      return Image.asset("asset/rain.png",color: coolr,);
    case 'heavy intensity rain':
      return Image.asset("asset/rain.png",color: coolr,);
    case 'very heavy rain':
      return Image.asset("asset/rain.png",color: coolr,);
    case 'extreme rain':
      return Image.asset("asset/rain.png",color: coolr,);
    case 'freezing rain':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'light intensity shower rain':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'heavy intensity shower rain':
      return Image.asset("asset/raincloud.png",color: coolr,);
    case 'ragged shower rain':
      return Image.asset("asset/raincloud.png",color: coolr,);

    case 'light snow':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'heavy snow':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'sleet':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'light shower sleet':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'shower sleet':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'light rain and snow':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'rain and snow':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'light shower snow':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'shower snow':
      return Image.asset("asset/snow.png",color: coolr,);
    case 'heavy shower snow':
      return Image.asset("asset/snow.png",color: coolr,);

    case 'smoke':
      return Image.asset("asset/fog.png",color: coolr,);

    case 'haze':
      return Image.asset("asset/fog.png",color: coolr,);

    case '':
      return Image.asset("asset/fog.png",color: coolr,);

    case 'sand/dust whirls':
      return Image.asset("asset/fog.png",color: coolr,);

    case 'fog':
      return Image.asset("asset/fog.png",color: coolr,);

    case 'sand':
      return Image.asset("asset/fog.png",color: coolr,);

    case 'dust':
      return Image.asset("asset/fog.png",color: coolr,);

    case 'volcanic ash':
      return Image.asset("asset/fog.png",color: coolr,);

    case 'squalls':
      return Image.asset("asset/fog.png",color: coolr,);

    case 'tornado':
      return Image.asset("asset/fog.png",color: coolr,);

    case 'few clouds: 11-25%':
      return Image.asset("asset/cloudy.png",color: coolr,);
    case 'scattered clouds: 25-50%	':
      return Image.asset("asset/cloudy.png",color: coolr,);

    case 'broken clouds: 51-84%':
      return Image.asset("asset/cloudy.png",color: coolr,);

    case 'overcast clouds: 85-100%':
      return Image.asset("asset/cloudy.png",color: coolr,);

    case 'overcast clouds':
      return Image.asset("asset/cloudy.png",color: coolr,);
  }

  return const Text("loading...");
}
