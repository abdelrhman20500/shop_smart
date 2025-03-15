import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Core/utils/custom_bottom.dart';
import 'package:shop_smart/Core/utils/custom_text_filed.dart';
import 'package:shop_smart/Features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:shop_smart/Features/authentication/data/repos/auth_repo_impl.dart';
import 'package:shop_smart/Features/authentication/domain/use_cases/register_use_case.dart';
import 'package:shop_smart/Features/authentication/presentation/view_manager/register_cubit/register_cubit.dart';
import 'package:shop_smart/Features/authentication/presentation/view_manager/register_cubit/register_state.dart';
import 'package:shop_smart/Features/authentication/presentation/views/login_screen.dart';

import '../../../../Core/utils/constant.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  static const String routeName = "SignUpScreen";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterUseCase(AuthRepoImpl(
          authBaseRemoteDataSource: AuthRemoteDataSource(),),),),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterLoading)
          {
            const Center(child: CircularProgressIndicator(),);
          }else if(state is RegisterFailure){
            customSnakeBar(context: context, widget: Text(state.errMessage),backgroundColor: Colors.red);
          }else if(state is RegisterSuccess)
          {
            customSnakeBar(context: context, widget: Text(state.authEntity.message),backgroundColor: Colors.green);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffefede9),
            body: Center(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, top: 40, bottom: 15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name :", style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.6),),
                        SizedBox(height: height * 0.02),
                        CustomTextField(
                          hintText: "Name",
                          type: TextInputType.text,
                          controller: nameController,
                          prefixIcon: Icons.person,
                        ),
                        SizedBox(height: height * 0.05,),
                        Text("Email :", style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.6),),
                        SizedBox(height: height * 0.02,),
                        CustomTextField(
                          hintText: "Email",
                          type: TextInputType.emailAddress,
                          controller: emailController,
                          prefixIcon: Icons.email,
                        ),
                        SizedBox(height: height * 0.05,),
                        Text("Password :", style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.6),),
                        SizedBox(height: height * 0.02,),
                        CustomTextField(
                          hintText: "Password",
                          type: TextInputType.text,
                          controller: passwordController,
                          prefixIcon: Icons.lock,
                          suffixIcon: Icons.remove_red_eye,
                        ),
                        SizedBox(height: height * 0.05,),
                        Text("Phone :", style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.6),),
                        SizedBox(height: height * 0.02,),
                        CustomTextField(
                          hintText: "Phone",
                          type: TextInputType.phone,
                          controller: phoneController,
                          prefixIcon: Icons.phone,
                        ),
                        SizedBox(height: height * 0.05,),
                        CustomButton(text: "signUp", onPressed: ()
                        {
                         if(formKey.currentState!.validate()){
                           BlocProvider.of<RegisterCubit>(context).register(
                               name: nameController.text,
                               email: emailController.text,
                               phone: phoneController.text,
                               password: passwordController.text
                           );
                         }
                        }),
                        SizedBox(height: height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?', style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3),),
                            TextButton(
                              style: Theme.of(context).textButtonTheme.style,
                              onPressed: (){
                                Navigator.pushNamed(context, LoginScreen.routeName);
                              },
                              child: const Text("Login", style: TextStyle(fontSize: 18),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
