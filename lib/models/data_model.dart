class Data {
  final String title;
  final List<dynamic> data;
  Data({required this.title, required this.data});

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(title: json['title'], data: json['data']);
}
