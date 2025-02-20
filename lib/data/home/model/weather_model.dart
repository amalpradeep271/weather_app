class WeatherModel {
  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final Location? location;
  final Current? current;
  final Forecast? forecast;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      current:
          json["current"] == null ? null : Current.fromJson(json["current"]),

      forecast:
          json['forecast'] == null ? null : Forecast.fromJson(json["forecast"]),
    );
  }
}

class Current {
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final int? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final int? pressureMb;
  final double? pressureIn;
  final int? precipMm;
  final int? precipIn;
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? windchillC;
  final double? windchillF;
  final double? heatindexC;
  final double? heatindexF;
  final double? dewpointC;
  final double? dewpointF;
  final int? visKm;
  final int? visMiles;
  final double? uv;
  final double? gustMph;
  final int? gustKph;

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdatedEpoch: json["last_updated_epoch"],
      lastUpdated: json["last_updated"],
      tempC: json["temp_c"],
      tempF: json["temp_f"],
      isDay: json["is_day"],
      condition:
          json["condition"] == null
              ? null
              : Condition.fromJson(json["condition"]),
      windMph: json["wind_mph"],
      windKph: json["wind_kph"],
      windDegree: json["wind_degree"],
      windDir: json["wind_dir"],
      pressureMb: json["pressure_mb"],
      pressureIn: json["pressure_in"],
      precipMm: json["precip_mm"],
      precipIn: json["precip_in"],
      humidity: json["humidity"],
      cloud: json["cloud"],
      feelslikeC: json["feelslike_c"],
      feelslikeF: json["feelslike_f"],
      windchillC: json["windchill_c"],
      windchillF: json["windchill_f"],
      heatindexC: json["heatindex_c"],
      heatindexF: json["heatindex_f"],
      dewpointC: json["dewpoint_c"],
      dewpointF: json["dewpoint_f"],
      visKm: json["vis_km"],
      visMiles: json["vis_miles"],
      uv: json["uv"],
      gustMph: json["gust_mph"],
      gustKph: json["gust_kph"],
    );
  }
}

class Condition {
  Condition({required this.text, required this.icon, required this.code});

  final String? text;
  final String? icon;
  final int? code;

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json["text"],
      icon: json["icon"],
      code: json["code"],
    );
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json["name"],
      region: json["region"],
      country: json["country"],
      lat: json["lat"],
      lon: json["lon"],
      tzId: json["tz_id"],
      localtimeEpoch: json["localtime_epoch"],
      localtime: json["localtime"],
    );
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(new Forecastday.fromJson(v));
      });
    }
  }
}

class Forecastday {
  String? date;
  dynamic dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? new Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(new Hour.fromJson(v));
      });
    }
  }
}

class Day {
  dynamic maxtempC;
  dynamic maxtempF;
  dynamic mintempC;
  dynamic mintempF;
  dynamic avgtempC;
  dynamic avgtempF;
  dynamic maxwindMph;
  dynamic maxwindKph;
  dynamic totalprecipMm;
  dynamic totalprecipIn;
  dynamic totalsnowCm;
  dynamic avgvisKm;
  dynamic avgvisMiles;
  dynamic avghumidity;
  dynamic dailyWillItRain;
  dynamic dailyChanceOfRain;
  dynamic dailyWillItSnow;
  dynamic dailyChanceOfSnow;
  Condition? condition;
  dynamic uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    totalsnowCm = json['totalsnow_cm'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition =
        json['condition'] != null
            ? new Condition.fromJson(json['condition'])
            : null;
    uv = json['uv'];
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  dynamic moonIllumination;
  dynamic isMoonUp;
  dynamic isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }
}

class Hour {
  dynamic timeEpoch;
  String? time;
  dynamic tempC;
  dynamic tempF;
  dynamic isDay;
  Condition? condition;
  dynamic windMph;
  dynamic windKph;
  dynamic windDegree;
  String? windDir;
  dynamic pressureMb;
  dynamic pressureIn;
  dynamic precipMm;
  dynamic precipIn;
  dynamic snowCm;
  dynamic humidity;
  dynamic cloud;
  dynamic feelslikeC;
  dynamic feelslikeF;
  dynamic windchillC;
  dynamic windchillF;
  dynamic heatindexC;
  dynamic heatindexF;
  dynamic dewpointC;
  dynamic dewpointF;
  dynamic willItRain;
  dynamic chanceOfRain;
  dynamic willItSnow;
  dynamic chanceOfSnow;
  dynamic visKm;
  dynamic visMiles;
  dynamic gustMph;
  dynamic gustKph;
  dynamic uv;

  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.snowCm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition =
        json['condition'] != null
            ? new Condition.fromJson(json['condition'])
            : null;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    snowCm = json['snow_cm'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
    uv = json['uv'];
  }
}

/// this is my new model
/// use for both , current data and forecast day or hourly
