
import 'package:yes_no_app/src/Base/ApiService/AppError/AppError.dart';
import 'package:yes_no_app/src/Base/Constants/ErrorMessages.dart';
import 'package:yes_no_app/src/features/data/Decodables/PaymentMethods/PaymentMethodsDecodable.dart';
import 'package:yes_no_app/src/features/data/Interfaces/Interfaces.dart';
import 'package:yes_no_app/src/features/data/Repositories/PaymentMethods/BodyParameters/PaymentMethodsBodyParameters.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/Services/RealtimeDataBaseService.dart';
import 'package:yes_no_app/src/services/FirebaseSevices/Interfaces/RealTimeDatabaseService/Interfaces/interfaces.dart';

class DefaultPaymentMethodsRepository extends PaymentMethodsRepository {

  final String _path = "paymentMethods/";

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultPaymentMethodsRepository({ RealtimeDataBaseService? realtimeDataBaseService })
      : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<PaymentMethodsDecodable> getPaymentMethods({ required String localId }) async {
    try {
      final response = await _realtimeDataBaseService.getData(path: _path + localId);
      return PaymentMethodsDecodable.fromMap(response);
    } on Failure catch(f) {
      if (f.message == RealtimeDatabaseExceptions.httpException) {
        return PaymentMethodsDecodable.getEmptyPaymentMethods();
      } else {
        return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
      }
    }
  }

  @override
  Future<PaymentMethodsDecodable> savePaymentMethods({ required String localId,
    required PaymentMethodsBodyParameters bodyParameters }) async {
    var path = _path + localId;
    try {
      final result = await _realtimeDataBaseService.putData(bodyParameters: bodyParameters.toMap(), path: path);
      return PaymentMethodsDecodable.fromMap(result);
    } on Failure catch (f) {
      return Future.error(f.error);
    }
  }
}