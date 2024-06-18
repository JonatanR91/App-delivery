
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/AuthFirebaseServices.dart';


 class DefaultGetUserDataService extends GetUserDataService {

   @override
   Future<Map<String, dynamic>> getUserData({ required Map<String, dynamic> bodyParameters }) {
     return apiService.getDataFromPostRequest(bodyParameters: bodyParameters, url: endpoint);
   }

 }
