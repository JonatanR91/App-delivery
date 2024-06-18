import 'package:flutter/material.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/Base/Views/BaseView.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/AppBar/AppBarDoneView.dart';
import 'package:yes_no_app/src/features/presentation/Profile/EditEmailPage/Components/EmailAndPasswordTextFieldCardView.dart';
import 'package:yes_no_app/src/features/presentation/Profile/EditEmailPage/ViewModel/EditEmailPageViewModel.dart';
import 'package:yes_no_app/src/features/presentation/StateProviders/ErrorStateProvider.dart';
import 'package:yes_no_app/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:yes_no_app/src/features/presentation/StateProviders/UserStateProvider.dart';
import 'package:yes_no_app/src/utils/Helpers/Validators/FormValidators.dart';
import 'package:yes_no_app/src/utils/styles/box_decoration_shadows.dart';

class EditEmailPage extends StatefulWidget {

  const EditEmailPage({ Key? key }) : super(key: key);

  @override
  State<EditEmailPage> createState() => _EditEmailPageState();
}

class _EditEmailPageState extends State<EditEmailPage> with EmailAndPasswordTextFieldCardViewDelegate, BaseView {

  // Dependencies
  final EditEmailPageViewModel _viewModel;

  // Private properties
  String _actionText = "";
  String? _email;
  String? _oldEmail;
  String? _password;
  String? _localId;
  Decoration? _decoration;

  _EditEmailPageState({ EditEmailPageViewModel? editEmailPageViewModel })
      : _viewModel = editEmailPageViewModel ?? DefaultEditEmailPageViewModel();

  @override
  Widget build(BuildContext context) {

    _localId = (context).getUserData()?.localId;
    _oldEmail = (context).getUserData()?.email;

    return Scaffold(
      appBar: createAppBarDone(actionText: _actionText,
          onTap: () {
            sendEditEmail(context);
          },
          title: 'Edit Email'),
      body: (context).isLoading() ? loadingView : CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 16),
                EmailAndPasswordTextFieldCardView(delegate: this,
                    title: 'Please enter your new email address and your password. After this action, you can login via email and password with this new email.',
                    decoration: _decoration)
              ]
          ))
        ],
      ),
    );
  }

  sendEditEmail(BuildContext context) {
    if(_email == null || _oldEmail == null || _password == null || _localId == null) { return; }

    setState(() {
      (context).setLoadingState(isLoading: true);
    });

    _viewModel.updateEmail(email: _email ?? "",
        password: _password ?? "",
        localId: _localId ?? "",
        oldEmail: _oldEmail ?? "").then((value) {
      setState(() {
        (context).setLoadingState(isLoading: false);
      });
      Navigator.pop(context);
    }, onError: (e) {
      setState(() {
        (context).setLoadingState(isLoading: false);
        context.showErrorAlert(message: AppFailureMessages.unExpectedErrorMessage, context: context);
      });
    });
  }

  @override
  emailChanged({ required String email }) {
    _email = email;
    _validateForm();
  }

  @override
  passwordChanged({ required String password }) {
    _password = password;
    _validateForm();
  }

  _validateForm() {
    if (_email == null || _password == null) { return; }

    setState(() {
      if (_email!.isEmpty || _password!.isEmpty || EmailFormValidator.validateEmail(email: _email ?? "") != null) {
        _email = null;
        _actionText = "";
        _decoration = errorTextFieldDecoration;
      } else {
        _actionText = "Done";
        _decoration = null;
      }
    });
  }
}
