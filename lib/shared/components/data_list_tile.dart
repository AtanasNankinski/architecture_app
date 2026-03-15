import 'package:flutter/material.dart';

class DataListTile extends StatelessWidget {
  final String id;
  final String title;
  final int dataNumber;
  final bool isActive;
  final VoidCallback onTap;

  const DataListTile({
    super.key,
    required this.id,
    required this.title,
    required this.dataNumber,
    required this.isActive,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: $id"),
              Text("Title: $title"),
              Text("Number: ${dataNumber.toString()}"),
              Text("Active: ${isActive.toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
