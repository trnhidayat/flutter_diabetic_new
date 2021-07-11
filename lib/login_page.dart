import 'package:flutter/material.dart';
import 'package:flutter_diabetic/auth_services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleSignOut();
  }

  GoogleSignIn _googleSignIn = GoogleSignIn();
  signInGoogle() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    if(googleSignInAuthentication != null){
      print("success");

      var test=await AuthServices.signUp(
          googleSignInAccount.email, googleSignInAccount.displayName).catchError((onError)async{
        await AuthServices.signIn(
            googleSignInAccount.email, googleSignInAccount.displayName);
      });
      if(test==null){
        await AuthServices.signIn(
            googleSignInAccount.email, googleSignInAccount.displayName);
      }
    }
    // return googleSignInAuthentication != null ? 'sukses':'';
  }
  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login Page"),),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 100,
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: 'ID',
                      icon: const Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: const Icon(Icons.quick_contacts_mail_sharp),)),
                  controller: emailController,
                ),
              ),
              Container(
                width: 300,
                height: 100,
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      icon: const Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: const Icon(Icons.lock),)
                  ),
                  controller: passwordController,
                  obscureText: true,
                ),
              ),
              RaisedButton(
                  child: Text("Sign In Anonymous"),
                  onPressed: () async{
                    await AuthServices.signInAnonymous();
                  }),
              RaisedButton(
                  child: Text("Sign In"),
                  onPressed: () async{
                    // await AuthServices.signIn(
                    //     emailController.text, passwordController.text);
                    signInGoogle();

                  }),
              RaisedButton(
                  child: Text("Sign Up"),
                  onPressed: () async{
                    await AuthServices.signUp(
                        emailController.text, passwordController.text);
                  }),
            ],
          ),
        )
    );
  }
}