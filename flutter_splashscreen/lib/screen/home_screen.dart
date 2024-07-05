import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splashscreen/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _Header(),
              _Body(
                numbers: numbers,
              ),
              _Footer(
                onPressed: () {
                  setState(() {
                    numbers = [999, 888, 777];
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '랜덤 숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          color: redColor,
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
          ),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> numbers;

  const _Body({
    required this.numbers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers
            .map((e) => e.toString().split(''))
            .map((set) => Row(
                  children: set
                      .map(
                        (number) => Image.asset(
                          'asset/img/$number.png',
                          width: 50,
                          height: 70,
                        ),
                      )
                      .toList(),
                ))
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: const Text('생성하기'),
    );
  }
}
