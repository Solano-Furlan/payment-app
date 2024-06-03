import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/layouts/main_header.widget.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.cubit.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.state.dart';

class UIMainScaffold extends StatelessWidget {
  const UIMainScaffold({
    required this.body,
    this.hasSafeArea = true,
    this.webWrapperEnabled = true,
    this.canPop = true,
    this.isProtected = true,
    this.backgroundColor,
    this.mainHeader,
    super.key,
  });

  final Widget body;
  final bool hasSafeArea;
  final bool webWrapperEnabled;
  final bool canPop;
  final Color? backgroundColor;
  final UIMainHeader? mainHeader;
  final bool isProtected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (
        BuildContext context,
        AuthenticationState state,
      ) {
        if (state is! AuthenticationAuthorizedState && isProtected) {
          return const SizedBox();
        }
        return Form(
          canPop: canPop,
          child: Scaffold(
            backgroundColor: backgroundColor ?? AppColors.background,
            body: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: SafeArea(
                    top: hasSafeArea,
                    left: hasSafeArea,
                    right: hasSafeArea,
                    bottom: hasSafeArea,
                    child: body,
                  ),
                ),
                if (mainHeader != null) ...[
                  Positioned(
                    top: 0,
                    child: mainHeader!,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
