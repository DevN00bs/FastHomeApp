import 'package:fast_home/pages/pages_export.dart';
import 'package:fast_home/services/services.dart';
import 'package:fast_home/services/login_form_provider.dart';
import 'package:fast_home/ui/input_decorations.dart';
import 'package:fast_home/widgets/auth_background.dart';
import 'package:fast_home/widgets/card_container.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatelessWidget {
  //USERNAME EMAIL PASS

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox( height: 250 ),
              CardContainer(

                child: Column(
                  children: [
                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(), // (_) to ignore the build context
                      child: _LoginForm(),
                      ),
                  ],
                ),
              ),

              SizedBox( height: 50 ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'login_page'),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all( Color(0xFF335C67).withOpacity( 0.1 ) ),
                  shape: MaterialStateProperty.all( StadiumBorder() )
                ),
                child: Text('Go to login', style: TextStyle( fontSize: 18, color: Colors.black87 )),
               ),
              SizedBox( height: 50)
            ],
          ),
        )//scroll if bigger like using keyboards LIKE listview
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);//access the entire CLASS
    
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [

           SizedBox( height: 10 ),
                    Text('Reset\nPassword', style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center, ),
                    SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'mail@example.com',
                labelText: 'Email',
                prefixIcon: Icons.alternate_email_sharp 
              ), //to bring it from a static one
              onChanged: ( value ) => loginForm.email = value,//keeps email
              validator: ( value ) {

                 String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                 RegExp regExp  = new RegExp(pattern);

                 return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Complete email correct format';

              },
            ),

            SizedBox( height: 30 ),

            MaterialButton(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30) ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color(0xFF335C67),

              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                child: Text(
                  loginForm.isLoading
                    ? 'Sent'
                    : 'Send',
                  style: TextStyle(color: Colors.white, fontSize: 18)
                  ),
              ),

              onPressed: loginForm.isLoading ? null : () async{

                FocusScope.of(context).unfocus();//remove keyboard

                //part of auth
                final authService = Provider.of<AuthService>(context, listen: false);//just able to listen on build

                //the one inside the scope at the beggining of here
                if( !loginForm.isValidForm() ) return;//do nothing
                loginForm.isLoading = true;

                try {
                final String? tkn = await authService.forgot(loginForm.email);
                if ( tkn == null) {
                  
                  Navigator.pushReplacementNamed(context, 'login_page');
                  loginForm.isLoading = false;

                } 
                } catch (e) {
                  print(e);
                  NotificationsService.showSnackbar( authService.err );   
                }

              }
            )

          ],
        ),
      )
      
    );
  }
}