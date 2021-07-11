import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'main_page.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // check();
  }

  // String displayname="";
  // GoogleSignIn _googleSignIn = GoogleSignIn();
  // GoogleSignInAccount _googleSignInAccount;
  // check() async {
  //   GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  //   if(googleSignInAccount !=null){
  //     setState(() {
  //       displayname=googleSignInAccount.displayName;
  //       _googleSignInAccount=googleSignInAccount;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    User firebaseUser = Provider.of<User>(context);
    return (firebaseUser == null) ? LoginPage() : MainPage(firebaseUser);
  }
}