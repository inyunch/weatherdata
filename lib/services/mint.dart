// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Welcome welcomeFromMap(String str) => Welcome.fromMap(json.decode(str));

String welcomeToMap(Welcome data) => json.encode(data.toMap());

class Welcome {
  Welcome({
    required this.success,
    required this.result,
    required this.records,
  });

  String success;
  Result result;
  Records records;

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
    success: json["success"],
    result: Result.fromMap(json["result"]),
    records: Records.fromMap(json["records"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "result": result.toMap(),
    "records": records.toMap(),
  };
}

class Records {
  Records({
    required this.locations,
  });

  List<RecordsLocation> locations;

  factory Records.fromMap(Map<String, dynamic> json) => Records(
    locations: List<RecordsLocation>.from(json["locations"].map((x) => RecordsLocation.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "locations": List<dynamic>.from(locations.map((x) => x.toMap())),
  };
}

class RecordsLocation {
  RecordsLocation({
    required this.datasetDescription,
    required this.locationsName,
    required this.dataid,
    required this.location,
  });

  String datasetDescription;
  String locationsName;
  String dataid;
  List<LocationLocation> location;

  factory RecordsLocation.fromMap(Map<String, dynamic> json) => RecordsLocation(
    datasetDescription: json["datasetDescription"],
    locationsName: json["locationsName"],
    dataid: json["dataid"],
    location: List<LocationLocation>.from(json["location"].map((x) => LocationLocation.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "datasetDescription": datasetDescription,
    "locationsName": locationsName,
    "dataid": dataid,
    "location": List<dynamic>.from(location.map((x) => x.toMap())),
  };
}

class LocationLocation {
  LocationLocation({
    required this.locationName,
    required this.geocode,
    required this.lat,
    required this.lon,
    required this.weatherElement,
  });

  String locationName;
  String geocode;
  String lat;
  String lon;
  List<WeatherElement> weatherElement;

  factory LocationLocation.fromMap(Map<String, dynamic> json) => LocationLocation(
    locationName: json["locationName"],
    geocode: json["geocode"],
    lat: json["lat"],
    lon: json["lon"],
    weatherElement: List<WeatherElement>.from(json["weatherElement"].map((x) => WeatherElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "locationName": locationName,
    "geocode": geocode,
    "lat": lat,
    "lon": lon,
    "weatherElement": List<dynamic>.from(weatherElement.map((x) => x.toMap())),
  };
}

class WeatherElement {
  WeatherElement({
    required this.elementName,
    required this.description,
    required this.time,
  });

  String elementName;
  String description;
  List<Time> time;

  factory WeatherElement.fromMap(Map<String, dynamic> json) => WeatherElement(
    elementName: json["elementName"],
    description: json["description"],
    time: List<Time>.from(json["time"].map((x) => Time.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "elementName": elementName,
    "description": description,
    "time": List<dynamic>.from(time.map((x) => x.toMap())),
  };
}

class Time {
  Time({
    required this.startTime,
    required this.endTime,
    required this.elementValue,
  });

  DateTime startTime;
  DateTime endTime;
  List<ElementValue> elementValue;

  factory Time.fromMap(Map<String, dynamic> json) => Time(
    startTime: DateTime.parse(json["startTime"]),
    endTime: DateTime.parse(json["endTime"]),
    elementValue: List<ElementValue>.from(json["elementValue"].map((x) => ElementValue.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "startTime": startTime.toIso8601String(),
    "endTime": endTime.toIso8601String(),
    "elementValue": List<dynamic>.from(elementValue.map((x) => x.toMap())),
  };
}

class ElementValue {
  ElementValue({
    required this.value,
    required this.measures,
  });

  String value;
  String measures;

  factory ElementValue.fromMap(Map<String, dynamic> json) => ElementValue(
    value: json["value"],
    measures: json["measures"],
  );

  Map<String, dynamic> toMap() => {
    "value": value,
    "measures": measures,
  };
}

class Result {
  Result({
    required this.resourceId,
    required this.fields,
  });

  String resourceId;
  List<Field> fields;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    resourceId: json["resource_id"],
    fields: List<Field>.from(json["fields"].map((x) => Field.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "resource_id": resourceId,
    "fields": List<dynamic>.from(fields.map((x) => x.toMap())),
  };
}

class Field {
  Field({
    required this.id,
    required this.type,
  });

  String id;
  String type;

  factory Field.fromMap(Map<String, dynamic> json) => Field(
    id: json["id"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
  };
}
