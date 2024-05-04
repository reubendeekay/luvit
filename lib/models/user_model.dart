class UserModel {
  final int age;
  final String description;
  final List<dynamic> images;
  final String location;
  final String name;
  final List<dynamic> tags;
  final int likeCount;

  UserModel(
      {required this.age,
      required this.description,
      required this.images,
      required this.location,
      required this.name,
      required this.likeCount,
      required this.tags});

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
        age: json['age'],
        description: json['description'],
        images: json['images'] ?? [],
        location: json['location'],
        name: json['name'],
        likeCount: json['likeCount'] ?? 0,
        tags: json['tags'] ?? []);
  }
}
