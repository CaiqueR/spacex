import 'package:flutter/material.dart';
import 'package:spacex/app/util/size_config.dart';

class TextFieldWidget extends StatelessWidget {
  final Function onChange;
  final Function onSubmit;
  final String label;
  final String placeholder;
  final IconData icon;
  final bool colorize;
  final Widget suffixIcon;
  final bool obscureText;
  final bool haveError;
  final FocusNode focus;
  final TextInputAction textInputAction;

  TextFieldWidget(
      {Key key,
      this.onChange,
      this.label,
      this.placeholder,
      this.icon,
      this.colorize = false,
      this.suffixIcon,
      this.obscureText = false,
      this.haveError = false,
      this.onSubmit,
      this.focus,
      this.textInputAction})
      : super(key: key);

  Color correctColor(BuildContext context) {
    if (haveError) {
      return Theme.of(context).errorColor;
    }
    if (colorize) {
      return Theme.of(context).primaryColor;
    }

    return Theme.of(context).shadowColor;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
      // height: SizeConfig.blockSizeVertical * 13,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white,
          border: Border.all(color: correctColor(context), width: 3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: correctColor(context),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: TextStyle(
                    color:
                        colorize ? Colors.black : Theme.of(context).shadowColor,
                    fontSize: 18),
              )
            ],
          ),
          TextField(
            textInputAction: textInputAction,
            obscureText: obscureText,
            onSubmitted: onSubmit,
            focusNode: focus,
            onChanged: onChange,
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).shadowColor,
                )),
          )
        ],
      ),
    );
  }
}
