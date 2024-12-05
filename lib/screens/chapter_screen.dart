import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/data_model.dart';
import '../../utils/colors.dart';
import '../../utils/consts.dart';
import '../../utils/styles.dart';
import '../provider/animation_provider.dart';

class ChapterScreen extends StatefulWidget {
  final List<Data> chapters;
  final String title;

  const ChapterScreen({super.key, required this.chapters, required this.title});

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  late final animationProvider;
  double screenWidth = 0;

  @override
  void initState() {
    super.initState();
    animationProvider = Provider.of<AnimationProvider>(context, listen: false);
    animationProvider.resetAnimation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animationProvider.triggerAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: Text(widget.title, style: mediumTextStyle()),
        iconTheme: const IconThemeData(color: light),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.separated(
          itemCount: widget.chapters.length,
          separatorBuilder: (context, index) {
            return height(0);
          },
          itemBuilder: (context, index) {
            return item(context, index);
          },
        ),
      ),
    );
  }

  item(BuildContext context, int index) {
    int i = 100;
    return Consumer<AnimationProvider>(builder: (context, provider, child) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 500 + (index * 80)),
        curve: Curves.easeInOut,
        transform:
            Matrix4.translationValues(provider.startAnimation ? 0 : screenWidth, 0, 0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/view', arguments: [
              widget.chapters[index].title,
              widget.chapters[index].data as List<String>
            ]);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${index + 1}. ${widget.chapters[index].title}",
                  style: mediumTextStyle(color: background)),
            ),
          ),
        ),
      );
    });
  }
}
