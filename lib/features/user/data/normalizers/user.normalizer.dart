import 'package:payment_app/features/user/domain/models/beneficiary.mode.dart';
import 'package:payment_app/features/user/domain/models/user.model.dart';

class UserNormalizer {
  UserNormalizer._();

  static User userFromMapData({
    required Map<String, dynamic> data,
  }) =>
      User(
        id: data['id'] as String,
        name: data['name'] as String,
        email: data['email'] as String,
        password: data['password'] as String,
        balance: data['balance'] as double,
        isVerified: data['isVerified'] as bool,
        beneficiaries: (data['beneficiaries'] as List)
            .map(
              (dynamic beneficiaryData) => beneficiaryFromMapData(
                data: beneficiaryData,
              ),
            )
            .toList(),
        rechargeInfos: const [],
      );

  static Beneficiary beneficiaryFromMapData({
    required Map<String, dynamic> data,
  }) =>
      Beneficiary(
        id: data['id'] as String,
        name: data['name'] as String,
        phoneNumber: data['phoneNumber'] as String,
      );
}
