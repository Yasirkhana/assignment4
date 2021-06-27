import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _todoText = TextEditingController();
  String error = "";
  List _todoList = [];

  addToDoList(String todest) {
    setState(() {
      _todoList.add(todest);
      error = "";
    });
  }

  deleteToList(int index) {
    setState(() {
      _todoList.removeAt(index);
      error = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "ToDo App ",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 4))),
                  controller: _todoText,
                ),
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      if (_todoText.text != "") {
                        addToDoList(_todoText.text);
                      } else {
                        setState(() {
                          error = "Field is Emplty";
                        });
                      }
                    },
                    child: Text("ADD")),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: _todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text("${_todoList[index]}",
                              style: TextStyle(color: Colors.blueAccent)),
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                deleteToList(index);
                              }),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}