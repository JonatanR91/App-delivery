import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/src/Base/Views/BaseView.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Buttons/rounded_button.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Headers/header_text.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/TextFormFields/CustomtextFormField.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/backButtons/back_button.dart';
import 'package:yes_no_app/src/features/presentation/Stateprovider/LoadingStateProvider.dart';
import 'package:yes_no_app/src/features/presentation/sing_up_page/ViewModel/SignUpViewModel.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

class SignUpPage extends StatelessWidget with BaseView  {

  final SignUpViewModel _viewModel;

  SignUpPage({ SignUpViewModel? viewModel }) : _viewModel = viewModel ?? DefaultSignUpViewModel();

  @override
  Widget build(BuildContext context) {

    _viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    return _viewModel.loadingState.isLoading ? loadingView : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Builder(builder: (BuildContext context) {
            return backButton(context, Colors.black);
          }),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
                [
                  Center(
                      child: Form(
                        key: _viewModel.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Container(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              headerText(
                                  texto: 'Create an account',
                                  color: primaryColor,
                                  fontSize: 30.0),
                              SizedBox(height: 20.0),
                              CustomTextFormField(textFormFieldType: CustomTextFormFieldType.username,
                                  hintext: 'Username',
                                  delegate: _viewModel),
                              CustomTextFormField(textFormFieldType: CustomTextFormFieldType.email,
                                  hintext: 'Email',
                                  delegate: _viewModel),
                              CustomTextFormField(textFormFieldType: CustomTextFormFieldType.phone,
                                  hintext: 'Phone',
                                  delegate: _viewModel),
                              GestureDetector(
                                onTap: () => _selectDate(context),
                                child: AbsorbPointer(
                                  child: CustomTextFormField(
                                      textFormFieldType: CustomTextFormFieldType.dateOfBirth,
                                      hintext: 'Date of Birth',
                                      delegate: _viewModel,
                                      controller: _viewModel.dateController),
                                ),
                              ),
                              CustomTextFormField(textFormFieldType: CustomTextFormFieldType.password,
                                  hintext: 'Password',
                                  delegate: _viewModel),
                              createButton(
                                  context: context,
                                  buttonColor: orange,
                                  labelButton: 'Sign up',
                                  func: () {
                                    _ctaTapped(context);
                                  }),
                              Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                                  child: Text(
                                      'By clicking Sign up you agree to the following Terms and Conditions without reservation',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0)))
                            ],
                          ),
                        ),
                      )
                  ),
                ]
            ))
          ],
        )
    );
  }
}

extension UserActions on SignUpPage {
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context,
        initialDate: _viewModel.selectedDate,
        firstDate: DateTime(1960,1),
        lastDate: DateTime(2100),
        locale: Locale('es', ''));

    if (picked != null && picked != _viewModel.selectedDate) {
      _viewModel.signUpModel?.date = "${ picked.toLocal().day }/${ picked.toLocal().month }/${ picked.toLocal().year }";
      _viewModel.dateController.text = "${ picked.toLocal().day }/${ picked.toLocal().month }/${ picked.toLocal().year }";
    }
  }

  void _ctaTapped(BuildContext context) {
    if (_viewModel.isFormValidate()) {
      _viewModel.signUp().then( (result) {
        switch (result.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, "Tabs");
            break;
          case ResultStatus.error:
            errorStateProvider.setFailure(context: context,
                value: result.error!);
            break;
        }
      });
    }
  }
}