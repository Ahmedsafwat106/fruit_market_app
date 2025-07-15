import 'package:flutter/material.dart';
import 'package:ahmedsafwat/widgets/custom_text_field.dart';
import 'package:ahmedsafwat/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ahmedsafwat/features/fruit_list/fruit_list_page.dart';

class CompleteInformationBody extends StatelessWidget {
  CompleteInformationBody({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Future<void> saveUserInfo(BuildContext context) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User not logged in")),
        );
        return;
      }

      await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        "name": nameController.text.trim(),
        "phone": phoneController.text.trim(),
        "address": addressController.text.trim(),
        "email": user.email,
        "uid": user.uid,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const FruitListPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving info: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        children: [
          const SizedBox(height: 24),
          const Text(
            "Complete Your Info",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          CustomTextField(hintText: "Full Name", controller: nameController),
          const SizedBox(height: 16),
          CustomTextField(hintText: "Phone Number", controller: phoneController),
          const SizedBox(height: 16),
          CustomTextField(hintText: "Address", controller: addressController),
          const SizedBox(height: 24),
          CustomButton(
            text: "Continue",
            onPressed: () => saveUserInfo(context),
          ),
        ],
      ),
    );
  }
}