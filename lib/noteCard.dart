import 'package:flutter/material.dart';

import 'details.dart';

class NoteCard extends StatefulWidget {
  final String data;
  final DateTime date;
  const NoteCard({Key? key, required this.data, required this.date}) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {

  @override
  Widget build(BuildContext context) {
    int detailLength = MediaQuery.of(context).orientation == Orientation.landscape? 30:10;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      child: GestureDetector(

        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Details(data: this.widget.data,date: this.widget.date,)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),

          ),
          elevation: 16,
          shadowColor: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Text("EM",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

                ),
              ),
              Column(
                children: [
                  Text("Mohamed Emziane",style: TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.bold)),
                  Text(this.widget.data.substring(0,detailLength)+"...",style: TextStyle(color: Colors.grey,fontSize:20,)),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("${this.widget.date.month}/${this.widget.date.day}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              )


            ],
          ),
        ),
      ),
    );
  }
}
