import 'package:flutter/material.dart';
import 'package:navoiy/utils/consts.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../provider/text_settings.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: "Matn Sozlamalari",
            onPressed: () {
              var dialog = AlertDialog(
                backgroundColor: background,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Matn sozlamalari", style: largeTextStyle()),
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        tooltip: "Yopish",
                        icon: const CircleAvatar(
                            backgroundColor: darkRed,
                            radius: 18,
                            child: Icon(Icons.close, color: light)))
                  ],
                ),
                content: SingleChildScrollView(
                  child: Consumer<TextSettings>(
                    builder: (context, textSettings, child) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Matn o'lchami: ${Provider.of<TextSettings>(context, listen: false).fontSize.toStringAsFixed(0)}",
                                style: mediumTextStyle(),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: Provider.of<TextSettings>(
                                            context,
                                            listen: false)
                                        .decreaseFontSize,
                                    icon: Icon(Icons.remove, color: light),
                                  ),
                                  IconButton(
                                    onPressed: Provider.of<TextSettings>(
                                            context,
                                            listen: false)
                                        .increaseFontSize,
                                    icon: const Icon(Icons.add, color: light),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Shrift tanlash
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shrift tanlash:", style: mediumTextStyle()),
                              DropdownButton<String>(
                                style: TextStyle(color: textColor),
                                dropdownColor: dark,
                                value: Provider.of<TextSettings>(context,
                                        listen: false)
                                    .fontFamily,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    Provider.of<TextSettings>(context,
                                            listen: false)
                                        .changeFontFamily(newValue);
                                  }
                                },
                                items: [
                                  'Arial',
                                  'Courier',
                                  'Times',
                                  'Verdana',
                                  'Roboto'
                                ].map<DropdownMenuItem<String>>((String font) {
                                  return DropdownMenuItem<String>(
                                      value: font,
                                      child:
                                          Text(font, style: mediumTextStyle()));
                                }).toList(),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Orqa fon rangini tanlash:",
                                  style: mediumTextStyle()),
                              height(8),
                              Row(
                                children: [
                                  light,
                                  dark,
                                  seaGreen,
                                  khaki,
                                  darkRed,
                                  gold,
                                  steelBlue,
                                  lightBlue,
                                ].map((color) {
                                  return GestureDetector(
                                    onTap: () {
                                      Provider.of<TextSettings>(context,
                                              listen: false)
                                          .changeTextBackColor(color);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: color,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),

                          // Matn rangini tanlash
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Matn rangini tanlash:",
                                  style: mediumTextStyle()),
                              height(8),
                              Row(
                                children: [
                                  light,
                                  dark,
                                  seaGreen,
                                  khaki,
                                  darkRed,
                                  gold,
                                  steelBlue,
                                  lightBlue,
                                  darkSlateGray
                                ].map((color) {
                                  return GestureDetector(
                                    onTap: () {
                                      Provider.of<TextSettings>(context,
                                              listen: false)
                                          .changeTextColor(color);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: color,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          height(18),

                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: textSettings.textBackColor.withAlpha(80),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              'Sozlangan matn',
                              style: TextStyle(
                                fontFamily: textSettings.fontFamily,
                                fontSize: textSettings.fontSize,
                                fontWeight: FontWeight.bold,
                                color: textSettings.textColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
              showDialog(
                  context: context,
                  builder: (context) => dialog,
                  barrierDismissible: false);
            },
          )
        ],
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
            return Consumer<TextSettings>(
                builder: (context, textSettings, child) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: textSettings.textBackColor.withAlpha(80),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onScaleUpdate: (ScaleUpdateDetails details) {
                    if (details.scale > 1) {
                      textSettings.increaseFontSize(size: 0.08);
                    } else if (details.scale < 1) {
                      textSettings.decreaseFontSize(size: 0.08);
                    }
                  },
                  child: SelectableText(
                    data[index],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: textSettings.fontSize,
                      fontWeight: FontWeight.bold,
                      fontFamily: textSettings.fontFamily,
                      color: textSettings.textColor,
                    ),
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
