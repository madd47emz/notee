import 'package:flutter/material.dart';

import 'noteCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late NoteCard add;
  late String details;
  List<NoteCard> list = [
    NoteCard(
        data:
            "hi i am mohamed emziane and this is a test for flutter text to speach",
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Notee'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.note_alt_outlined))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                  title: const Text('Adding Note'),
                  content:
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        details = value;
                      });
                    },
                    decoration:
                    const InputDecoration(hintText: "write"),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel',
                          style: TextStyle(color: Colors.red)),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                      ),
                    )
                  ]));
          if(response=="OK"){
            setState(() {
              add = NoteCard(data: details, date: DateTime.now());
              list.add(add);
            });
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Note Added")));}
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: AlignmentDirectional.centerEnd,
                child: Icon(Icons.delete_forever,color: Colors.white,size: 50,),
              ),
              key: Key(list[index].toString()),
              confirmDismiss: (direction) async {
                var response = await
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                        title: const Text('Delete'),
                        content:
                        const Text('Do you want to delete this note'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel',
                                style: TextStyle(color: Colors.black)),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text(
                              'OK',
                              style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                            ),
                          )
                        ]));
                if(response=="OK"){
                  setState(() {
                    list.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Note deleted")));}
              },
              child: list[index]);
        },
        itemCount: list.length,
      ),
    );
  }
}
