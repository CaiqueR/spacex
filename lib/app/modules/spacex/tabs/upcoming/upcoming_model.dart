import 'dart:convert';

class UpcomingModel {
  final String details;
  final String date;
  final String launchSiteName;
  final String shortSiteName;
  final String rocketName;
  final String rocketType;
  final String rocketFirstFlight;

  UpcomingModel({
    this.details,
    this.date,
    this.launchSiteName,
    this.shortSiteName,
    this.rocketName,
    this.rocketType,
    this.rocketFirstFlight,
  });

  UpcomingModel copyWith({
    String details,
    String date,
    String launchSiteName,
    String shortSiteName,
    String rocketName,
    String rocketType,
    String rocketFirstFlight,
  }) {
    return UpcomingModel(
      details: details ?? this.details,
      date: date ?? this.date,
      launchSiteName: launchSiteName ?? this.launchSiteName,
      shortSiteName: shortSiteName ?? this.shortSiteName,
      rocketName: rocketName ?? this.rocketName,
      rocketType: rocketType ?? this.rocketType,
      rocketFirstFlight: rocketFirstFlight ?? this.rocketFirstFlight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'details': details,
      'date': date,
      'launchSiteName': launchSiteName,
      'shortSiteName': shortSiteName,
      'rocketName': rocketName,
      'rocketType': rocketType,
      'rocketFirstFlight': rocketFirstFlight,
    };
  }

  factory UpcomingModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UpcomingModel(
      details: map['details'],
      date: map['launch_date_utc'],
      launchSiteName: map['launch_site']['site_name_long'],
      shortSiteName: map['launch_site']['site_name'],
      rocketName: map['rocket']['rocket_name'],
      rocketType: map['rocket']['rocket_type'],
      rocketFirstFlight: map['rocket']['rocket']['first_flight'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UpcomingModel.fromJson(String source) =>
      UpcomingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UpcomingModel(details: $details, date: $date, launchSiteName: $launchSiteName, shortSiteName: $shortSiteName, rocketName: $rocketName, rocketType: $rocketType, rocketFirstFlight: $rocketFirstFlight)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UpcomingModel &&
        o.details == details &&
        o.date == date &&
        o.launchSiteName == launchSiteName &&
        o.shortSiteName == shortSiteName &&
        o.rocketName == rocketName &&
        o.rocketType == rocketType &&
        o.rocketFirstFlight == rocketFirstFlight;
  }

  @override
  int get hashCode {
    return details.hashCode ^
        date.hashCode ^
        launchSiteName.hashCode ^
        shortSiteName.hashCode ^
        rocketName.hashCode ^
        rocketType.hashCode ^
        rocketFirstFlight.hashCode;
  }
}
