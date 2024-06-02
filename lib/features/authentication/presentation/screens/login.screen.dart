import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:payment_app/core/dependencies/dependencies.dart';
import 'package:payment_app/core/design_system/theme/colors.dart';
import 'package:payment_app/core/design_system/widgets/buttons/button.widget.dart';
import 'package:payment_app/core/design_system/widgets/fields/text_field.widget.dart';
import 'package:payment_app/core/design_system/widgets/layouts/main_scaffold.widget.dart';
import 'package:payment_app/core/design_system/widgets/texts/text.widget.dart';
import 'package:payment_app/core/navigation/services/navigation.service.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.cubit.dart';
import 'package:payment_app/features/authentication/state/authentication/authentication.state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        return UIMainScaffold(
          canPop: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '💶',
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const UIText(
                        'Payment App',
                        maxLines: 1,
                        color: AppColors.onBackground,
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  const UIText(
                    'Login',
                    fontSize: 46,
                    fontWeight: FontWeight.w300,
                  ),
                  const Spacer(),
                  UITextField(
                    controller: _emailController,
                    label: 'Email',
                    isRequired: true,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  UITextField(
                    controller: _passwordController,
                    label: 'Password',
                    isRequired: true,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const Spacer(),
                  KeyboardVisibilityBuilder(
                      builder: (BuildContext context, bool visible) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30,
                      ),
                      child: UIButton(
                        text: 'Login',
                        onPressed: () => getIt<AppNavigationService>()
                            .routeToMobileRecharge(),
                        isLoading: state is AuthenticationPinLoadingState,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
