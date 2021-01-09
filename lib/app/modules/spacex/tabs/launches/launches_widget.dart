import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex/app/modules/spacex/card/card.dart';
import 'package:spacex/app/modules/spacex/tabs/launches/lauches_model.dart';
import 'package:spacex/app/modules/spacex/tabs/upcoming/upcoming_model.dart';

class LaunchesWidget extends StatelessWidget {
  final String _query = """
    query users {
      launches {
        details
        launch_date_utc
        launch_site {
          site_name
          site_name_long
        }
        launch_success
        launch_year
        links {
          article_link
          video_link
          flickr_images
          reddit_launch
        }
        rocket {
          rocket_name
          rocket_type
          first_stage {
            cores {
              block
            }
          }
          second_stage {
            payloads {
              payload_mass_kg
            }
          }
        }
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(documentNode: gql(_query)),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return Launches(
            result: result,
          );
        });
  }
}

class Launches extends StatelessWidget {
  final QueryResult result;

  const Launches({Key key, this.result}) : super(key: key);

  Future<void> onTap({LaunchesModel launch, int imageNumber}) async {
    await Modular.to
        .pushNamed('/spacex/details', arguments: {launch, imageNumber});
  }

  @override
  Widget build(BuildContext context) {
    if (result.hasException) {
      return Center(child: Text(result.exception.toString()));
    }
    if (result.loading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color(0xFFFF003D)),
        ),
      );
    }

    List<LaunchesModel> launches = result.data['launches']
        .map<LaunchesModel>((item) => LaunchesModel.fromMap(item))
        .toList();

    var random = Random();
    return ListView.builder(
      itemCount: launches.length,
      itemBuilder: (BuildContext context, int index) {
        final randNumber = random.nextInt(5) + 1;
        return CustomCard(
          onTap: () => onTap(launch: launches[index], imageNumber: randNumber),
          title: 'LAUNCH',
          rocket: launches[index].rocket.rocketName ?? '',
          desc: launches[index].launchSiteName ?? '',
          imgUrl: 'assets/rocket$randNumber.png',
        );
      },
    );
  }
}
