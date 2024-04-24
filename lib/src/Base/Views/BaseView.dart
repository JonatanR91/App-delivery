import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yes_no_app/src/Base/Views/LoadingView.dart';
import 'package:yes_no_app/src/features/presentation/Stateprovider/ErrorstateProvider.dart';
import 'package:yes_no_app/src/features/presentation/Stateprovider/LoadingStateProvider.dart';

mixin BaseView {
  //final MainCoordinator coordinator = MainCoordinator();
  final Widget loadingView = LoadingView();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
}

mixin BaseViewModel {
  late LoadingStateProvider loadingState;
  void initState({ required LoadingStateProvider loadingStateProvider });
}