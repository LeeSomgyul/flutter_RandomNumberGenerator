import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        int currnetPage = controller.page!.toInt();
        int nextPage = currnetPage + 1;

        if (nextPage > 2) {
          nextPage = 0;
        }

        controller.animateToPage(nextPage,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      },
    );
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1, 2, 3]
            .map((e) => Image.asset(
                  'asset/img/짱구$e.png',
                  fit: BoxFit.cover,
                ))
            .toList(),
      ),
    );
  }
}
