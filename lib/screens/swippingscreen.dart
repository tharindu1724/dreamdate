import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydatingapp/controllers/person_controller.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  PersonController personController = PersonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Obx(
          () => PageView.builder(
            itemBuilder: (context, index) {
              final eachPersonInfo =
                  personController.allPersonProfileList[index];

              return DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              eachPersonInfo.username.toString()))));
            },
            controller: PageController(initialPage: 0, viewportFraction: 1),
            itemCount: personController.allPersonProfileList.length,
          ),
        ));
  }
}
