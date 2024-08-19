import 'package:flutter/material.dart';
import 'package:myapp/screens/home/components/persyaratan/persyaratan_content.dart';

class Persyaratan extends StatefulWidget {
  const Persyaratan({super.key});

  @override
  State<Persyaratan> createState() => _PersyaratanState();
}

class _PersyaratanState extends State<Persyaratan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              "Persyaratan Bakal Calon Rektor UI 2024-2029",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: () => persyaratanUmumBuilder(context),
                    child: const Text("Persyaratan Umum")),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                    onPressed: () => persyaratanAdminBuilder(context),
                    child: const Text("Persyaratan Administrasi")),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> persyaratanUmumBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Persyaratan Umum"),
            content: persyaratanUmumContent,
          );
        });
  }

  Future<void> persyaratanAdminBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Persyaratan Administrasi"),
            content: persyaratanAdminContent,
          );
        });
  }
}

