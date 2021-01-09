import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex/app/modules/spacex/tabs/launches/launches_widget.dart';
import 'package:spacex/app/modules/spacex/tabs/rockets/rockets_widget.dart';
import 'package:spacex/app/modules/spacex/tabs/upcoming/upcoming_widget.dart';
import 'package:spacex/app/util/size_config.dart';
import 'spacex_controller.dart';

class SpacexPage extends StatefulWidget {
  final String title;
  const SpacexPage({Key key, this.title = 'SpaceX'}) : super(key: key);

  @override
  _SpacexPageState createState() => _SpacexPageState();
}

class _SpacexPageState extends ModularState<SpacexPage, SpacexController>
    with SingleTickerProviderStateMixin {
  //use 'controller' variable to access controller
  TabController _tabController;

  Future initialPage() async {
    await Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _tabController.addListener(() {
      setState(() {});
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(
                color: Colors.black38,
              ),
              InkWell(
                onTap: initialPage,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Logout'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Feather.log_out)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
                icon: Icon(
                  Feather.search,
                ),
                onPressed: () {}),
          ],
          title: Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 4),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 4),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x0D000000),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 7.0, //extend the shadow
                ),
              ],
            ),
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 4,
                        color: Color(0xFFFF003D),
                      ),
                      insets: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 8)),
                  tabs: [
                    Tab(
                      child: Text(
                        'Upcoming',
                        style: TextStyle(
                            color: _tabController.index == 0
                                ? Color(0xFFFF003D)
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.safeBlockHorizontal * 4),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Launches',
                        style: TextStyle(
                            color: _tabController.index == 1
                                ? Color(0xFFFF003D)
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.safeBlockHorizontal * 4),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Rockets',
                        style: TextStyle(
                            color: _tabController.index == 2
                                ? Color(0xFFFF003D)
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.safeBlockHorizontal * 4),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      UpcomingWidget(),
                      LaunchesWidget(),
                      RocketsWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
