import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/draggable_widget.dart';

import '../data/data.dart';

// import '../model/animal.dart';

class DraggableAdvancedPage extends StatefulWidget {
  const DraggableAdvancedPage({Key? key}) : super(key: key);
  // get Animals from assets
  // final List<Animal> all = allAnimals;

  @override
  State<StatefulWidget> createState() {
    return _DraggableAdvancedPageState();
  }
}

class _DraggableAdvancedPageState extends State<DraggableAdvancedPage> {
  final List<Animal> all = allAnimals;
  final List<Animal> air = [];
  final List<Animal> land = [];
  int score = 0;

  void removeAll(Animal toRemove) {
    all.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    land.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    air.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: buildAppBar(score: score);
        // appBar:add app bar with score
        appBar: AppBar(
          title: const Text('Advanced Draggable'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Advanced Draggable'),
              // icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DraggableAdvancedPage(),
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
                  ),
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildTarget(
                      context,
                      text: 'Birds',
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
                    buildTarget(
                      context,
                      text: 'Animals',
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
                  ],
                ),
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

  // Widget buildTargets(BuildContext context) =>

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required List<Animal> animals,
    required List<AnimalType> acceptTypes,
    required DragTargetAccept<Animal> onAccept,
  }) =>
      CircleAvatar(
        radius: 75,
        backgroundColor: Colors.blue,
        child: DragTarget<Animal>(
          builder: (context, candidateData, rejectedData) => Center(
            child: Stack(
              children: [
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
      );

  buildText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 24, color: Colors.white),
    );
  }

  // addAnimal(Animal data) {
  //   setState(() {
  //     print(data);
  //   });
  // }
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
