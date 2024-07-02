import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/cache_helper.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/auth/sign_in/presentation/manger/sign_in_cubit.dart';
import 'package:sakkiny/features/auth/sign_in/presentation/manger/sign_in_states.dart';
import 'package:sakkiny/features/home/presentation/manger/user_cubit/user_cubit.dart';
import 'package:sakkiny/features/home/presentation/manger/user_cubit/user_states.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({Key? key}) : super(key: key);

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserStates>(builder: (context, state) {
      return BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) {
          if (state is LoadingSignInState) {
            isLoading = true;
          }
          if (state is SuccessSignInState) {
            isLoading = false;
            if (state.authModel.status!) {
              showToast(
                txt: state.authModel.message!,
                state: ToastState.SUCCESS,
              );
              CacheHelper.saveData(
                key: 'token',
                value: state.authModel.data!.usertoken!,
              ).then((value) {
                token = state.authModel.data!.usertoken!;
                UserCubit.get(context).fetchUserInfo();
                GoRouter.of(context).pushReplacement(AppRouter.kLayoutView);
              });
            } else {
              showToast(txt: state.authModel.message!, state: ToastState.ERROR);
            }
          }
          if (state is FailureSignInState) {
            isLoading = false;
            return showToast(txt: state.error, state: ToastState.ERROR);
          }
        },
        builder: (context, state) {
          SignInCubit cubit = SignInCubit.get(context);
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  autovalidateMode: autoValidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Lottie.asset(
                          AssetsData.animationLogin,
                          height: 200,
                        ),
                      ),
                      Text(
                        'LOGIN'.tr(context),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: kLogoColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: 'E-mail Address'.tr(context),
                        validatorText:
                            'enter your e-mail address !'.tr(context),
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        isWightThem: true,
                        onFieldSubmitted: (value) {
                          if (formKey.currentState!.validate()) {
                            cubit.userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          } else {
                            setState(() {
                              autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: const Icon(Icons.lock_outline),
                        labelText: 'Password'.tr(context),
                        validatorText: 'enter your password !'.tr(context),
                        obscure: isPassword,
                        suffixIcon: isPassword
                            ? const Icon(
                                Icons.visibility_outlined,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.grey,
                              ),
                        suffixIconPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: CustomButon(
                          width: MediaQuery.of(context).size.width * .65,
                          text: 'LOGIN'.tr(context),
                          isLoading: isLoading,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            } else {
                              setState(() {
                                autoValidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextButton(
                        text: "Don't have an account ?".tr(context),
                        textButton: 'Register'.tr(context),
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kSignUpView);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
