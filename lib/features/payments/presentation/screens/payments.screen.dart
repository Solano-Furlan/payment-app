import 'package:flutter/cupertino.dart';
import 'package:payment_app/core/design_system/widgets/layouts/main_header.widget.dart';
import 'package:payment_app/core/design_system/widgets/layouts/main_scaffold.widget.dart';
import 'package:payment_app/features/payments/presentation/widgets/balance_section.widget.dart';
import 'package:payment_app/features/payments/presentation/widgets/mobile_recharge_section.widget.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UIMainScaffold(
      canPop: false,
      mainHeader: const UIMainHeader(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          BalanceSection(),
          SizedBox(height: 20),
          MobileRechargeSection(),
        ],
      ),
    );
  }
}
