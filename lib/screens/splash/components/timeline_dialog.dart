import 'package:flutter/material.dart';
import 'package:myapp/screens/home/components/timeline/timeline.dart';

class TimelineDialog extends StatelessWidget {
  const TimelineDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Timeline(),
        )),
      ),
    );
  }
}
