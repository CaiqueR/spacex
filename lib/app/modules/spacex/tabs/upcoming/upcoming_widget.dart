import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
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
        return GestureDetector(
          onTap: () => showModalBottom(context, upcomingEvents[index]),
          child: Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Image(
                        image: AssetImage(
                            'assets/rocket${(random.nextInt(5) + 1)}.png')),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal * 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LAUNCH',
                          style: TextStyle(
                              color: Color(0xFFFF003D),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          upcomingEvents[index].rocketName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          upcomingEvents[index].shortSiteName,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).shadowColor),
                        ),
                        Text(
                          'Tap to more information',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).shadowColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
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
