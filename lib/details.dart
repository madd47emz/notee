import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Details extends StatefulWidget {
  final String data;
  final DateTime date;
  const Details({Key? key, required this.data, required this.date}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  FlutterTts flutterTts = FlutterTts();
  // @override
  // void initState() {
  //   super.initState();
  //   var flutterTts = ;
  // }
  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back, color: Colors.deepPurpleAccent,)),
        ),
        backgroundColor: Colors.white,
        body:

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              height: 50,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text(
                    "EM",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Mohamed Emziane",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(15),

                ),
                elevation: 16,
                shadowColor: Colors.black,

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${this.widget.date.year}/${this.widget.date.month}/${this.widget.date.day}",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      Text(this.widget.data,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          )),

                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () async {

                  await flutterTts.speak("${this.widget.date.year}/${this.widget.date.month}/${this.widget.date.day}. "+this.widget.data);

                },
                child: Card(
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(15),

                  ),
                  elevation: 16,
                  shadowColor: Colors.black,
                  child: Icon(
                    size: 90,
                    Icons.mic,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ),
          ],
        ));
  }


}



