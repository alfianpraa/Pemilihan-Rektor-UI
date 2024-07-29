import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/theme.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});
  static String routeName = '/contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Kami'),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Kampus Baru Depok',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              'Universitas Indonesia',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              'Jawa Barat 16424',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              'Indonesia',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  size: 50,
                ),
                Text(
                  ' 021-1500002',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: SvgPicture.asset('assets/icon/whatsapp.svg'),
                    onPressed: () => {}),
                const Text(
                  '0815 1500 0002',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
