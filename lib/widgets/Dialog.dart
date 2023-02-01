import 'package:connect/view/home/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDialog extends StatelessWidget {
  final HomeController controller;
  const CustomDialog({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xBF000000),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 60),
      alignment:Alignment.center,
      child: SingleChildScrollView(
        child:Container(
          height: 210,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                padding: EdgeInsets.all(20),
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Device's name:",style: TextStyle(color: Colors.black,fontSize: 18),),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: controller.newDevice,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          child: TextButton(onPressed: (){
                            controller.createNewDevice();
                          }, child: Text("CREATE"),
                            style: ButtonStyle(
                              alignment: Alignment.center,
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 30)),
                              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                                  }
                                  return Color(0xFFD9D9D9); // Use the component's default.
                                },
                              ),),),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: InkWell(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Icon(Icons.clear, color: Colors.white),
                  ),
                  onTap: (){
                    controller.setCreateNewDevice(false);
                  },
                )
              )
            ],
          ),
        )
      ),
    );
  }
}
