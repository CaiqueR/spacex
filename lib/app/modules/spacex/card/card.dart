import 'package:flutter/material.dart';
import 'package:spacex/app/util/size_config.dart';

class CustomCard extends StatelessWidget {
  final Function onTap;
  final String imgUrl;
  final String title;
  final String rocket;
  final String desc;
  final Widget custom;

  const CustomCard({
    Key key,
    this.onTap,
    this.imgUrl = '',
    this.title = '',
    this.rocket = '',
    this.desc = '',
    this.custom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                    height: SizeConfig.blockSizeVertical * 10,
                    width: SizeConfig.blockSizeVertical * 10,
                    child: Image(image: AssetImage(imgUrl))),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 10,
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Color(0xFFFF003D),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      rocket,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      desc,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).shadowColor),
                    ),
                    custom ??
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
  }
}
