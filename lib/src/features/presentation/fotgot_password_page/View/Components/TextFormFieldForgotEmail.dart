import 'package:flutter/material.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/fotgot_password_page/ViewModel/ForgetPasswordViewModel.dart';
import 'package:yes_no_app/src/utils/Helpers/Validators/FormValidators.dart';


class TextFormFieldEmailUpdatePassword extends StatelessWidget {

  final ForgotPasswordViewModel viewModel;
  const TextFormFieldEmailUpdatePassword({ Key? key, required this.viewModel })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(borderSide: BorderSide.none)
        ),
        validator: (value) => EmailFormValidator.validateEmail(email: value ?? ""),
        onChanged: (NewValue) => viewModel.email = NewValue,
      ),
    );
  }
}


