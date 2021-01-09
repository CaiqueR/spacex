import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:spacex/app/modules/spacex/tabs/launches/lauches_model.dart';
import 'package:spacex/app/util/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'details_controller.dart';

class DetailsPage extends StatefulWidget {
  final LaunchesModel launch;
  final int imageNumber;
  const DetailsPage(
      {Key key, @required this.launch, @required this.imageNumber})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ModularState<DetailsPage, DetailsController> {
  //use 'controller' variable to access controller

  Widget customText(
      {String text,
      String subTitle,
      Widget customSubTitle,
      CrossAxisAlignment alignment}) {
    return Padding(
      padding: EdgeInsets.only(top: 22),
      child: Column(
        crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Color(0xFFFF003D), fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 9,
          ),
          customSubTitle ??
              Text(
                subTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.safeBlockHorizontal * 5),
              ),
        ],
      ),
    );
  }

  Future<void> _launchURL(url, {bool isYoutube = false}) async {
    if (Platform.isIOS) {
      if (await canLaunch(isYoutube ? 'youtube://$url' : url)) {
        await launch(isYoutube ? 'youtube://$url' : url, forceSafariVC: false);
      } else {
        if (await canLaunch('$url')) {
          await launch('$url');
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd-MM-yyyy');
    final hour = DateFormat('jm');

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Feather.share_2),
            onPressed: () {
              Share.share(
                  'Check out the ${widget.launch.rocket.rocketName} in action 🚀 ${widget.launch.videoLink}');
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 37),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/rocket${widget.imageNumber}.png'),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                customText(
                    text: 'ROCKET', subTitle: widget.launch.rocket.rocketName),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                        text: 'LAUNCH DATE',
                        subTitle: formatter
                            .format(DateTime.parse(widget.launch.launchDate))),
                    customText(
                        alignment: CrossAxisAlignment.end,
                        text: 'TIME',
                        subTitle: hour
                            .format(DateTime.parse(widget.launch.launchDate))),
                  ],
                ),
                customText(
                    text: 'LAUNCH SITE',
                    subTitle: widget.launch.launchSiteName),
                customText(
                    text: 'LAUNCH STATUS',
                    subTitle:
                        widget.launch.launchSuccess ? 'Success' : 'Failed'),
                customText(
                    text: 'DETAILS',
                    subTitle: widget.launch.details ?? 'No details'),
                customText(
                    text: 'TYPE ', subTitle: widget.launch.rocket.rocketType),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                        text: 'FIRST STAGE ',
                        subTitle:
                            'Cores: ${widget.launch.rocket.cores.toString() == 'null' ? 'No details' : widget.launch.rocket.cores.toString()}'),
                    customText(
                        text: 'SECOND STAGE ',
                        subTitle:
                            'Payloads: ${widget.launch.rocket.payloadMass}kg',
                        alignment: CrossAxisAlignment.end),
                    // customText('SECOND STAGE', widget.launch.rocket.),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: 'YOUTUBE',
                      subTitle: '',
                      customSubTitle: Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/youtube.svg',
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => _launchURL(widget.launch.videoLink,
                                    isYoutube: true),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    customText(
                        text: 'REDDIT',
                        subTitle: '',
                        customSubTitle: Stack(
                          children: [
                            SvgPicture.asset(
                              'assets/reddit.svg',
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () =>
                                      _launchURL(widget.launch.redditLaunch),
                                ),
                              ),
                            )
                          ],
                        ),
                        alignment: CrossAxisAlignment.end),
                    // customText('SECOND STAGE', widget.launch.rocket.),
                  ],
                ),
                // Container(
                //   height: 100,
                //   child: ListView(
                //     shrinkWrap: true,
                //     physics: ClampingScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     children: [Text("oi")],
                //   ),
                // ),
                customText(
                    text: 'SNEAK PEAK',
                    subTitle: '',
                    customSubTitle: Container(
                      height: 400,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: widget.launch.flickrImages
                            .map((imageLink) => Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: CachedNetworkImage(
                                        imageUrl: imageLink,
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ))
                            .toList(),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
