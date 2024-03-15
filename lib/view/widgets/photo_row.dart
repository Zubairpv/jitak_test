

import 'package:flutter/material.dart';

import '../../model/edit_image_model.dart';

class EditScreenPhotoData extends StatelessWidget {
  const EditScreenPhotoData({
    super.key,
    required this.width,
    required this.label,
    required this.subLabel,
    required this.mainIndex,
  });

  final double width;
  final String label;
  final String subLabel;
  final int mainIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: width < 700 ? width / 25 : width / 28),
                ),
                const TextSpan(
                  text: '*',
                  style: TextStyle(color: Colors.red),
                ),
                TextSpan(
                  text: "($subLabel)",
                  style: TextStyle(
                      color: const Color(
                        0xFF9C9896,
                      ),
                      fontSize: width < 700 ? width / 25 : width / 28),
                ),
              ],
            ),
          ),
        SizedBox(
          height: (width / 4).clamp(90.0, 250), // Adjust the height as needed
          width: width,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3, // Use the length of the image list
            itemBuilder: (BuildContext context, int index) {
              if (images[mainIndex].length < index + 1) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade100),
                  height: width / 4, // You can adjust the height and width here
                  width: width / 4,
                  constraints: const BoxConstraints(
                    minWidth: 90,
                    maxHeight: 250,
                    maxWidth: 250,
                    minHeight: 90,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_not_supported_rounded),
                      Text('写真を追加')
                    ],
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(images[mainIndex][index]),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: width / 4, // You can adjust the height and width here
                  width: width / 4,
                  constraints: const BoxConstraints(
                    minWidth: 90,
                    maxHeight: 250,
                    maxWidth: 250,
                    minHeight: 90,
                  ),
                );
              }
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 20,
              );
            },
          ),
        )
      ],
    );
  }
}
