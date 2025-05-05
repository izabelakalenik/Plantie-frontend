import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plant_app/styles/layout.dart';
import '../widgets/custom_elements.dart';

class ResultScreen extends StatefulWidget {
  final File image;
  final Map<String, dynamic> response;

  const ResultScreen({
    super.key,
    required this.image,
    required this.response,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarText: "Plantie",
      currentIndex: -1,
      child: ResultScreenContent(
        image: widget.image,
        response: widget.response,
      ),
    );
  }
}

class ResultScreenContent extends StatelessWidget {
  final File image;
  final Map<String, dynamic> response;

  const ResultScreenContent({
    super.key,
    required this.image,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: customScreenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.file(
              image,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          CustomTextContainer(headline: "Prediction", text: "${response['predicted_class']}"),
          const SizedBox(height: 24),
          CustomTextContainer(headline: "Diagnosis", text: "${response['symptoms']}"),
          const SizedBox(height: 24),
          CustomTextContainer(headline: "Treatment", text: "${response['management']}"),
        ],
      ),
    );
  }
}
