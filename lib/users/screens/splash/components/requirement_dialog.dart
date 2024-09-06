import 'package:flutter/material.dart';
import 'package:myapp/users/screens/home/components/persyaratan/persyaratan.dart';

class RequirementDialog extends StatelessWidget {
  const RequirementDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Persyaratan(),
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Close'))
          ],
        ),
      ),
    );
  }
}
