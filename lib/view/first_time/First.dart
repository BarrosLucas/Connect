import 'package:connect/view/first_time/firstcontroller.dart';
import 'package:connect/view/home/Home.dart';
import 'package:flutter/material.dart';
class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  FirstController? controller;

  @override
  void initState() {
    controller = FirstController();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00323232),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.person,size: 100,color: Colors.white,),
                ),
                Text("What about say us your name?",style: TextStyle(fontFamily: 'Inika',color: Colors.white),),
                TextFormField(
                  controller: controller!.userName,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white,),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Positioned(bottom: 30, right: 30,child: FloatingActionButton(onPressed: () {
            controller!.createNewUser().then((value) {
              if(controller!.u!.id != 0){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home(u: controller!.u!,)));
              }
            });
          },
            child: Icon(Icons.navigate_next,color: Colors.white,),
            backgroundColor: Color(0x9E869F78),),)
        ],
      ),
    );
  }
}
