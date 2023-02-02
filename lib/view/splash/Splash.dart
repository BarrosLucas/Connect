import 'package:connect/model/User.dart';
import 'package:connect/request/users/UserRequest.dart';
import 'package:connect/view/first_time/First.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import '../home/Home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2D5A),
        body: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            if(snapshot.hasData){
              final int? idUser = snapshot.data!.getInt('iduser');
              final String? name = snapshot.data!.getString('name');
              print("HasData: ${idUser} e ${name}");

              if(name != null && idUser != null){
                return FutureBuilder<User?>(
                  future: UserRequest().getUserByID(idUser!),
                  builder: (BuildContext context, AsyncSnapshot<User?> snap){
                    if(snap.hasData){
                      Widget nextScreen;
                      if(snap.data == null){
                        nextScreen = First();
                      }else{
                        if(snap.data!.id == 0 && snap.data!.name.isEmpty){
                          nextScreen = First();
                        }else{
                          nextScreen = Home(u: snap.data!);
                        }
                      }
                      return Stack(
                        children: [
                          SplashScreen(
                            seconds: 3,
                            navigateAfterSeconds:nextScreen,
                            useLoader: false,
                            backgroundColor: Color(0xFF1F2D5A),
                          ),
                          Positioned(
                            child: Center(
                              child: Image.asset('assets/images/launch.png'),
                            ),
                          ),
                          const Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Text(
                              "Powered by Lucas Barros",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    }else{
                      return Stack(
                        children: [
                          Positioned(
                            child: Center(
                              child: Image.asset('assets/images/launch.png'),
                            ),
                          ),
                          const Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Text(
                              "Powered by Lucas Barros",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                );
              }else{
                return Stack(
                  children: [
                    SplashScreen(
                      seconds: 3,
                      navigateAfterSeconds:First(),
                      useLoader: false,
                      backgroundColor: Color(0xFF1F2D5A),
                    ),
                    Positioned(
                      child: Center(
                        child: Image.asset('assets/images/launch.png'),
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Text(
                        "Powered by Lucas Barros",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                );
              }
            }else{
              return Stack(
                children: [
                  Positioned(
                    child: Center(
                      child: Image.asset('assets/images/launch.png'),
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Powered by Lucas Barros",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}

