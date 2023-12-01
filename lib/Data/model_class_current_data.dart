
class Datas {
  String? name;
  String? description;
  String? main;
  String ?country;
  String ? icon;
  num? humidity;
  num? pressure;
  num? visibility;
  num? speed;
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num ?timezone;
  int? dt;
  int? sunset;
  

  Datas({
    this.name,
    this.humidity,
    this.speed,
    this.description,
    this.temp,
    this.pressure,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.main,
    this.visibility,
    this.country,
    this.timezone,
     this.icon,
     this.dt,
     this.sunset,
  });

 Datas.fromJson(Map<String, dynamic> json){
        name= json["name"];
        humidity= json["main"]["humidity"];
        speed= json["wind"]["speed"];
        temp= json["main"]["temp"];
        pressure= json["main"]["pressure"];
        feelsLike= json["main"]["feels_like"];
        tempMin= json["main"]["temp_min"];
        tempMax= json["main"]["temp_max"];
        description= json["weather"][0]["description"];
        visibility= json["visibility"];
        country= json["sys"]["country"];
        timezone= json["timezone"];
        icon= json["icon"];
        dt= json["dt"];
        sunset= json["sys"]["sunset"];
      //main= json["weather"][0]["main"];

      
 }
}
