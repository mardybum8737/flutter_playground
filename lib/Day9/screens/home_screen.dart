import 'package:flutter/material.dart';
import 'package:flutter_playground/Day9/widgets/card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_playground/Day9/widgets/calendar_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://image.yes24.com/goods/90762843/XL',
                        scale: 1,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Add Popup',
                                style: GoogleFonts.archivo(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 24,
                                      height: 1),
                                ),
                              ),
                              content: Text(
                                'Add something here! 😜',
                                style: GoogleFonts.archivo(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                      fontSize: 16,
                                      height: 1),
                                ),
                              ),
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
                      },
                      color: Colors.white,
                      iconSize: 40,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  'MONDAY 16',
                  style: GoogleFonts.archivo(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        'TODAY',
                        style: GoogleFonts.archivo(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 44,
                              height: 1),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const CalNum(number: 17),
                      const SizedBox(width: 20),
                      const CalNum(number: 18),
                      const SizedBox(width: 20),
                      const CalNum(number: 19),
                      const SizedBox(width: 20),
                      const CalNum(number: 20),
                      const SizedBox(width: 20),
                      const CalNum(number: 21),
                      const SizedBox(width: 20),
                      const CalNum(number: 22),
                      const SizedBox(width: 20),
                      const CalNum(number: 23),
                      const SizedBox(width: 20),
                      const CalNum(number: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 6),
              scrollDirection: Axis.vertical,
              child: Column(children: [
                ScheduleCard(
                  title: 'design meeting',
                  startHour: 11,
                  startMinute: 30,
                  endHour: 12,
                  endMinute: 20,
                  person1: 'alex',
                  person2: 'helena',
                  person3: 'nana',
                  extraPerson: 0,
                  color: Color(0xFFfef754),
                ),
                ScheduleCard(
                  title: 'daily project',
                  startHour: 12,
                  startMinute: 35,
                  endHour: 14,
                  endMinute: 10,
                  person1: 'alex',
                  person2: 'helena',
                  person3: 'nana',
                  extraPerson: 4,
                  color: Color(0xFF9c6bce),
                ),
                ScheduleCard(
                  title: 'weekly planning',
                  startHour: 15,
                  startMinute: 00,
                  endHour: 16,
                  endMinute: 30,
                  person1: 'den',
                  person2: 'nana',
                  person3: 'mark',
                  extraPerson: 0,
                  color: Color(0xFFbbee4b),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
