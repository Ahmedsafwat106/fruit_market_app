import 'package:flutter/material.dart';
import 'package:ahmedsafwat/widgets/complete_information_body.dart';

class CompleteInformationView extends StatelessWidget {
  const CompleteInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: CompleteInformationBody()),
    );
  }
}