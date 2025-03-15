import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/authentication/domain/use_cases/login_use_case.dart';
import 'package:shop_smart/Features/authentication/presentation/view_manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit(this.loginUseCase): super(LoginInitial());
  final LoginUseCase loginUseCase;
  void login({required String email, required String password})async{
    emit(LoginLoading());
    // Create parameters object
    final parameters = SignInParameters({
      "email": email,
      "password": password,
    });
    var result= await loginUseCase.call(parameters);
    result.fold((e){
      emit(LoginFailure(errMessage: e.message));
    }, (authEntity){
      emit(LoginSuccess(authEntity: authEntity));
    });
  }
}