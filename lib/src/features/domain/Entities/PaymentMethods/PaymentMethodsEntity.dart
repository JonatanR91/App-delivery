import 'dart:convert';

import 'package:yes_no_app/src/features/data/Repositories/PaymentMethods/BodyParameters/PaymentMethodsBodyParameters.dart';
class PaymentMethodsEntity {

  List<PaymentMethodEntity> paymentMethods;

  PaymentMethodsEntity({
    required this.paymentMethods,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'paymentMethods': paymentMethods.map((card) => card.toMap()).toList(),
    };
  }

  factory PaymentMethodsEntity.fromMap(Map<String, dynamic> json) {
    return PaymentMethodsEntity(
      paymentMethods: List<PaymentMethodEntity>.from(json['paymentMethods'].map((card) => PaymentMethodEntity.fromMap(card))),
    );
  }

  static PaymentMethodsEntity getEmptyPaymentMethods() {
    return PaymentMethodsEntity(paymentMethods: []);
  }

  PaymentMethodsBodyParameters getPaymentMethodsBodyParameters() {
    return PaymentMethodsBodyParameters.fromMap(toMap());
  }

  bool hasPaymentMethods() {
    return paymentMethods.isNotEmpty;
  }
}

class PaymentMethodEntity {
  String nameInTheCard;
  String cardNumber;
  String monthAndYear;
  String cvc;
  String country;
  String type;
  String email;
  String id;

  PaymentMethodEntity({
    required this.nameInTheCard,
    required this.cardNumber,
    required this.monthAndYear,
    required this.cvc,
    required this.country,
    required this.type,
    required this.email,
    required this.id
  });

  factory PaymentMethodEntity.fromMap(Map<String, dynamic> json) {
    return PaymentMethodEntity(
        nameInTheCard: json['nameInTheCard'],
        cardNumber: json['cardNumber'],
        monthAndYear: json['monthAndYear'],
        cvc: json['cvc'],
        country: json['country'],
        type: json['type'],
        email: json['email'],
        id: json['id']
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'nameInTheCard': nameInTheCard,
      'cardNumber': cardNumber,
      'monthAndYear': monthAndYear,
      'cvc': cvc,
      'country': country,
      'type': type,
      'email': email,
      'id': id
    };
  }

  static PaymentMethodEntity getEmptyPaymentMethod() {
    return PaymentMethodEntity(
        nameInTheCard: '',
        cardNumber: '',
        monthAndYear: '',
        cvc: '',
        country: '',
        type: '',
        email: '',
        id: ''
    );
  }
}




