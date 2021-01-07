import 'package:flutter/material.dart';
import 'package:spacex/app/util/size_config.dart';

class Button extends StatelessWidget {
  final Function onSubmit;
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final bool isLoading;

  const Button(
      {Key key,
      this.onSubmit,
      this.primaryColor,
      this.secondaryColor,
      this.tertiaryColor,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: RaisedButton(
          disabledColor: primaryColor,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 26),
          onPressed: onSubmit,
          color: primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                width: 3,
                color: secondaryColor,
              )),
          child: Container(
            height: SizeConfig.blockSizeVertical * 2,
            alignment: Alignment.center,
            child: isLoading
                ? SizedBox(
                    child: CircularProgressIndicator(),
                    height: SizeConfig.blockSizeVertical * 2,
                    width: SizeConfig.blockSizeVertical * 2,
                  )
                : Text(
                    'Login',
                    style: TextStyle(color: tertiaryColor, fontSize: 18),
                  ),
          ),
        )),
      ],
    );
  }
}
