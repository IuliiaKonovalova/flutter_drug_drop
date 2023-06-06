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
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-4.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-5.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-6.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-7.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-8.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-9.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-10.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-11.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-12.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-13.png',
  ),
  const Animal(
    type: AnimalType.air,
    imageUrl: 'assets/images/air/bird-14.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/fish-1.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/fish-2.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/shark-1.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/shark-2.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/shark-3.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/whale-1.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/whale-2.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/whale-3.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/whale-4.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/whale-5.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/whale-6.png',
  ),
  const Animal(
    type: AnimalType.sea,
    imageUrl: 'assets/images/sea/whale-7.png',
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
