import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({Key? key, required this.detail}) : super(key: key);
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        detail,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
