import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  // Color color = Colors.black;
  Color caughtColor = Color.fromARGB(255, 248, 94, 235);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final showDraggable = color == Colors.black;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: [
                DragTarget<Color>(
                  onAccept: (Color color) {
                    caughtColor = color;
                  },
                  builder: (
                    BuildContext context,
                    List<dynamic> acceptedData,
                    List<dynamic> rejectedData,
                  ) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: acceptedData.isEmpty
                          ? caughtColor
                          : Color.fromARGB(255, 89, 89, 89),
                      child: const Center(
                        child: Text('1st container'),
                      ),
                    );
                  },
                  // onWillAccept: (data) {
                  //   return true;
                  // },
                ),
                DragTarget<Color>(
                  onAccept: (Color color) {
                    caughtColor = color;
                  },
                  builder: (
                    BuildContext context,
                    List<dynamic> acceptedData,
                    List<dynamic> rejectedData,
                  ) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: acceptedData.isEmpty
                          ? caughtColor
                          : Color.fromARGB(255, 89, 89, 89),
                      child: const Center(
                        child: Text('2nd container'),
                      ),
                    );
                  },
                  // onWillAccept: (data) {
                  //   return true;
                  // },
                ),
                DragTarget<Color>(
                  onAccept: (Color color) {
                    caughtColor = color;
                  },
                  builder: (
                    BuildContext context,
                    List<dynamic> acceptedData,
                    List<dynamic> rejectedData,
                  ) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: acceptedData.isEmpty
                          ? caughtColor
                          : Color.fromARGB(255, 89, 89, 89),
                      child: const Center(
                        child: Text('3rd container'),
                      ),
                    );
                  },
                  // onWillAccept: (data) {
                  //   return true;
                  // },
                ),
              ],
            ),
            Draggable<Color>(
              data: Colors.green,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: Text('Draggable'),
              ),
              feedback: Container(
                width: 150,
                height: 150,
                color: Color.fromARGB(66, 255, 153, 0),
                child: Center(
                  child: Text(
                    'Feedback',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              childWhenDragging: Container(
                width: 200,
                height: 200,
                color: Colors.red,
                child: Text('Child When Dragging'),
              ),
              onDraggableCanceled: (velocity, offset) => setState(() {
                caughtColor = Color.fromARGB(255, 159, 92, 92);
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
