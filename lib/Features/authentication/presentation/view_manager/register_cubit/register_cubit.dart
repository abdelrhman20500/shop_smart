import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/authentication/domain/use_cases/register_use_case.dart';
import 'package:shop_smart/Features/authentication/presentation/view_manager/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit(this.registerUseCase): super(RegisterInitial());
  final RegisterUseCase registerUseCase;
  void register({required String name, required String email,
    required String phone, required String password})async{
    emit(RegisterLoading());
    // Create parameters object
    final parameters = SignUpParameters({
      "name":name,
      "email": email,
      "phone":phone,
      "password": password,
    });
    var result= await registerUseCase.call(parameters);
    result.fold((e){
      emit(RegisterFailure(errMessage: e.message));
    }, (authEntity){
      emit(RegisterSuccess(authEntity: authEntity));
    });
  }
}