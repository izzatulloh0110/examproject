import 'package:flutter/material.dart';
class LastPage extends StatefulWidget {
  static const id = "last_page";
  const LastPage({Key? key}) : super(key: key);

  @override
  State<LastPage> createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:MediaQuery.of(context).size.width ,
        padding: const EdgeInsets.only(left: 25,right: 25),
        color: Colors.lightGreen.shade50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 200,),
            //All Done
            Text("All done",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.green.shade800,
                  fontWeight: FontWeight.w800
                )),
           const SizedBox(height: 40,),
            //text
           const Padding(
              padding: EdgeInsets.only(right: 40),
                child: Text("Thanks for giving us your precious time.Now you are ready for an enjoyablemoment.",style: TextStyle(fontSize: 20),)),
          const  SizedBox(height: 40,),
            //Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("images/img1.png"),)
              ),
              width: 400,
              height: 300,
            ),
           const SizedBox(height: 120,),
            //button
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
              ),
              child: MaterialButton(
                shape: const StadiumBorder(),
                color: Colors.green.shade800,
                height: 60,

                  child:const Text("Let's go",style: TextStyle(color: Colors.white,fontSize: 25),),
                  onPressed:(){ }),
            ),

            
          ],
        ),
      ),
    );
  }
}
