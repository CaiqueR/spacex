import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final Function onChange;
  final String label;
  final String placeholder;
  final IconData icon;
  final bool colorize;
  final Widget suffixIcon;
  final bool obscureText;
  final bool haveError;

  const TextFieldWidget(
      {Key key,
      this.onChange,
      this.label,
      this.placeholder,
      this.icon,
      this.colorize = false,
      this.suffixIcon,
      this.obscureText = false,
      this.haveError = false})
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      height: MediaQuery.of(context).size.height / 8,
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
            obscureText: obscureText,
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
