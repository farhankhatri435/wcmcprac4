import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyApp> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  String result = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRACTICAL_3'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            // first input field
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: 'Enter 1st number',
                  hintText: 'Enter 1st number',
                ),
                keyboardType: TextInputType.number,
                controller: num1,
              ),
            ),
            //second input filed
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: 'Enter 2nd number',
                  hintText: 'Enter 2nd number',
                ),
                keyboardType: TextInputType.number,
                controller: num2,
              ),
            ),
            ElevatedButton(
              child: Text('ADD'),
              onPressed: () {
                setState(() {
                  int sum = int.parse(num1.text) + int.parse(num2.text);
                  result = sum.toString();
                });
              },
            ),
            SizedBox(height: 30),
            Text(
              result,
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
