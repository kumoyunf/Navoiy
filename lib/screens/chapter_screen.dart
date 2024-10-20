import 'package:flutter/material.dart';

import '../../models/data_model.dart';
import '../../utils/colors.dart';
import '../../utils/consts.dart';
import '../../utils/styles.dart';

class ChapterScreen extends StatelessWidget {
  final List<Data> chapters;
  final String title;
  const ChapterScreen({super.key, required this.chapters, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(title, style: mediumTextStyle()),
        iconTheme: const IconThemeData(
          color: light
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
          itemCount: chapters.length,
          separatorBuilder: (context, index){
            return height(0);
          },
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('/view', arguments: [chapters[index].title, chapters[index].data as List<String>]);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${index+1}. ${chapters[index].title}", style: mediumTextStyle(color: background)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
