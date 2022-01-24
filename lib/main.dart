//@dart=2.9
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int Datechosen = 0, Monthchosen = 0, Yearchosen = 0;
  String year = '', month = '', days = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                pickBdate();
              },
              child: Text('Pick a Date'),
            ),
            Text(year + ' ' + month + ' ' + days + ' '),
          ],
        ),
      ),
    );
  }

  Future pickBdate() async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    Datechosen = int.parse(DateFormat("dd").format(date));
    Monthchosen = int.parse(DateFormat("MM").format(date));
    Yearchosen = int.parse(DateFormat("yyyy").format(date));

    int currentDate = int.parse(DateFormat("dd").format(DateTime.now()));
    int currentMonth = int.parse(DateFormat("MM").format(DateTime.now()));
    int currentYear = int.parse(DateFormat("yyyy").format(DateTime.now()));

    int numberOfDays = findDays(currentMonth, currentYear);

    setState(() {
      if (currentDate - Datechosen >= 0) {
        days = (currentDate - Datechosen).toString() + " days";
      } else {
        days = (currentDate + numberOfDays - Datechosen).toString() + " days";
        currentMonth--;
      }

      if (currentMonth - Monthchosen >= 0) {
        month = (currentMonth - Monthchosen).toString() + " months";
      } else {
        month = (currentMonth + 12 - Monthchosen).toString() + " months";
        currentYear--;
      }

      year = (currentYear - Yearchosen).toString() + " years";
    });
  }

  int findDays(int currentMonth, int currentYear) {
    if (currentMonth == 1 ||
        currentMonth == 3 ||
        currentMonth == 5 ||
        currentMonth == 7 ||
        currentMonth == 8 ||
        currentMonth == 10 ||
        currentMonth == 12) {
      return 31;
    } else if (currentMonth == 4 ||
        currentMonth == 6 ||
        currentMonth == 9 ||
        currentMonth == 11) {
      return 30;
    } else {
      if (checkYear(currentYear)) {
        return 29;
      } else {
        return 28;
      }
    }
  }

  bool checkYear(int year) {
    if (year % 400 == 0) return true;

    if (year % 100 == 0) return false;

    if (year % 4 == 0) return true;
    return false;
  }
}
