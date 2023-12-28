
class Youth {
  late final String name;
  late final String image;
  late final String description;
  late final String about ;

  Youth(
      {required this.name,
      required this.image,
      required this.description,
      required this.about,
       required Youth youth ,
      });

  Youth.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    about = map['about'] ;
  }

  Map<String, dynamic> toMap() =>
      {'name': name, 
      'image': image, 
      'description': description, 
      'about': about
      };
}
