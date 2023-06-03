import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/draggable_widget.dart';

import '../data/data.dart';

// import '../model/animal.dart';

class DraggableBasicPage extends StatefulWidget {
  const DraggableBasicPage({Key? key}) : super(key: key);
  // get Animals from assets
  // final List<Animal> all = allAnimals;

  @override
  State<StatefulWidget> createState() {
    return _DraggableBasicPageState();
  }
}

class _DraggableBasicPageState extends State<DraggableBasicPage> {
  final List<Animal> all = allAnimals;

  int score = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: buildAppBar(score: score);
        // appBar:add app bar with score
        appBar: AppBar(
          title: const Text('Draggable Basic'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Draggable Basic'),
              // icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DraggableBasicPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Container(
            // set width 100%
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // add score at the top
                Text(
                  'Score: $score',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buildOrigin(),
                buildTargets(context),
              ],
            ),
          ),
          // child:
        ),
      );

  Widget buildOrigin() => Stack(
        alignment: Alignment.center,
        children: all.map((animal) => DraggableWidget(animal: animal)).toList(),
      );

  Widget buildTargets(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildTarget(
            context,
            text: 'Animals',
            acceptType: AnimalType.land,
          ),
          buildTarget(
            context,
            text: 'Birds',
            acceptType: AnimalType.air,
          ),
        ],
      );

  Widget buildTarget(BuildContext context,
          {required String text, required AnimalType acceptType}) =>
      CircleAvatar(
        radius: 75,
        backgroundColor: Colors.blue,
        child: DragTarget<Animal>(
          builder: (context, candidateData, rejectedData) => Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          // onWillAccept: (data) => data!.type == acceptType,
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (data.type == acceptType) {
              Utils.showSnackBar(context, const Text('This is correct!'),
                  color: Colors.green);
              setState(() {
                score += 1;
                all.removeWhere((animal) => animal.imageUrl == data.imageUrl);
              });
            } else {
              Utils.showSnackBar(context, const Text('This is wrong!!'),
                  color: Colors.red);
              setState(() {
                score -= 1;
                // all.removeWhere((animal) => animal.imageUrl == data.imageUrl);
              });
            }
          },
        ),
      );
}

class Utils {
  static void showSnackBar(BuildContext context, Widget content,
      {Color color = Colors.blue}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: content,
        backgroundColor: color,
        duration: const Duration(milliseconds: 800),
      ),
    );
  }
}
