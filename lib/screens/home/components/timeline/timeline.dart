import 'package:flutter/material.dart';
import 'package:myapp/screens/home/components/timeline/timeline_content.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Timeline Kegiatan",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(20)),
                  child: const TimelineContent(),
                ),
              )
            ]))
      ],
    );
  }
}
