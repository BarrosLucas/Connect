import 'package:connect/model/User.dart';
import 'package:connect/view/home/homecontroller.dart';
import 'package:connect/widgets/DeviceItem.dart';
import 'package:connect/widgets/Dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatefulWidget {
  final User u;
  const Home({Key? key, required this.u}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController? controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = HomeController();
    controller!.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller!.setUser(widget.u);
    controller!.setLoadingDevice();
    return Observer(builder: (_) {
      return ((controller!.isLoading)? 
      const CircularProgressIndicator():
      (!controller!.isCreatingNewDevice)?
      Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 40,
              left: 20,
              child: Text("Olá, ${controller!.user.name}!",style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Inika"),),
            ),
            Positioned(
              top: 80,
              bottom: 0,
              right: 20,
              left: 20,
              child: body(),
            ),
            Positioned(
              bottom: 30,
              right: 10,
              child: FloatingActionButton(
                backgroundColor: const Color(0xff555555),
                onPressed: () {
                  controller!.setCreateNewDevice(true);
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ): Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Text("Olá, ${controller!.user.name}!",style: const TextStyle(color: Colors.black, fontSize: 17),),
            ),
            Positioned(
              top: 80,
              bottom: 0,
              right: 20,
              left: 20,
              child: body(),
            ),
            Positioned(
              bottom: 30,
              right: 10,
              child: FloatingActionButton(
                backgroundColor: const Color(0xff555555),
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
            Positioned(top: 0, left: 0, right: 0, bottom: 0,child: CustomDialog(controller: controller!,),)
          ],
        ),
      ));
    });
  }

  Widget body() {
    return Observer(
      builder: (_){
        return (controller!.devices.isEmpty)?
        const Center(
          child: Text(
            "No devices connected yet",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ):SingleChildScrollView(
          child: Column(
            children: generateListItem(),
          ),
        );

      },
    );
  }

  List<Widget> generateListItem(){
    List<Widget> children = [];

    int i = 0;
    controller!.devices.forEach((element) {
      children.add(DeviceItem(homeController: controller!, index: i++));
    });

    return children;
  }
}
