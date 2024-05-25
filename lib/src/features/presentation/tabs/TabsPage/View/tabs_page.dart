import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/src/colors/colors.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Alerts/alert_dialog/alert_dialog.dart';
import 'package:yes_no_app/src/features/presentation/CommonsWidgets/Buttons/rounded_button.dart';
import 'package:yes_no_app/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:yes_no_app/src/features/presentation/tabs/ProfileTab/View/ProfileTab.dart';
import 'package:yes_no_app/src/features/presentation/tabs/explore_tab/View/explore_tab.dart';
import 'package:yes_no_app/src/features/presentation/tabs/my_order_tab/View/my_order_tab.dart';
import 'package:yes_no_app/src/services/GeolocationService/Entities/GeolocationServiceEntities.dart';
import 'package:yes_no_app/src/utils/Helpers/resultType/ResultType.dart';

import '../../../../../Base/Views/BaseView.dart';
import '../ViewModel/TabsPageViewModel.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with BaseView {

  // Dependencias
  final TabsViewModel viewModel;

  _TabsPageState({ TabsViewModel? tabsViewModel})
      : viewModel = tabsViewModel ?? DefaultTabsViewModel();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      viewModel.loadingStatusState.setLoadingState(isLoading: true);
      final LocationPermissionStatus currentStatus = await viewModel.getPermissionStatus();
      switch (currentStatus) {
        case LocationPermissionStatus.denied:
          _getCurrentPosition(context);
          break;
        default:
          viewModel.loadingStatusState.setLoadingState(isLoading: false);
          break;
      }
    });
  }

  List<Widget> _widgetOptions = [
     const ExploreTab(),
     const MyorderTab(),
  //   const FavoiriteTab(),
    ProfileTab()
  ];

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));

    return viewModel.loadingStatusState .isLoading ? loadingView : Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }
}

extension PrivateMethods on _TabsPageState {
  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 30.0,
        selectedItemColor: orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedItemIndex,
        onTap: _changeTab,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'My Order'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: 'Profile')
        ]);
  }

  Future _getCurrentPosition(BuildContext context) async {
    await showAlertDialog(
        context,
        const AssetImage('assets/location.png'),
        'Enable Your Location',
        "Please allow to use your location to show nearby restaurant on the map.",
        createButton(
            context: context,
            buttonColor: orange,
            labelButton: 'Enable Location',
            func: () {
              viewModel.getCurrentPosition().then( (result) {
                switch (result.status) {
                  case ResultStatus.success:
                    _closeAlertDialog(context);
                    break;
                  case ResultStatus.error:
                    _closeAlertDialog(context);
                    errorStateProvider.setFailure(context: context, value: result.error!);
                    break;
                }
              });
            }));
  }

  _closeAlertDialog(BuildContext context) {
    viewModel.loadingStatusState .setLoadingState(isLoading: false);
    Navigator.pop(context);
  }
}

extension UserActions on _TabsPageState {
  void _changeTab(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }
}
