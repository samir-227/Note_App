import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/assets/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/assets/cubits/add_note_cubit/add_note_state.dart';
import 'package:note_app/widgets/custom_botton.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
          if (state is AddNoteFailure) {
            print('Failed ${state.errMessage}');
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: Form(
              key: formKey,
              child: Column(children: [
                const SizedBox(
                  height: 32,
                ),
                CustomTextField(
                  hintText: 'Title',
                  onSaved: (value) {
                    title = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: 'Content',
                  maxLines: 5,
                  onSaved: (value) {
                    subTitle = value;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomButton(
                  text: 'Add',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
