import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:spacex/app/modules/spacex/card/card.dart';
import 'package:spacex/app/modules/spacex/tabs/upcoming/upcoming_model.dart';
import 'package:spacex/app/util/size_config.dart';

class UpcomingWidget extends StatelessWidget {
  final String _query = """
    query users {
      launchesUpcoming {
        details
        launch_date_utc
        launch_site {
          site_name_long
          site_name
        }
        rocket {
          rocket_name
          rocket_type
          rocket {
            first_flight
          }
        }
      }
    }
  """;

  Widget modalItems(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            title,
            style: TextStyle(
                color: Color(0xFFFF003D),
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.safeBlockHorizontal * 2.3),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            subTitle,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 4,
            ),
          ),
        ),
      ],
    );
  }

  void showModalBottom(BuildContext context, UpcomingModel selectedUpcoming) {
    final formatter = DateFormat('EEE MMM dd H:m:s y');

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Wrap(
              children: <Widget>[
                Center(
                  child: Text(
                    'Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                modalItems('LAUNCH DATE',
                    formatter.format(DateTime.parse(selectedUpcoming.date))),
                modalItems('LAUNCH SITE', selectedUpcoming.launchSiteName),
                modalItems('DETAILS', selectedUpcoming.details ?? 'No details'),
              ],
            ),
          );
        });
  }

  Widget upcomingWidget(
    QueryResult result,
  ) {
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

    List<UpcomingModel> upcomingEvents = result.data['launchesUpcoming']
        .map<UpcomingModel>((item) => UpcomingModel.fromMap(item))
        .toList();

    var random = Random();
    return ListView.builder(
      itemCount: upcomingEvents.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
          onTap: () => showModalBottom(context, upcomingEvents[index]),
          title: 'LAUNCH',
          rocket: upcomingEvents[index].rocketName,
          desc: upcomingEvents[index].shortSiteName,
          imgUrl: 'assets/rocket${(random.nextInt(5) + 1)}.png',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(documentNode: gql(_query)),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return upcomingWidget(
            result,
          );
        });
  }
}
