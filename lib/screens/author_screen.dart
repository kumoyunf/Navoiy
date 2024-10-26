import 'package:flutter/material.dart';
import 'package:navoiy/models/author_model.dart';
import 'package:navoiy/utils/colors.dart';
import 'package:navoiy/utils/styles.dart';

class AuthorScreen extends StatelessWidget {
  final List<Author> authors;

  const AuthorScreen({super.key, required this.authors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          iconTheme: const IconThemeData(color: light),
          title: Text(
            "Mualliflar",
            style: mediumTextStyle(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
              itemCount: authors.length,
              itemBuilder: (context, index) {
                return Card(
                  color: gold,
                  child: ListTile(
                    title: Text(authors[index].name),
                    subtitle: Text(authors[index].description),
                    trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset('assets/images/navoiy.png')),
                  ),
                );
              }),
        ));
  }
}
