import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spacex/app/modules/spacex/tabs/rockets/rockets_model.dart';

class LaunchesModel {
  final String launchDate;
  final String details;
  final String launchSiteName;
  final String launchSiteLong;
  final bool launchSuccess;
  final String launchYear;
  final String articleLink;
  final String videoLink;
  final String redditLaunch;
  final List<String> flickrImages;
  final RocketModel rocket;

  LaunchesModel({
    this.launchDate,
    this.details,
    this.launchSiteName,
    this.launchSiteLong,
    this.launchSuccess,
    this.launchYear,
    this.articleLink,
    this.videoLink,
    this.redditLaunch,
    this.flickrImages,
    this.rocket,
  });

  LaunchesModel copyWith({
    String launchDate,
    String details,
    int cores,
    int payloadMass,
    String launchSiteName,
    String launchSiteLong,
    bool launchSuccess,
    String launchYear,
    String articleLink,
    String videoLink,
    String redditLaunch,
    List<String> flickrImages,
    RocketModel rocket,
  }) {
    return LaunchesModel(
      launchDate: launchDate ?? this.launchDate,
      details: details ?? this.details,
      launchSiteName: launchSiteName ?? this.launchSiteName,
      launchSiteLong: launchSiteLong ?? this.launchSiteLong,
      launchSuccess: launchSuccess ?? this.launchSuccess,
      launchYear: launchYear ?? this.launchYear,
      articleLink: articleLink ?? this.articleLink,
      videoLink: videoLink ?? this.videoLink,
      redditLaunch: redditLaunch ?? this.redditLaunch,
      flickrImages: flickrImages ?? this.flickrImages,
      rocket: rocket ?? this.rocket,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'launchDate': launchDate,
      'details': details,
      'launchSiteName': launchSiteName,
      'launchSiteLong': launchSiteLong,
      'launchSuccess': launchSuccess,
      'launchYear': launchYear,
      'articleLink': articleLink,
      'videoLink': videoLink,
      'redditLaunch': redditLaunch,
      'flickrImages': flickrImages,
      'rocket': rocket?.toMap(),
    };
  }

  factory LaunchesModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LaunchesModel(
      launchDate: map['launch_date_utc'],
      details: map['details'],
      launchSiteName: map['launch_site']['site_name'],
      launchSiteLong: map['launch_site']['site_name_long'],
      launchSuccess: map['launch_success'],
      launchYear: map['launch_year'],
      articleLink: map['links']['article_link'],
      videoLink: map['links']['video_link'],
      redditLaunch: map['links']['reddit_launch'],
      flickrImages: List<String>.from(map['links']['flickr_images']),
      rocket: RocketModel.fromMap(map['rocket']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LaunchesModel.fromJson(String source) =>
      LaunchesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LaunchesModel(launchDate: $launchDate, details: $details, launchSiteName: $launchSiteName, launchSiteLong: $launchSiteLong, launchSuccess: $launchSuccess, launchYear: $launchYear, articleLink: $articleLink, videoLink: $videoLink, redditLaunch: $redditLaunch, flickrImages: $flickrImages, rocket: $rocket)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LaunchesModel &&
        o.launchDate == launchDate &&
        o.details == details &&
        o.launchSiteName == launchSiteName &&
        o.launchSiteLong == launchSiteLong &&
        o.launchSuccess == launchSuccess &&
        o.launchYear == launchYear &&
        o.articleLink == articleLink &&
        o.videoLink == videoLink &&
        o.redditLaunch == redditLaunch &&
        listEquals(o.flickrImages, flickrImages) &&
        o.rocket == rocket;
  }

  @override
  int get hashCode {
    return launchDate.hashCode ^
        details.hashCode ^
        launchSiteName.hashCode ^
        launchSiteLong.hashCode ^
        launchSuccess.hashCode ^
        launchYear.hashCode ^
        articleLink.hashCode ^
        videoLink.hashCode ^
        redditLaunch.hashCode ^
        flickrImages.hashCode ^
        rocket.hashCode;
  }
}
