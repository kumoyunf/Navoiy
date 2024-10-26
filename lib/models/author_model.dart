class Author {
  final String name;
  final String description;

  Author({required this.name, required this.description});

  factory Author.fromJson(Map<String, dynamic> json) =>
      Author(name: json['name'], description: json['description']);
}