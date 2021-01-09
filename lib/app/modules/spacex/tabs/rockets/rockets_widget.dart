import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex/app/modules/spacex/card/card.dart';
import 'package:spacex/app/modules/spacex/tabs/rockets/rockets_model.dart';
import 'package:spacex/app/util/size_config.dart';

class RocketsWidget extends StatelessWidget {
  final String _query = """
    query users {
      rockets {
        active
        description
        name
        boosters
        company
        cost_per_launch
        country
        type
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(documentNode: gql(_query)),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          return Rockets(
            result: result,
          );
        });
  }
}

class Rockets extends StatelessWidget {
  final QueryResult result;

  const Rockets({Key key, this.result}) : super(key: key);

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

    List<RocketModel> launches = result.data['rockets']
        .map<RocketModel>((item) => RocketModel.fromMap(item))
        .toList();

    var random = Random();
    return ListView.builder(
      itemCount: launches.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
          title: 'ROCKET',
          rocket: launches[index].rocketName ?? '',
          desc: launches[index].country ?? '',
          imgUrl: 'assets/rocket${(random.nextInt(5) + 1)}.png',
          custom: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: launches[index].active
                    ? Color(0xFF16BE27)
                    : Color(0xFFFF0606),
              ),
              child: Text(
                launches[index].active ? 'ACTIVE' : 'INACTIVE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal * 2.3),
              ),
            ),
          ),
        );
      },
    );
  }
}
