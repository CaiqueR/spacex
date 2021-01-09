import 'dart:convert';

import 'package:deep_pick/deep_pick.dart';

class RocketModel {
  final String rocketName;
  final String rocketType;
  final bool active;
  final String description;
  final String company;
  final int costPerLaunch;
  final String country;

  final int cores;
  final String payloadMass;

  RocketModel({
    this.rocketName,
    this.rocketType,
    this.active,
    this.description,
    this.company,
    this.costPerLaunch,
    this.country,
    this.cores,
    this.payloadMass,
  });

  RocketModel copyWith({
    String rocketName,
    String rocketType,
    bool active,
    String description,
    String company,
    int costPerLaunch,
    String country,
    int cores,
    int payloadMass,
  }) {
    return RocketModel(
      rocketName: rocketName ?? this.rocketName,
      rocketType: rocketType ?? this.rocketType,
      active: active ?? this.active,
      description: description ?? this.description,
      company: company ?? this.company,
      costPerLaunch: costPerLaunch ?? this.costPerLaunch,
      country: country ?? this.country,
      cores: cores ?? this.cores,
      payloadMass: payloadMass ?? this.payloadMass,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rocketName': rocketName,
      'rocketType': rocketType,
      'active': active,
      'description': description,
      'company': company,
      'costPerLaunch': costPerLaunch,
      'country': country,
      'cores': cores,
      'payloadMass': payloadMass,
    };
  }

  factory RocketModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RocketModel(
      cores: pick(map, 'first_stage', 'cores').asListOrEmpty().isNotEmpty
          ? map['first_stage']['cores'][0]['block']
          : 0,
      payloadMass:
          pick(map, 'second_stage', 'payloads').asListOrEmpty().isNotEmpty
              ? map['second_stage']['payloads'][0]['payload_mass_kg'].toString()
              : '',
      rocketName: map['rocket_name'] ?? map['name'],
      rocketType: map['rocket_type'] ?? map['type'],
      active: map['active'],
      description: map['description'],
      company: map['company'],
      costPerLaunch: map['cost_per_launch'],
      country: map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RocketModel.fromJson(String source) =>
      RocketModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RocketModel(rocketName: $rocketName, rocketType: $rocketType, active: $active, description: $description, company: $company, costPerLaunch: $costPerLaunch, country: $country, cores: $cores, payloadMass: $payloadMass)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RocketModel &&
        o.rocketName == rocketName &&
        o.rocketType == rocketType &&
        o.active == active &&
        o.description == description &&
        o.company == company &&
        o.costPerLaunch == costPerLaunch &&
        o.country == country &&
        o.cores == cores &&
        o.payloadMass == payloadMass;
  }

  @override
  int get hashCode {
    return rocketName.hashCode ^
        rocketType.hashCode ^
        active.hashCode ^
        description.hashCode ^
        company.hashCode ^
        costPerLaunch.hashCode ^
        country.hashCode ^
        cores.hashCode ^
        payloadMass.hashCode;
  }
}
