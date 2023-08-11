import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'otp_auth_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  String countryCode = "+91";
  final FocusNode _phoneFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                margin: const EdgeInsets.only(top: 100),
                width: MediaQuery.of(context).size.width,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFd45113),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    "assets/logo/logo_white.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    "For memories that won't fade",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 60,
                  left: 40,
                ),
                width: 200,
                child: Text(
                  "Enter your phone number to login or register",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 60, 40, 0),
                child: IntlPhoneField(
                  controller: phoneController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: Theme.of(context).textTheme.labelSmall,
                    border: const UnderlineInputBorder(),
                  ),
                  initialCountryCode: 'IN',
                  onCountryChanged: (value) {
                    countryCode = value.dialCode;
                  },
                  focusNode: _phoneFocusNode,
                  disableLengthCheck: true,
                  onTap: () {},
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: FilledButton(
                    child: const Text(
                      "Login using phone",
                    ),
                    onPressed: () {
                      _phoneFocusNode.unfocus();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPPage(
                            phoneNumber: "$countryCode${phoneController.text}",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
