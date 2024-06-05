import 'package:flutter/material.dart';
import 'package:flutter_playground/NomadCoder_WEBTOON/Day9/widgets/card_min.dart';
import 'package:flutter_playground/NomadCoder_WEBTOON/Day9/widgets/card_hour.dart';
import 'package:flutter_playground/NomadCoder_WEBTOON/Day9/widgets/participant.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleCard extends StatelessWidget {
  final String title;
  final Color? color;
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;
  final String person1;
  final String person2;
  final String person3;
  final int extraPerson;

  const ScheduleCard(
      {super.key,
      required this.title,
      required this.color,
      required this.startHour,
      required this.startMinute,
      required this.endHour,
      required this.endMinute,
      required this.person1,
      required this.person2,
      required this.person3,
      required this.extraPerson});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      child: Container(
        height: 220,
        width: 800,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: color),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
          child: Row(
            children: [
              Column(
                children: [
                  CardHour(hour: startHour),
                  CardMin(minute: startMinute),
                  Container(
                    height: 24,
                    width: 1,
                    color: Colors.black,
                  ),
                  CardHour(hour: endHour),
                  CardMin(minute: endMinute),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: Text(
                      title.toUpperCase(),
                      style: GoogleFonts.archivo(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 56,
                            height: 0.8),
                      ),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Row(
                    children: [
                      Participant(name: person1),
                      const SizedBox(
                        width: 30,
                      ),
                      Participant(name: person2),
                      const SizedBox(
                        width: 30,
                      ),
                      Participant(name: person3),
                      const SizedBox(
                        width: 30,
                      ),
                      extraPerson > 0
                          ? Participant(name: '+ $extraPerson')
                          : Container(
                              width: 0,
                            ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
