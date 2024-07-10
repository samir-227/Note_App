import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_appbar.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            text: 'Notes',
            icon: Icons.search,
          )
        ],
      ),
    );
  }
}
