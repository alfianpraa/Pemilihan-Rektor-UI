import 'package:flutter/material.dart';
import 'package:myapp/screens/home/components/infographics/infographics_card.dart';
import 'package:url_launcher/url_launcher.dart';

class Infographics extends StatefulWidget {
  const Infographics({super.key});

  @override
  State<Infographics> createState() => _InfographicsState();
}

class _InfographicsState extends State<Infographics> {
  void _launchUrl(Uri uri, bool inApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        if (inApp) {
          await launchUrl(uri, mode: LaunchMode.inAppWebView);
        } else {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          const SizedBox(
              width: double.infinity,
              child: Text("Berita", style: TextStyle(fontSize: 20))),
          Row(
            children: [
              InfographicsCard(
                  press: () => _launchUrl(
                      Uri.parse(
                          "https://mwa.ui.ac.id/2024/06/22/pengumuman-hasil-seleksi-anggota-panitia-penjaringan-dan-penyaringan-calon-rektor-p3cr-ui-periode-2024-2029/"),
                      false),
                  title:
                      'Hasil Seleksi Anggota Panitia Penjaringan dan Penyaringan Calon Rektor (P3CR) UI periode 2024–2029',
                  image: 'assets/images/Pengumuman P3CR Terpilih.png'),
              const SizedBox(width: 15),
              InfographicsCard(
                  press: () => _launchUrl(
                      Uri.parse(
                          "https://www.ui.ac.id/universitas-indonesia-memanggil-putra-putri-terbaik-sebagai-calon-rektor-ui-periode-2024-2029/"),
                      false),
                  title:
                      'Universitas Indonesia Memanggil Putra/Putri Terbaik Sebagai Calon Rektor UI Periode 2024-2029',
                  image: 'assets/images/Pemanggilan Calon Rektor.png')
            ],
          ),
        ],
      ),
    );
  }
}
