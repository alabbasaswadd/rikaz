class Student {
  final int id;
  final String name;
  final int age;
  final String image;

  Student(
      {required this.id,
      required this.name,
      required this.age,
      required this.image});

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      age: map['age'] as int,
      image: map['image'],
    );
  }
}
