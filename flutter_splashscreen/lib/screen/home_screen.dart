import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Column(
            children: [
              _top(),
              _bottom(),
            ],
          ),
        ),
      ),
    );
  }
}

class _top extends StatefulWidget {
  const _top({super.key});

  @override
  State<_top> createState() => _topState();
}

class _topState extends State<_top> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              'U&I',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              '우리 처음 만난날',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            IconButton(
              iconSize: 30,
              color: Colors.red,
              onPressed: () {
                showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.white,
                        height: 300,
                        child: CupertinoDatePicker(
                          initialDateTime: selectedDate,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (DateTime date) {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                          dateOrder: DatePickerDateOrder.ymd,
                          maximumDate: DateTime.now(),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.favorite,
              ),
            ),
            Text(
              'D+${now.difference(selectedDate).inDays + 1}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _bottom extends StatelessWidget {
  const _bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Image.asset(
          'asset/img/배경화면.png',
        ),
      ),
    );
  }
}
