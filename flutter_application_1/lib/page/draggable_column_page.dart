import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/draggable_widget.dart';

import '../data/data.dart';

// import '../model/animal.dart';

class DraggableColumnPage extends StatefulWidget {
  const DraggableColumnPage({Key? key}) : super(key: key);
  // get Animals from assets
  // final List<Animal> all = allAnimals;

  @override
  State<StatefulWidget> createState() {
    return _DraggableColumnPageState();
  }
}

class _DraggableColumnPageState extends State<DraggableColumnPage> {
  final List<Animal> all = allAnimals;

  final List<Animal> air = [];
  final List<Animal> land = [];
  final List<Animal> sea = [];
  int score = 0;

  void removeAll(Animal toRemove) {
    all.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    land.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    air.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    sea.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: buildAppBar(score: score);
        // appBar:add app bar with score

        appBar: AppBar(
          title: const Text('Columns Draggable'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Columns Draggable'),
              // icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DraggableColumnPage(),
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
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // add to the top
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // add score at the top
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Score: $score',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      'All',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Air',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Animals',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Sea',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildTarget(
                      context,
                      text: 'All',
                      animals: all,
                      acceptTypes: AnimalType.values,
                      onAccept: (data) => setState(() {
                        removeAll(data);
                        all.add(data);
                        // all.removeWhere(
                        //     (animal) => animal.imageUrl == data.imageUrl);
                        print('data: $data');
                      }),
                    ),
                    // add divider between all and birds from top to bottom
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 20,
                      width: 20,
                    ),
                    buildTarget(
                      context,
                      text: 'Air',
                      animals: air,
                      acceptTypes: [AnimalType.air],
                      // onAccept: (data) => addAnimal(data),
                      onAccept: (data) => setState(() {
                        removeAll(data);
                        air.add(data);
                        // all.removeWhere(
                        //     (animal) => animal.imageUrl == data.imageUrl);
                        print('data: $data');
                      }),
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 20,
                      width: 20,
                    ),
                    buildTarget(
                      context,
                      text: 'Land',
                      animals: land,
                      acceptTypes: [AnimalType.land],
                      // onAccept: (data) => addAnimal(data),
                      onAccept: (data) => setState(() {
                        removeAll(data);
                        land.add(data);
                        // all.removeWhere(
                        //     (animal) => animal.imageUrl == data.imageUrl);
                        print('data: $data');
                      }),
                    ),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 20,
                      width: 20,
                    ),
                    buildTarget(
                      context,
                      text: 'Sea',
                      animals: sea,
                      acceptTypes: [AnimalType.sea],
                      // onAccept: (data) => addAnimal(data),
                      onAccept: (data) => setState(() {
                        removeAll(data);
                        sea.add(data);
                        // all.removeWhere(
                        //     (animal) => animal.imageUrl == data.imageUrl);
                        print('data: $data');
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // child:
        ),
      );

  Widget buildOrigin() => Stack(
        alignment: Alignment.topCenter,
        children: all.map((animal) => DraggableWidget(animal: animal)).toList(),
      );

  // Widget buildTargets(BuildContext context) =>
  Widget buildTarget(
    BuildContext context, {
    required String text,
    required List<Animal> animals,
    required List<AnimalType> acceptTypes,
    required DragTargetAccept<Animal> onAccept,
  }) =>
      Flexible(
        flex: 1,
        // set gap between columns
        fit: FlexFit.tight,
        child: Container(
          // flex: 1
          // width: 100,
          height: 800,
          // add background color
          color: Colors.blue,
          // align to top
          // radius: 75,
          // backgroundColor: Colors.blue,
          child: DragTarget<Animal>(
            builder: (context, candidateData, rejectedData) => Center(
              child: SingleChildScrollView(
                child: Column(
                  // how to set column to 100% height
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // align to top
                  // add background color for column
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Hello'),
                    ...animals
                        .map((animal) => DraggableWidget(
                              animal: animal,
                            ))
                        .toList(),
                    IgnorePointer(
                      child: Center(
                        child: buildText(text),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // onWillAccept: (data) => data!.type == acceptType,
            onWillAccept: (data) => true,
            onAccept: (data) {
              if (acceptTypes.contains(data.type)) {
                print('data: $data');
                print('Type: ${data.type}');
                Utils.showSnackBar(context, const Text('This is correct!'),
                    color: Colors.green);
                setState(() {
                  score += 1;
                  // all.removeWhere((animal) => animal.imageUrl == data.imageUrl);
                });
              } else {
                print('data: $data');
                print('Type: ${data.type}');
                Utils.showSnackBar(context, const Text('This is wrong!!'),
                    color: Colors.red);
                setState(() {
                  score -= 1;
                  // all.removeWhere((animal) => animal.imageUrl == data.imageUrl);
                });
              }
              onAccept(data);
            },
          ),
        ),
      );

  buildText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 24, color: Colors.white),
    );
  }
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
