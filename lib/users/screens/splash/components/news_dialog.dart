import 'package:flutter/material.dart';
import 'package:myapp/users/screens/home/components/infographics/infographics_card.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDialog extends StatefulWidget {
  const NewsDialog({super.key});

  @override
  State<NewsDialog> createState() => _NewsDialogState();
}

class _NewsDialogState extends State<NewsDialog> {
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
    return Dialog(
      child: Container(
        width: 200,
        height: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('News'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    InfographicsCard(
                        press: () => _launchUrl(
                            Uri.parse(
                                "https://mwa.ui.ac.id/2024/06/22/pengumuman-hasil-seleksi-anggota-panitia-penjaringan-dan-penyaringan-calon-rektor-p3cr-ui-periode-2024-2029/"),
                            false),
                        title:
                            'Hasil Seleksi Anggota Panitia Penjaringan dan Penyaringan Calon Rektor (P3CR) UI periode 2024–2029',
                        image: 'assets/images/Pengumuman P3CR Terpilih.png'),
                    InfographicsCard(
                        press: () => _launchUrl(
                            Uri.parse(
                                "https://www.ui.ac.id/universitas-indonesia-memanggil-putra-putri-terbaik-sebagai-calon-rektor-ui-periode-2024-2029/"),
                            false),
                        title:
                        'Universitas Indonesia Memanggil Putra/Putri Terbaik Sebagai Calon Rektor UI Periode 2024-2029',
                        image: 'assets/images/Pemanggilan Calon Rektor.png'),
                    InfographicsCard(
                        press: () => _launchUrl(
                            Uri.parse(
                                "https://www.ui.ac.id/ui-buka-pendaftaran-panitia-penjaringan-dan-penyaringan-calon-rektor-ui-periode-2024-2029/"),
                            false),
                        title:
                        'UI Membuka Pendaftaran Panitia Penjaringan dan Penyaringan Calon Rektor UI Periode 2024-2029',
                        image: 'assets/images/panitia.jpeg')
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Close'))
          ],
        ),
      ),
    );
  }
}
