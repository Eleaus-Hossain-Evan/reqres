// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/auth/auth_provider.dart';
import '../../application/auth/auth_state.dart';
import '../../domain/auth/signup_body.dart';
import '../widgets/widget.dart';

class SignupScreen extends HookConsumerWidget {
  static const routeName = '/signup';

  SignupScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _nameController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _phoneController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final _rePasswordController = useTextEditingController();

    ref.listen<AuthState>(authProvider, (pre, next) {
      if (pre?.user == null) {}
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120.h,
                ),
                Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 28.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Enter your details to sign up into a new account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    // color: Color(0xff5A6876),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                KShadowContainer(
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        KTextFormField(
                          controller: _emailController,
                          hintText: 'Email',
                          validator: ValidationBuilder()
                              .required()
                              .email()
                              .maxLength(50)
                              .build(),
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 2,
                        ),
                        KTextFormField(
                          controller: _passwordController,
                          hintText: 'Password',
                          isObscure: true,
                          validator: ValidationBuilder()
                              .required()
                              .minLength(6)
                              .maxLength(50)
                              .build(),
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 25.h,
                ),
                KIconElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) =>
                    //         OTPScreen(phone: _emailController.text),
                    //   ),
                    // );

                    if (_form.currentState!.validate()) {
                      ref.read(authProvider.notifier).signUp(
                            SignupBody(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                    }
                  },
                  text: 'Continue',
                  // backgroundColor:
                  //     Theme.of(context).colorScheme.onSecondaryContainer,
                  // foregroundColor: Colors.white,
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 14.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    SizedBox(
                      width: 80.w,
                      child: TextButton(
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => LoginScreen(),
                            //   ),
                            // );

                            context.go('/login');
                          },
                          child: const Text("Login")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
