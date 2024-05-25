import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_app/src/Base/Constants/LocasStorageKeys.dart';
import 'package:yes_no_app/src/features/domain/Entities/Collections/CollectionsEntity.dart';
import 'package:yes_no_app/src/features/domain/Entities/Places/PlaceListEntity.dart';
import 'package:yes_no_app/src/features/domain/UseCases/LocalStorage/FetchLocalStorage/FetchLocalStorageUseCase.dart';
import 'package:yes_no_app/src/features/domain/UseCases/LocalStorage/FetchLocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:yes_no_app/src/features/domain/UseCases/LocalStorage/SaveLocalStorage/SaveLocalStorageUseCase.dart';
import 'package:yes_no_app/src/features/domain/UseCases/User/ValidateCurrentUserUseCase/ValidateCurrentuserUseCase.dart';
import 'package:yes_no_app/src/features/presentation/Collections/CollectionDetailPage/View/CollectionDetailPage.dart';
import 'package:yes_no_app/src/features/presentation/Collections/CollectionDetailPage/ViewModel/CollectionDetailPageViewModel.dart';
import 'package:yes_no_app/src/features/presentation/Collections/CollectionsPage/View/CollectionsPage.dart';
import 'package:yes_no_app/src/features/presentation/PopularPlacesListPage/PopularPlacesListPage.dart';
import 'package:yes_no_app/src/features/presentation/place_detail_page/View/place_detail_page.dart';

class RoutesPath{
  static String welcomePath = "welcome";
  static String loginPath = "login";
  static String tabsPath = "Tabs";
}
class MainCoordinator {

  // Dependencies
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUseCase _validateCurrentUserUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;
  // Exposed Properties
  String? userUid;
  static MainCoordinator? sharedInstance = MainCoordinator();

  MainCoordinator ({  FetchLocalStorageUseCase? fetchLocalStorageUseCase,
                      ValidateCurrentUserUseCase? validateCurrentUserUseCase,
                      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _fetchLocalStorageUseCase = fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserUseCase =  validateCurrentUserUseCase ?? DefaultValidateCurrentUserUseCase(),
        _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();
 Future<String?> start(){
return _isUserLogged().then((value){
  return value == null ? RoutesPath.welcomePath : RoutesPath.tabsPath;
});
 }


 Future<String?> _isUserLogged() async{
   var idToken = await _fetchLocalStorageUseCase.execute(fetchLocalParameteres: FetchLocalStorageParameters(key:LocalStorageKeys.idToken));
    print(idToken);
   return idToken;

 }
  showTabsPage({ required BuildContext context, int? selectedTab }) {
    Navigator.pushNamed(context, RoutesPath.tabsPath);
  }
  showLoginPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPath.loginPath);
  }
  showPlaceListPage(
      {required BuildContext context,
        required List<PlaceDetailEntity> popularPlaces}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                PopularPlacesListPage(popularPlaces: popularPlaces),
            transitionDuration: const Duration(seconds: 0)));
  }

  showCollectionsPage(
      {required BuildContext context,
        required List<CollectionDetailEntity> collections}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                CollectionsPage(collections:collections),
            transitionDuration: const Duration(seconds: 0)));
  }
  showCollectionsDetailPage(
      {required BuildContext context,
        required CollectionDetailEntity collection}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => CollectionDetailPage(
                collectionDetailPageViewModel:
                DefaultCollectionDetailPageViewModel(
                    collection: collection)),
            transitionDuration: const Duration(seconds: 0)));
  }
  showPlaceDetailPage({ required BuildContext context,
                        required PlaceDetailEntity place }) async {
    await _saveLocalStorageUseCase.saveRecentSearchInLocalStorage(
        placeId: place.placeId);
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (_,__,___) => PlaceDetailPage(),
            transitionDuration: const Duration(seconds: 0)
        ));
  }
}