import 'package:examproject/pages/code_page.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  static const id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final numberController = TextEditingController();
  //formatter
  var maskFormatter = MaskTextInputFormatter(
      mask: '+998 ##-###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  final TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        padding: const EdgeInsets.only(left: 24, right: 24, top: 130),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.lightGreen.shade50,
        ),
        child: ListView(
          children: [
            //Text
            Container(
              padding: const EdgeInsets.only(right: 100),
              child: const Text("Enter your phone number",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Colors.black,
                  )),
            ),
            const SizedBox(height: 12),
            //Text
            Container(
              padding: const EdgeInsets.only(right: 30),
              child: const Text(
                "We're going to send you a verification code to confirm your identity",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 45),
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
               child: TextField(
                 controller: numberController,
                 keyboardType: TextInputType.number,
                 inputFormatters: [maskFormatter],
                 decoration:  const InputDecoration(
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20)),

                   ),
                     hintText: "Enter phone number"),
               )
            ),
            const SizedBox(height: 400,),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(20)),
                  color: Colors.green.shade800),
              child: MaterialButton(
                child: const Text("Verify phone Number",style: TextStyle(color: Colors.white),),
                  onPressed: (){Navigator.pushNamed(context, CodePage.id);}),
            )
          ],
        ),
      ),
    );
  }

}
