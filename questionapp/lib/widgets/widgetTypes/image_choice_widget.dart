import 'package:flutter/material.dart';
import '../../models/question.dart';

class ImageChoiceWidget extends StatefulWidget {
  final Question question;
  final Function(String) onSubmit;

  const ImageChoiceWidget({Key? key, required this.question, required this.onSubmit}) : super(key: key);

  @override
  _ImageChoiceWidgetState createState() => _ImageChoiceWidgetState();
}

class _ImageChoiceWidgetState extends State<ImageChoiceWidget> {
  String? selectedImage; // Option actuellement sélectionnée

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question.questionText,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600), // Largeur maximale
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: widget.question.imageOptions!.length,
            itemBuilder: (context, index) {
              final imagePath = widget.question.imageOptions![index];
              final isSelected = selectedImage == imagePath;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImage = imagePath;
                  });
                },
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.grey,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SizedBox(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: selectedImage != null
              ? () => widget.onSubmit(selectedImage!)
              : null,
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
