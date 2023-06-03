final allAnimals = [
  const Animal(
    type: AnimalType.land,
    imageUrl: 'assets/images/land/ant-1.png',
  ),
  const Animal(
    type: AnimalType.land,
    imageUrl: 'assets/images/land/cat-1.png',
  ),
  const Animal(
    type: AnimalType.land,
    imageUrl: 'assets/images/land/cat-2.png',
  ),
  const Animal(
    type: AnimalType.land,
    imageUrl: 'assets/images/land/dog-1.png',
  ),
  const Animal(
    type: AnimalType.land,
    imageUrl: 'assets/images/land/dog-2.png',
  ),
  const Animal(
    type: AnimalType.land,
    imageUrl: 'assets/images/land/dog-3.png',
  ),
  const Animal(
    type: AnimalType.land,
    imageUrl: 'assets/images/land/dog-4.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-1.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-2.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-3.png',
  ),
];

class Animal {
  final AnimalType type;
  final String imageUrl;

  const Animal({
    required this.type,
    required this.imageUrl,
  });
}

// class AnimalType {
//   static const land = AnimalType._('land');
//   static const sea = AnimalType._('sea');
//   static const air = AnimalType._('air');

//   final String _value;

//   const AnimalType._(this._value);

//   @override
//   String toString() => _value;
// }

enum AnimalType {
  land,
  air,
  sea,
}
