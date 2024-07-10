import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(.05),
      ),
      height: 46,
      width: 46,
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        iconSize: 28,
      ),
    );
  }
}
