import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text(
            'Caesar cipher',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = TextEditingController();
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              onChanged: (value) {
                List<String> list = value.split('');
                String encryptionSpeech = '';
                for (var i = 0; i < list.length; i++) {
                  if (list[i] == ' ') {
                    encryptionSpeech = encryptionSpeech + ' ';
                  } else {
                    if (((list[i].codeUnitAt(0)) + 3) > 122) {
                      encryptionSpeech = encryptionSpeech +
                          String.fromCharCode((list[i].codeUnitAt(0) - 26) + 3);
                    } else {
                      encryptionSpeech = encryptionSpeech +
                          String.fromCharCode((list[i].codeUnitAt(0)) + 3);
                    }
                  }
                }
                print(encryptionSpeech);
                setState(() {
                  _displayText = encryptionSpeech.toUpperCase();
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Text',
              ),
            ),
            SizedBox(height: 16),
            Icon(
              Icons.change_circle,
              size: 80,
              color: Colors.teal,
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.teal)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    _displayText,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
