class Activities {
  late final String name;
  late final String image;
  late final String description;

  Activities(
      {required this.name, 
      required this.image, 
      required this.description});

  Activities.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'image': image,
        'description': description,
      };
}
