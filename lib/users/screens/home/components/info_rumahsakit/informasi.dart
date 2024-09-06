import 'package:flutter/material.dart';
import 'package:myapp/users/screens/home/components/info_rumahsakit/informasi_content.dart';

class Informasi extends StatelessWidget {
  const Informasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Informasi Rumah Sakit Rujukan",
                    style: TextStyle(
                      fontSize: 18,
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
                  child: const InformasiContent(),
                ),
              )
            ]))
      ],
    );
  }
}
