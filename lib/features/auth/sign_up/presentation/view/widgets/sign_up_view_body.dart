import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/auth/sign_up/presentation/manger/register_cubit.dart';
import 'package:sakkiny/features/auth/sign_up/presentation/manger/register_states.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({Key? key}) : super(key: key);

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  String selectedRadioValue = '';
  bool isMale = true;
  bool isLoading = false;
  bool isPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is LoadingRegisterStates) {
          isLoading = true;
        }
        if (state is SuccessRegisterStates) {
          isLoading = false;
          if (state.authModel.status!) {
            showToast(txt: state.authModel.message!, state: ToastState.SUCCESS);
            GoRouter.of(context).pushReplacement(AppRouter.kSignInView);
          } else {
            showToast(txt: state.authModel.message!, state: ToastState.ERROR);
          }
        }
        if (state is FailureRegisterStates) {
          isLoading = false;
          return showToast(txt: state.error, state: ToastState.ERROR);
        }
      },
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
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
                        AssetsData.animationRegister,
                        height: 100,
                      ),
                    ),
                    Text(
                      'REGISTER'.tr(context),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: kLogoColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      labelText: 'E-mail Address'.tr(context),
                      validatorText: 'enter your e-mail address !'.tr(context),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      prefixIcon: const Icon(Icons.person_outlined),
                      labelText: 'Name'.tr(context),
                      validatorText: 'enter your name !'.tr(context),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      prefixIcon: const Icon(Icons.phone_android_outlined),
                      labelText: 'Phone'.tr(context),
                      validatorText: 'enter your Phone !'.tr(context),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
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
                    const SizedBox(height: 5),
                    // gender and age section
                    Row(
                      children: [
                        Radio(
                          value: 'Male'.tr(context),
                          groupValue: selectedRadioValue,
                          activeColor: kLogoColor,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioValue = value!;
                            });
                          },
                        ),
                        Text('Male'.tr(context)),
                        const Spacer(),
                        Radio(
                          value: 'Female'.tr(context),
                          groupValue: selectedRadioValue,
                          activeColor: kLogoColor,
                          onChanged: (value) {
                            setState(() {
                              selectedRadioValue = value!;
                            });
                          },
                        ),
                        Text('Female'.tr(context)),
                        const Spacer(),
                        Column(
                          children: [
                            Text('Age'.tr(context)),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 50,
                              height: 40,
                              child: CustomTextFormField(
                                controller: ageController,
                                keyboardType: TextInputType.number,
                                validatorText: 'enter your age !'.tr(context),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: CustomButon(
                        width: MediaQuery.of(context).size.width * .65,
                        text: 'REGISTER'.tr(context),
                        isLoading: isLoading,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.userRegister(
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                              name: nameController.text,
                              age: ageController.text,
                              gender: selectedRadioValue,
                            );
                          } else {
                            setState(() {
                              autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextButton(
                      text: 'Already have an account ?'.tr(context),
                      textButton: 'Login'.tr(context),
                      onPressed: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kSignInView);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
