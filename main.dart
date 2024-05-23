import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';
  void changeText(String text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('MMM dd,yyyy  h:mm:ss a').format(DateTime.now());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 18.0), // adjust the value as needed
              child: Container(
                  color: Colors.white,
                  height: 10.0), // adjust the height as needed
            ),
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/photo_5936262260911620149_y (1).png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
                Positioned(
                  top: 310.0, // adjust the values as needed
                  right: 50.0, // adjust the values as needed
                  child: IconButton(
                    icon: Icon(Icons.add_box,
                        size: 100.0), // adjust the size as needed
                    color: Color.fromARGB(0, 189, 39, 39),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InsertValue(this.changeText)),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 116, // change to desired x-coordinate
                  top: 221, // change to desired y-coordinate
                  child: Text(
                    '$formattedDate',
                    style: TextStyle(
                      color: Color.fromARGB(183, 255, 255, 255),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String insertedText;
  const NextPage({Key? key, required this.insertedText}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 14.0), // adjust the value as needed
              child: Container(
                  color: Colors.white,
                  height: 10.0), // adjust the height as needed
            ),
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/photo_5927213649582212744_y (1) (2) (1).png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                Positioned(
                  left: 62, // change to desired x-coordinate
                  top: 266, // change to desired y-coordinate
                  child: Text(
                    '$formattedDate',
                    style: TextStyle(
                      fontFamily: 'AsimovPrintC',
                      color: Color.fromARGB(255, 61, 69, 71),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  left: 73, // change to desired x-coordinate
                  top: 209.0, // change to desired y-coordinate
                  child: Text(
                    widget.insertedText, // Use the inserted text here
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 77, 80),
                      fontSize: 16,
                      fontFamily: 'AsimovPrintC',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 83.0, // adjust the values as needed
                  right: 20.0, // adjust the values as needed
                  child: IconButton(
                    icon: Icon(Icons.close,
                        size: 30.0), // adjust the size as needed
                    color: Color.fromARGB(0, 214, 12, 12),
                    splashColor: Colors.white, // adjust the color as needed
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InsertValue extends StatefulWidget {
  final Function(String) callback;
  InsertValue(this.callback);

  @override
  State<InsertValue> createState() => _InsertValueState();
}

class _InsertValueState extends State<InsertValue> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 14.0), // adjust the value as needed
              child: Container(
                  color: Colors.white,
                  height: 10.0), // adjust the height as needed
            ),
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/photo_5927213649582212743_y (1) (2) (1) (1) (1) (1).png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                Positioned(
                  top: 265.0, // adjust the values as needed
                  right: 150.0, // adjust the values as needed
                  child: IconButton(
                    icon: Transform(
                      transform: Matrix4.identity()
                        ..scale(8.0, 1.0), // adjust the value as needed
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add_box,
                        size: 60.0,
                      ), // adjust the size as needed
                    ),
                    color: Color.fromARGB(0, 243, 12, 12),
                    splashColor: const Color.fromARGB(
                        255, 255, 255, 255), // adjust the color as needed
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NextPage(insertedText: controller.text)),
                      );
                    },
                  ),
                ),
                Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 118.0), // adjust the value as needed
                    child: Container(
                        color: const Color.fromARGB(0, 255, 255, 255),
                        height: 10.0), // adjust the height as needed
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..scale(0.92, 0.8), // adjust the value as needed
                    alignment: Alignment.center,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Amount',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        fillColor: Color.fromARGB(0, 255, 255, 255),
                        filled: true,
                      ),
                    ),
                  )
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
