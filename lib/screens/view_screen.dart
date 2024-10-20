import 'package:flutter/material.dart';
import 'package:navoiy/utils/colors.dart';  // Sizning color faylingiz
import 'package:navoiy/utils/styles.dart';  // Sizning style faylingiz

class ViewScreen extends StatelessWidget {
  final String title;
  final List<String> data;
  final ScrollController _scrollController = ScrollController();

  ViewScreen({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(title, style: largeTextStyle()),
        backgroundColor: background,
        iconTheme: const IconThemeData(
          color: light,
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        interactive: true,
        thumbVisibility: true,
        thickness: 8,
        radius: const Radius.circular(10),
        trackVisibility: true,
        child: ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.all(12),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: light.withAlpha(80),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SelectableText(
                data[index],
                style: mediumTextStyle(),
                // showCursor: true,
                cursorColor: light,
              ),
            );
          },
        ),
      ),
    );
  }
}
