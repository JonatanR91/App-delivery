

import '../../../Entities/User/UserEntity.dart';

class SaveUserDataUseCaseParameters {
  SaveUserDataUseCaseParameters({
    this.localId,
    this.role,
    this.username,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.startDate,
    this.photo,
    this.shippingAddress,
    this.billingAddress,
    this.idToken
  });

  String? localId;
  UserRole? role;
  String? username;
  String? email;
  String? phone;
  String? dateOfBirth;
  String? startDate;
  String? photo;
  String? shippingAddress;
  String? billingAddress;
  String? idToken;

  Map<String, dynamic> toMap() => {
    "localId": localId == null ? null : localId,
    "role": role == null ? null : role,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "dateOfBirth": dateOfBirth == null ? null : dateOfBirth,
    "startDate": startDate == null ? null : startDate,
    "photo": photo == null ? null : photo,
    "shippingAddress": shippingAddress == null ? null : shippingAddress,
    "billingAddress": billingAddress == null ? null : billingAddress,
    "idToken": billingAddress == null ? null : idToken
  };
}