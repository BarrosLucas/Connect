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
        backgroundColor: Colors.white,
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
                        nextScreen = Home(u: snap.data!);
                      }
                      return Stack(
                        children: [
                          SplashScreen(
                            seconds: 3,
                            navigateAfterSeconds:nextScreen,
                            useLoader: false,
                          ),
                          Positioned(
                            child: Center(
                              child: Image.asset('assets/images/logo.png'),
                            ),
                          ),
                          const Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Text(
                              "Powered by Lucas Barros",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    }else{
                      print("fasfa");
                      return Stack(
                        children: [
                          Positioned(
                            child: Center(
                              child: Image.asset('assets/images/logo.png'),
                            ),
                          ),
                          const Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Text(
                              "Powered by Lucas Barros",
                              textAlign: TextAlign.center,
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
                    ),
                    Positioned(
                      child: Center(
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Text(
                        "Powered by Lucas Barros",
                        textAlign: TextAlign.center,
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
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Powered by Lucas Barros",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}

