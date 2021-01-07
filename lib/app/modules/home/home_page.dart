import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button/button.dart';
import 'home_controller.dart';
import 'text_field/text_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  var error = false;
  var isLoading = false;

  Future<void> onSubmit() async {
    setState(() {
      isLoading = true;
      error = false;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
    if (controller.email != 'test@test.com') {
      setState(() {
        error = true;
      });
    }
    if (controller.password != 'test') {
      setState(() {
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/logo.svg',
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 26),
                  child: Text(
                    'Login to your existing account by entering your e-mail and your password.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xCC323438),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 44,
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
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
                      Observer(builder: (_) {
                        return TextFieldWidget(
                          haveError: error,
                          colorize: controller.isFilledMail,
                          icon: Feather.mail,
                          label: 'E-Mail',
                          onChange: controller.setEmail,
                          placeholder: 'Enter your e-mail',
                        );
                      }),
                      SizedBox(
                        height: 30,
                      ),
                      Observer(builder: (_) {
                        return TextFieldWidget(
                          haveError: error,
                          obscureText: !controller.showPass,
                          colorize: controller.isFilledPass,
                          suffixIcon: IconButton(
                            onPressed: controller.setShowPass,
                            icon: Icon(controller.showPass
                                ? Feather.eye_off
                                : Feather.eye),
                          ),
                          icon: Feather.lock,
                          label: 'Password',
                          onChange: controller.setPassword,
                          placeholder: 'Enter your password',
                        );
                      }),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Color(0xCC323438)),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      error
                          ? Text(
                              'Incorrect e-mail & password combination. Try e-mail: test@test.com and password: test',
                              style: TextStyle(
                                  color: Theme.of(context).errorColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          : Container(),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Observer(builder: (_) {
                              return Button(
                                isLoading: isLoading,
                                onSubmit: controller.isFilledMailAndPass
                                    ? onSubmit
                                    : null,
                                primaryColor: controller.isFilledMailAndPass
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                secondaryColor: controller.isFilledMailAndPass
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).shadowColor,
                                tertiaryColor: controller.isFilledMailAndPass
                                    ? Colors.white
                                    : Theme.of(context).shadowColor,
                              );
                            }),
                            SizedBox(
                              height: 35,
                            ),
                            RichText(
                                text: TextSpan(
                              style: GoogleFonts.nunitoSans(fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Don’t have an account? Let’s ',
                                    style: TextStyle(
                                      color: Color(0xCC323438),
                                    )),
                                TextSpan(
                                    text: 'Register',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF167BD8))),
                              ],
                            )),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
