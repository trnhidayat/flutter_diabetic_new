import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_diabetic/auth_services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './main_page.dart';
import 'auth_services.dart';

// class MainSidebar extends StatefulWidget {
//   @override
//   _MainSidebarState createState() => _MainSidebarState();
// }
//
// class _MainSidebarState extends State<MainSidebar> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         child: Column(
//           children: <Widget> [
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(20),
//               color: Colors.blue[900],
//               child: Center(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       width: 100,
//                       height: 100,
//                       margin: EdgeInsets.only(
//                         top: 30,
//                         bottom: 10,
//                       ),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(image: NetworkImage(
//                             'https://picsum.photos/250?image=9'
//                         ),
//                             fit: BoxFit.fill),
//                       ),
//                     ),
//                     Text('Trian',
//                       style: TextStyle(
//                         fontSize: 22,
//                         color: Colors.white,
//                       ),
//                     ),
//
//                     Text('blabla@gmail.com',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.input),
//               title: Text('Log & View Data',
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LogData()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.camera_alt),
//               title: Text('Camera',
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ThirdRoute()),
//                 );
//               },
//             ),
//
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings',
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//               onTap: null,
//             ),
//             ListTile(
//               leading: Icon(Icons.arrow_back),
//               title: Text('Logout',
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               ),
//               onTap: () async {
//                 // await AuthServices.signOut();
//               },
//             ),
//           ],
//         )
//     );
//   }
// }

class MainSidebar extends StatefulWidget {
  final User user;

  MainSidebar({Key key, this.user}) : super(key: key);

  @override
  _MainSidebarState createState() => _MainSidebarState();
}

class _MainSidebarState extends State<MainSidebar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usr=widget.user;
    check();
  }
  String displayname="";
  User usr;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  check() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    if(googleSignInAccount !=null){
      setState(() {
        displayname=googleSignInAccount.displayName;
      });
    }
  }
  Future<void> _handleSignOut() async{
    _googleSignIn.disconnect();
    await AuthServices.signOut();
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
        child: Column(
          children: <Widget> [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.blue[900],
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 30,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(
                            'https://picsum.photos/250?image=9'
                        ),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Text(displayname,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),

                    Text(widget.user.email,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text('Log & View Data',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogData()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdRoute()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.signal_cellular_alt),
              title: Text('Signal Strength',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FourthRoute()),
                    );
                  },
                ),
            ListTile(
              leading: Icon(Icons.battery_full_rounded),
              title: Text('Theme',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FiveRouted()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Logout',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () async {
                _handleSignOut();
                // await AuthServices.signOut();
              },
            ),
          ],
        )
    );
  }
}
