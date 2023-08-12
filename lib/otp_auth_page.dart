import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  OtpFieldController otpController = OtpFieldController();
  String otpPin = "";
  int screenState = 0;
  String verID = "";

  @override
  initState() {
    super.initState();
    verifyPhone();
  }

  Future<void> verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        timeout: const Duration(seconds: 20),
        verificationCompleted: (PhoneAuthCredential credential) {
          showSnackBarText("Verification Completed");
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
          showSnackBarText("Verification Failed");
        },
        codeSent: (String verificationId, int? resendToken) {
          showSnackBarText("Code Sent");
          verID = verificationId;
          screenState = 1;
          print("verID: $verID");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          showSnackBarText("Timeout");
        });
  }

  Future<void> signIn() async {
    await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(verificationId: verID, smsCode: otpPin));
    Navigator.popAndPushNamed(context, "/home"!);
  }

  static Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  void showSnackBarText(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone Number'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 100,
            child: ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcATop),
              child: Image.asset("assets/icons/otp-icon.png"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "ENTER THE 4-DIGIT CODE",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              "Enter the 4-digit OTP you recieved in your messages to the number ${widget.phoneNumber}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          OTPTextField(
            controller: otpController,
            length: 6,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 45,
            fieldStyle: FieldStyle.underline,
            outlineBorderRadius: 15,
            otpFieldStyle:
                OtpFieldStyle(focusBorderColor: const Color(0xff813405)),
            style: Theme.of(context).textTheme.displayLarge!,
            onChanged: (pin) {
              otpPin = pin;
              print("Changed: $otpPin");
            },
            onCompleted: (pin) {
              setState(() {
                otpPin = pin;
              });
              print("Completed: $otpPin");
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Resend Code"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 60,
                child: FilledButton(
                  onPressed: () {
                    setState(
                      () {
                        signIn();
                      },
                    );
                  },
                  child: const Text("Verify Code"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
