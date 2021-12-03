import 'package:fast_home/pages/pages_export.dart';
import 'package:fast_home/services/login_form_provider.dart';
import 'package:fast_home/services/services.dart';
import 'package:fast_home/ui/input_decorations.dart';
import 'package:fast_home/widgets/auth_background.dart';
import 'package:fast_home/widgets/card_container.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {

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
                    SizedBox( height: 10 ),
                    Text('Log in', style: Theme.of(context).textTheme.headline4 ),
                    SizedBox( height: 30 ),
                    ChangeNotifierProvider(
                      create: ( _ ) => LoginFormProvider(), // (_) to ignore the build context
                      child: _LoginForm(),
                      ),
                  ],
                ),
              ),

              SizedBox( height: 30 ),
              //TODO: endpoint that sends an email of password forgotten
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'forgot_pass_page'),//destroy last pages stack
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all( Color(0xFF335C67).withOpacity( 0.1 ) ),
                  shape: MaterialStateProperty.all( StadiumBorder() )
                ),
                child: Text('I forgot my password', style: TextStyle( fontSize: 18, color: Colors.black87 )),
               ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'register_page'),//destroy last pages stack
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all( Color(0xFF335C67).withOpacity( 0.1 ) ),
                  shape: MaterialStateProperty.all( StadiumBorder() )
                ),
                child: Text('No account? Sign up', style: TextStyle( fontSize: 18, color: Colors.black87 )),
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

            TextFormField(
              autocorrect: false,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'My Username',
                labelText: 'Username',
                prefixIcon: Icons.person_outlined
              ), //to bring it from a static one
              onChanged: ( value ) => loginForm.username = value,//keeps username
              validator: ( value ) {
                //TODO: Set up a search on the db in case username is already taken
                 if ( value != null && value.length >= 4 ) return null; //validation succeeds
                 return 'Username must have at least 4 characters';

              },
            ),

            SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Password',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: ( value ) => loginForm.password = value,//keeps pass
              validator: ( value ) {

                 if ( value != null && value.length >= 6 ) return null; //validation succeeds
                 return 'Password must have at least 6 characters';

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
                    ? 'Wait'
                    : 'Log in',
                  style: TextStyle(color: Colors.white, fontSize: 18)
                  ),
              ),

              onPressed: loginForm.isLoading ? null : () async{

                FocusScope.of(context).unfocus();//remove keyboard

                //part of auth
                final authService = Provider.of<AuthService>(context, listen: false);//just able to listen on build

                //the one inside the scope at the beggining of here
                if( !loginForm.isValidForm() ) return;//do nothing
                
                //loginForm.isLoading = true;

                //await Future.delayed(Duration( seconds: 1));
                //validate login
                try {
                final String? tkn = await authService.login(loginForm.username, loginForm.password);
                if ( tkn == null) {
                  
                  Navigator.pushReplacementNamed(context, 'pages_page');

                } 
                } catch (e) {
                //TODO: error messages
                  print(e);
                  NotificationsService.showSnackbar( 'Wrong username or password' );     
                }

              }
            )

          ],
        ),
      )
      
    );
  }
}
