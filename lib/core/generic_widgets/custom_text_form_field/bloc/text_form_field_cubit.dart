import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_slot/core/generic_widgets/custom_text_form_field/bloc/text_form_field_state.dart';

class TextFormFieldCubit extends Cubit<TextFormFieldState>{
  TextFormFieldCubit() : super(InitialTextFieldFormState());

  bool hiddenPassword = true;

  bool hiddenConfirmPassword = true;

  void changeHiddenStatue(){
    hiddenPassword = !hiddenPassword;
    emit(ChangeVisibilityPasswordState());
  }

  void changeConfirmHiddenStatue(){
    hiddenConfirmPassword = !hiddenConfirmPassword;
    emit(ChangeVisibilityConfirmPasswordState());
  }

}