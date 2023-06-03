import 'package:flutter/material.dart';

import 'page/draggable_advanced_page.dart';
import 'page/draggable_basic_page.dart';
import 'page/draggable_column_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drag and Drop Demo',
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  // State<MyHomePage> createState() => _MyHomePageState();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Demo'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Draggable Basic'),

            // icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DraggableBasicPage()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Draggable Advanced'),
            // icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DraggableAdvancedPage()),
              );
            },
          ),
          // DraggableColumnPage
          ElevatedButton(
            child: const Text('Draggable Columns'),
            // icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DraggableColumnPage()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        // child: ElevatedButton(
        //   child: Text('Go to Page 1'),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => DraggableBasicPage()),
        //     );
        //   },
        // ),
        child: Text('Home Page'),
      ),
    );
  }
}
