import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/auth/auth_provider.dart';
import '../../application/auth/auth_state.dart';
import '../../domain/auth/login_body.dart';
import '../widgets/widget.dart';

class LoginScreen extends HookConsumerWidget {
  static const routeName = '/login';

  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController =
        useTextEditingController(text: "eve.holt@reqres.in");
    final passwordController = useTextEditingController(text: "cityslicka");

    var rememberMe = useState(false);

    final state = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (pre, next) {
      // if (pre?.user == null && next.user.token.isNotEmpty) {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => MainNav(),
      //     ),
      //   );
      // }
      // if (next.failure != CleanFailure.none()) {
      //   CleanFailureDialogue.show(context, failure: next.failure);
      // }
      // if (next.user != UserModel.init()) {
      //   //   Logger.i('going to home screen');
      //   //   // Future.delayed(Duration(milliseconds: 2500), () {
      //   //   //   Navigator.pushReplacement(
      //   //   //     context,
      //   //   //     MaterialPageRoute(
      //   //   //       builder: (context) => MainNav(),
      //   //   //     ),
      //   //   //   );
      //   //   // });
      //   context.go('/main_nav');
      // }
    });

    // log("user-" + Hive.box(Constants.CACHE_BOX).get(Constants.USER).toString());
    // log("token-" +
    //     Hive.box(Constants.CACHE_BOX).get(Constants.TOKEN).toString());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                    'Log In',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 28.sp),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Enter you login details to access you account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  KIconElevatedButton(
                    onPressed: () {},
                    text: "Log in with Facebook",
                    icon: Icon(
                      FontAwesomeIcons.facebookF,
                      size: 14.sp,
                    ),
                    backgroundColor: const Color(0xff4385f5),
                  ),
                  SizedBox(height: 10.h),
                  KIconElevatedButton(
                    onPressed: () {},
                    text: "Log in with Google",
                    icon: Icon(
                      FontAwesomeIcons.google,
                      size: 14.sp,
                    ),
                    backgroundColor: const Color(0xffdb4c3e),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  _or(context),
                  SizedBox(
                    height: 16.h,
                  ),
                  KShadowContainer(
                    child: Form(
                      key: _form,
                      child: Column(
                        children: [
                          KTextFormField(
                            controller: emailController,
                            hintText: 'Your Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: ValidationBuilder()
                                .required()
                                .email()
                                .maxLength(50)
                                .build(),
                          ),
                          _divider(context),
                          KTextFormField(
                            controller: passwordController,
                            hintText: 'Your Password',
                            isObscure: true,
                            validator: ValidationBuilder()
                                .required()
                                .minLength(6)
                                .maxLength(50)
                                .build(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              value: rememberMe.value,
                              onChanged: (value) {
                                rememberMe.value = value!;
                              },
                            ),
                            Text(
                              "Remember me!",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Forgot Password",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  KIconElevatedButton(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        ref.read(authProvider.notifier).login(
                              LoginBody(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
                    },
                    text: 'Continue',
                    loading: state.loading,
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 14.sp,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Haven't any account?"),
                      SizedBox(
                        width: 80.w,
                        child: TextButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => SignupScreen(),
                              //   ),
                              // );

                              context.go('/signup');
                            },
                            child: const Text("Sign up")),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _divider(BuildContext context) {
    return Divider(
      thickness: 1.8,
      height: 2,
      color: Theme.of(context).shadowColor.withOpacity(.2),
    );
  }

  Row _or(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _divider(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "OR",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.grey,
                fontSize: 12.sp),
          ),
        ),
        Expanded(
          child: _divider(context),
        ),
      ],
    );
  }
}
