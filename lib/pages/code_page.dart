import 'package:examproject/pages/last_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class CodePage extends StatefulWidget {
  static const String id = "code_page";
  const CodePage({Key? key}) : super(key: key);

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData.fallback(),
          backgroundColor: Colors.lightGreen.shade50,
          shadowColor: Colors.transparent,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          color: Colors.lightGreen.shade50,
          child: ListView(
            children: [
              const SizedBox(
                height: 70,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Create your pin code",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                  padding: const EdgeInsets.only(right: 100),
                  child: const Text(
                      "Create a 4-digit PIN code that will be used every time you login")),
              const SizedBox(
                height: 100,
              ),
              Pinput(
                controller: pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                obscureText: true,
                // obscuringCharacter: "*",
                defaultPinTheme: defaultPinTheme,
                validator: (value) {
                  return value == '2222' ? null : 'Pin is incorrect';
                },
                // onClipboardFound: (value) {
                //   debugPrint('onClipboardFound: $value');
                //   pinController.setText(value);
                // },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
              const SizedBox(
                height: 350,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.green.shade800),
                child: MaterialButton(
                    child: const Text(
                      "Confirm",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      focusNode.unfocus();
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, LastPage.id);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
