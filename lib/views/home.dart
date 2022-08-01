import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu, color: Colors.yellow.shade900,),
        tooltip: 'Menu',
        onPressed: (){},),
        actions: [
        Tooltip(
        message: 'Sign Out',  
        child: IconButton(  
        icon: Icon(Icons.logout, color: Colors.yellow.shade900,),  
        onPressed: () => FirebaseAuth.instance.signOut(),
    ),  
),  
        ],
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SafeArea(
        child:
          Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          alignment: Alignment.bottomCenter,
          height: 300,
          width: 300,
          child: Text("This page is under construction!!\n Sorry for the inconvenience",style: TextStyle(
            fontSize: 20,
          ),),
        ),
      )
    );
  }
}
