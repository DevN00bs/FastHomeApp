import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  //reference to widget within a <state>
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String username = '';
  String password = '';
  String email = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading( bool value ) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {

    print(formKey.currentState?.validate());

    print('- $email - $username - $password - ');
    
    return formKey.currentState?.validate() ?? false; //?? stands for else
  }

}