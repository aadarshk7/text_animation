import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddNotePad extends StatefulWidget {
  const AddNotePad({super.key});

  @override
  State<AddNotePad> createState() => _AddNotePadState();
}

class _AddNotePadState extends State<AddNotePad> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  List notes = [];

  //Function for post request
  Future<void> PostNote() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/post");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': _titleController.text,
        'body': _contentController.text,
        'userId': '1', // for usedId 1
      }),
    );
    if (response.statusCode == 201) {
      // the data successfully posted
      final data = jsonDecode(response.body);
      print("Response data: $data");
    } else {
      print('Failed to post data to the server ${response.statusCode}');
    }
  }

  //Function for fetch or get the data
  Future<void> GetNote() async {
    final url = Uri.parse(
        "https://jsonplaceholder.typicode.com/posts"); // API for get request
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Response data: $data");
    } else {
      print("Failed to get data from the server ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    GetNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                hintText: "Content",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              PostNote();
            },
            child: const Text("Add Note"),
          ),
          Expanded(
            child: notes.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(notes[index]['title']),
                          subtitle: Text(notes[index]['content']),
                        )),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddNotePad(),
  ));
}
