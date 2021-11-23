import 'package:fast_home/pages/pages_page.dart';
import 'package:fast_home/pages/login_page.dart';
import 'package:fast_home/pages/register_page.dart';
import 'package:fast_home/services/auth_service.dart';

import 'package:flutter/material.dart';

import 'package:fast_home/pages/pages_page.dart';
import 'package:fast_home/pages/login_page.dart';
import 'package:fast_home/pages/register_page.dart';
import 'package:fast_home/services/login_form_provider.dart';
import 'package:fast_home/ui/input_decorations.dart';
import 'package:fast_home/widgets/auth_background.dart';
import 'package:fast_home/widgets/card_container.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
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
                    SizedBox( height: 10 ),
                    Text('Register', style: Theme.of(context).textTheme.headline4 ),
                    SizedBox( height: 30 ),
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
                child: Text('Already an account? Log in', style: TextStyle( fontSize: 18, color: Colors.black87 )),
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
                hintText: 'MyUser01',
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
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                child: Text(
                  loginForm.isLoading
                    ? 'Wait'
                    : 'Sign up',
                  style: TextStyle(color: Colors.white, fontSize: 22)
                  ),
              ),

              onPressed: loginForm.isLoading ? null : () async{

                FocusScope.of(context).unfocus();//remove keyboard

                //part of auth
                final authService = Provider.of<AuthService>(context, listen: false);//just able to listen on build

                //the one inside the scope at the beggining of here
                if( !loginForm.isValidForm() ) return;//do nothing
                loginForm.isLoading = true;

                //await Future.delayed(Duration( seconds: 1));
                //validate login
                final String? tkn = await authService.createUser(loginForm.username, loginForm.email, loginForm.password);

                loginForm.isLoading = false;

                Navigator.pushReplacementNamed(context, 'pages_page');
              }
            )

          ],
        ),
      )
      
    );
  }
}
/*
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 100, bottom: 10),
                child: Text(
                  "Registration Form",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 100, bottom: 10),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Enter a username",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10, bottom: 10),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Enter your E-mail",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10, bottom: 10),
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10, bottom: 30),
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Confirm your Password",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                /*
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10)),
                */
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF335C67)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 19)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                              )
                          )
                    ),
                  onPressed: () {
                      print('Signed up successfully');
                      Navigator.pushReplacementNamed(context, 'pages_page');
                      }, 
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                //already account
              ),
              TextButton(
                onPressed: () {
                  //FORGOT PASSWORD SCREEN HERE
                  Navigator.pushReplacementNamed(context, 'login_page');
                },
                child: const Text(
                  'Already an account? Log in',
                  style: TextStyle(color: Color(0xFF335C67), fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/