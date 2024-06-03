import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'dart:async';

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PomodoroState();
  }
}

class _PomodoroState extends State<Pomodoro> {
  int totalSeconds = 5 * 1;
  bool isRunning = false;
  bool isPaused = false;
  late Timer timer;

  int currentGoal = 0;
  int totalGoal = 12;
  int totalRound = 3;

  int currentRound = 0;

  @override
  void initState() {
    super.initState();
    currentRound = 0;
  }

  @override
  build(BuildContext context) {
    Widget itemBuilder(BuildContext context, int index) {
      List<int> minutes = [
        15,
        20,
        25,
        30,
        35,
      ];
      return Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).cardColor,
        ),
        child: Center(
          child: Text(
            '${minutes[index]}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      );
    }

    int selectedIndex = 0; // index 값을 저장할 변수 추가

    // ...

    void takeRest() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Rest Timer',
            ),
            content: Text('Take a rest for 5 minutes.',
                style: Theme.of(context).textTheme.bodySmall),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    void onItemFocus(int index) {
      setState(() {
        selectedIndex = index; // index 값을 업데이트
        totalSeconds = (5 + (index * 5)) * 1;
      });
    }

    void onTick(Timer timer) {
      if (totalSeconds == 0) {
        setState(() {
          timer.cancel();
          isRunning = false;
          currentGoal++;
          totalSeconds = (5 + (selectedIndex * 5)) * 1;
          if (currentGoal % 3 == 0) {
            currentRound++;
            takeRest();
          }
        });
      } else {
        setState(() {
          totalSeconds--;
        });
      }
    }

    // ...

    void onStartPressed() {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        onTick,
      );

      setState(() {
        isRunning = true;
        isPaused = false;
      });
    }

    void onPausePressed() {
      timer.cancel();
      setState(() {
        isRunning = false;
        isPaused = true;
      });
    }

    void onRefreshed() {
      setState(() {
        totalSeconds = (5 + (selectedIndex * 5)) * 1;
        isPaused = false;
      });
    }

    String formatMin(int seconds) {
      var duration = Duration(seconds: seconds);
      return duration.toString().split('.').first.substring(2, 4);
    }

    String formatSec(int seconds) {
      var duration = Duration(seconds: seconds);

      return duration.toString().split('.').first.substring(5, 7);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Text('POMOTIMER', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 10,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).cardColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Container(
                          width: 120,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).cardColor.withOpacity(0.7),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        child: Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        child: Text(formatMin(totalSeconds),
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 140,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 10,
                        child: Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).cardColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Container(
                          width: 120,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).cardColor.withOpacity(0.7),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        child: Container(
                          width: 140,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).cardColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 80,
                        child: Text(formatSec(totalSeconds),
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 50,
              child: ScrollSnapList(
                curve: Curves.easeInOut,
                scrollPhysics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: itemBuilder,
                itemCount: 5,
                itemSize: 100,
                onItemFocus: (index) {
                  onItemFocus(index);
                },
                dynamicItemSize: true,
                dynamicItemOpacity: 0.6,
                initialIndex: 0,
                clipBehavior: Clip.none,
                selectedItemAnchor: SelectedItemAnchor.MIDDLE,
                scrollDirection: Axis.horizontal,
                updateOnScroll: true,
                focusOnItemTap: true,
                allowAnotherDirection: true,
              ),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  style: ButtonStyle(
                    iconSize: WidgetStateProperty.all<double>(60),
                    fixedSize: WidgetStateProperty.all<Size>(
                      const Size(150, 90),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Theme.of(context).cardColor,
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
                isPaused ? const SizedBox(width: 40) : const SizedBox(width: 0),
                Container(
                  child: isPaused
                      ? IconButton(
                          onPressed: onRefreshed,
                          icon: const Icon(Icons.refresh),
                          style: ButtonStyle(
                            iconSize: WidgetStateProperty.all<double>(60),
                            fixedSize: WidgetStateProperty.all<Size>(
                              const Size(150, 90),
                            ),
                            foregroundColor: WidgetStateProperty.all<Color>(
                              Theme.of(context).cardColor,
                            ),
                            backgroundColor: WidgetStateProperty.all<Color>(
                              Theme.of(context).primaryColorDark,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('$currentRound / $totalRound',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text('ROUND',
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                  const SizedBox(width: 80),
                  Column(
                    children: [
                      Text('$currentGoal / $totalGoal',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text('GOAL',
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
