import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yes_no_app/src/Base/Views/LoadingView.dart';
import 'package:yes_no_app/src/features/presentation/MainCoordinator/MainCoordinator.dart';
import 'package:yes_no_app/src/features/presentation/StateProviders/ErrorStateProvider.dart';
import 'package:yes_no_app/src/features/presentation/StateProviders/LoadingStateProvider.dart';


mixin BaseView {
  final Widget loadingView = const LoadingView();
  final MainCoordinator coordinator = MainCoordinator();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
  BaseViewStateDelegate? viewStateDelegate;
}

mixin BaseViewStateDelegate {
  void onChange();
}

mixin BaseViewModel {
  void initState({ required LoadingStateProvider loadingState });
  // Exposed Properties
  late LoadingStateProvider loadingStatusState;
}
