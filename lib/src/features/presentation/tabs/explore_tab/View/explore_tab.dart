import 'package:flutter/material.dart';
import 'package:yes_no_app/src/features/presentation/ErrorView/ErrorView.dart';
import 'package:yes_no_app/src/features/presentation/tabs/explore_tab/View/Components/ExploreTabContentView.dart';
import 'package:yes_no_app/src/features/presentation/tabs/explore_tab/ViewModel/ExploreTabViewModel.dart';
import 'package:yes_no_app/src/services/GeolocationService/Service/GeolocationService.dart';

import '../../../../../Base/Views/BaseView.dart';

class ExploreTab extends StatefulWidget {

  const ExploreTab({Key? key}) : super(key: key);

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> with BaseView {
  final ExploreViewModel viewModel;

  _ExploreTabState({ ExploreViewModel? exploreViewModel })
      : viewModel = exploreViewModel ?? DefaultExploreViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
            future: viewModel.viewInitState(),
            builder: (BuildContext context, AsyncSnapshot<ExploreViewModelState> snapshot) {
              switch(snapshot.connectionState) {
                case ConnectionState.waiting:
                  return loadingView;
                case ConnectionState.done:
                  if (snapshot.error == GeoLocationFailureMessages.locationPermissionsDenied
                      || snapshot.error == GeoLocationFailureMessages.locationPermissionsDeniedForever) {
                    var errorView = ErrorView();
                    errorView.isLocationDeniedError = true;
                    return errorView;
                  }
                  switch(snapshot.data) {
                    case ExploreViewModelState.viewLoadedState:
                      return ExploreTabContentView(viewModel: viewModel);
                    default:
                      return ErrorView();
                  }
                default:
                  return loadingView;
              }
            }
        )
    );
  }
}



