import 'package:flutter/material.dart';

class SpeechToTextScreen extends StatefulWidget {
  @override
  _SpeechToTextScreenState createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  String _text = '';

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Center( child :Text('Your Cart',style: TextStyle(color: Colors.black), ),),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          SingleChildScrollView(),

          Container(
            color: Color.fromARGB(255, 231, 250, 250), 
            padding: EdgeInsets.all(10),
            child:Column(
           children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total Price",style: TextStyle(fontSize: 17, color: Colors.black),),
                 Text("00.00 DH",style: TextStyle(fontSize: 17, color: Colors.amber),),
              ],
            ),
            SizedBox(height: 16,),
            
            ElevatedButton(onPressed: (){}, child: Text("Chek out") ,style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                ),
                primary: Colors.amber
              ),),
             

           ],
          ),),
        ]),
      ),
    );
  }
}
