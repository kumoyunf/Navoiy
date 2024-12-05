import '../data/data.dart';

class Author {
  final String name;
  final Category category;
  final String description;

  Author({required this.name, required this.category, required this.description});

  factory Author.fromJson(Map<String, dynamic> json) =>
      Author(name: json['name'], category: json['category'], description: json['description']);
}