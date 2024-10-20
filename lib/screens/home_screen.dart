import 'package:flutter/material.dart';
import 'package:navoiy/models/data_model.dart';
import 'package:navoiy/service/data_service.dart';
import 'package:navoiy/utils/colors.dart';
import 'package:navoiy/utils/consts.dart';
import 'package:navoiy/utils/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              height(8),

              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Alisher Navoiy", style: extraLargeTextStyle()),
                      Text("lirik merosi", style: extraLargeTextStyle()),
                    ],
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 9),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Image.asset(
                        'assets/images/navoiy.jpg',
                        fit: BoxFit.scaleDown,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),

              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: DataService().getData().length,
                    separatorBuilder: (context, index) {
                      return height(10);
                    },
                    itemBuilder: (context, index) {
                      final data = DataService().getData()[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('/chapter', arguments: [data.title, data.data.map((e)=>Data.fromJson(e)).toList()]);
                        },
                        child: Transform(
                          transform: Matrix4.skewX(-0.3),
                          child: Container(
                            width: 400,
                            height: 40,
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                data.title,
                                style: smallTextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
