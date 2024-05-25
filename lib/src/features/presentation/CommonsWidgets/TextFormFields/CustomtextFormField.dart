import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/utils/Helpers/Validators/FormValidators.dart';

mixin TextFormFieldDelegate {
  onChanged({ required String newValue,
    required CustomTextFormFieldType customTextFormFieldType });
}

enum CustomTextFormFieldType {
  email, password, phone, username, dateOfBirth
}

class CustomTextFormField extends StatelessWidget {

  final TextFormFieldDelegate delegate;
  final CustomTextFormFieldType textFormFieldType;
  final String hintext;
  final TextEditingController? _controller;
  final Decoration? _decoration;
  final String? _initialValue;
  final Widget? _icon;

  CustomTextFormField({ required this.delegate,
    required this.textFormFieldType,
    required this.hintext,
    TextEditingController? controller,
    Decoration? decoration,
    String? initialValue,
    Widget? icon })
      : _controller = controller,
        _decoration = decoration,
        _initialValue = initialValue,
        _icon = icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(left: 20.0),
        decoration: _decoration ?? BoxDecoration(
            color: bgInputs,
            borderRadius: BorderRadius.circular(40.0)),
        child: TextFormField(
          initialValue: _initialValue,
          controller: _controller,
          keyboardType: getKeyboardType(textFormFieldType: textFormFieldType),
          obscureText: textFormFieldType == CustomTextFormFieldType.password ? true : false,
          decoration: InputDecoration(
              icon: _icon,
              hintText: hintext,
              border: OutlineInputBorder(borderSide: BorderSide.none)
          ),
          onChanged: (newValue) => delegate.onChanged(newValue: newValue,
              customTextFormFieldType: textFormFieldType), //
          validator: (value) {
            switch (textFormFieldType) {
              case CustomTextFormFieldType.email:
                return EmailFormValidator.validateEmail(email: value ?? '');
              case CustomTextFormFieldType.password:
                return PasswordFormValidator.validatePassword(password: value ?? '');
              case CustomTextFormFieldType.username:
                return DefaultFormValidator.validateIsNotEmpty(value: value ?? '');
              case CustomTextFormFieldType.phone:
                return DefaultFormValidator.validateIsNotEmpty(value: value ?? '');
              case CustomTextFormFieldType.dateOfBirth:
              // TODO: Handle this case.
                break;
            }
          },
        ));
  }

  TextInputType? getKeyboardType({ required CustomTextFormFieldType textFormFieldType }) {
    switch (textFormFieldType) {
      case CustomTextFormFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFormFieldType.password:
        return TextInputType.visiblePassword;
      case CustomTextFormFieldType.username:
        return TextInputType.text;
      case CustomTextFormFieldType.phone:
        return TextInputType.phone;
      case CustomTextFormFieldType.dateOfBirth:
      // TODO: Handle this case.
        break;
    }
  }
}
