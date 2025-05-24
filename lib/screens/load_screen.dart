import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plant_app/constants/texts.dart';
import 'package:plant_app/styles/layout.dart';
import '../api/api_connection.dart';
import '../widgets/custom_elements.dart';

class LoadScreen extends StatefulWidget {
  final File image;

  const LoadScreen({super.key, required this.image});

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    super.initState();
    _sendImage();
  }

  Future<void> _sendImage() async {
    final response = await sendImageToBackend(widget.image);

    if (response != null && mounted) {
      await Future.delayed(const Duration(seconds: 3));

      final isHealthy = response['predicted_names']?.toLowerCase().contains('healthy') ?? false;
      showResponse(context, widget.image, response, isHealthy);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      appBarText: "Plantie",
      currentIndex: -1,
      child: LoadScreenContent(),
    );
  }
}

class LoadScreenContent extends StatelessWidget {
  const LoadScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: customScreenPadding,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextContainer(text: loadText),
          SizedBox(height: 40),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}

