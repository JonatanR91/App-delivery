import 'package:flutter/material.dart';
import 'package:yes_no_app/src/Colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/TextFormFields/CustomtextFormField.dart';
import 'package:yes_no_app/src/utils/Extensions/screen_size.dart';
import 'package:yes_no_app/src/utils/styles/box_decoration_shadows.dart';

mixin EmailAndPasswordTextFieldCardViewDelegate {
  emailChanged({ required String email });
  passwordChanged({ required String password });
}

class EmailAndPasswordTextFieldCardView extends StatelessWidget with TextFormFieldDelegate {

  Decoration? decoration;
  final EmailAndPasswordTextFieldCardViewDelegate? delegate;
  String title = "";
  EmailAndPasswordTextFieldCardView({ Key? key,
    required this.delegate,
    required this.title,
    this.decoration }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBoxDecorationWithShadows(),
      width: getScreenWidth(context: context),
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(fontSize: 15, color: accentColor)
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
              delegate: this,
              hintext: 'Email',
              textFormFieldType: CustomTextFormFieldType.email,
              decoration: decoration ?? defaultTextFieldDecoration
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            delegate: this,
            hintext: 'Password',
            textFormFieldType: CustomTextFormFieldType.password,
            decoration: defaultTextFieldDecoration,
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }

  @override
  onChanged({required String newValue, required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        delegate?.emailChanged(email: newValue);
        break;
      case CustomTextFormFieldType.password:
        delegate?.passwordChanged(password: newValue);
        break;
      default:
        break;
    }
  }
}