import 'package:connect/view/home/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DeviceItem extends StatefulWidget {
  final HomeController homeController;
  final int index;
  const DeviceItem({Key? key, required this.homeController, required this.index}) : super(key: key);

  @override
  State<DeviceItem> createState() => _DeviceItemState();
}

class _DeviceItemState extends State<DeviceItem> {

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: (widget.homeController.states[widget.index])? Color(0xA8A9CB62): Color(0xA8000000),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: (widget.homeController.states[widget.index])? Image.asset('assets/images/light.png'):
                    Image.asset('assets/images/light_dark.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.homeController.devices[widget.index].name,style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Inika'),),
                      Text("ID: ${widget.homeController.devices[widget.index].id} \t idUser: ${widget.homeController.devices[widget.index].idUser}",style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Inika')),
                      Switch(value: widget.homeController.states[widget.index],
                          onChanged: (bool v){
                            widget.homeController.updateState(v, widget.index);
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    },);
  }
}

