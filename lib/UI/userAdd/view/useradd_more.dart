import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:machine_test/UI/userAdd/bind/useradd_bind.dart';
import 'package:machine_test/res/image.dart';
import 'package:machine_test/res/style.dart';

class AddUser extends StatelessWidget {
  var userId;
  var name;
  var email;
  var address;

  AddUser(
      {super.key,
      required this.userId,
      required this.name,
      required this.email,
      required this.address});

  @override
  Widget build(BuildContext context) {
    Get.put(UserAddController());
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GetBuilder<UserAddController>(builder: (logic) {
          return Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // How wide the shadow spreads
                      blurRadius: 3, // How soft the shadow is
                      offset:
                          const Offset(2, 3), // Position of the shadow (x, y)
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          color: Colors.white,
                          child: Image.asset(
                            profile,
                            height: 80,
                            width: 80,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 35,
                                child: TextFormField(
                                  controller:
                                      UserAddController.to.userNameController,
                                  decoration: const InputDecoration(
                                    //labelText: '',
                                    hintText: 'Name',
                                    // border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 200,
                                // width: MediaQuery.of(context).size.width,
                                height: 35,
                                child: TextFormField(
                                  controller:
                                      UserAddController.to.userEmailController,
                                  decoration: const InputDecoration(
                                    // labelText: '',
                                    hintText: 'Email',
                                    // border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 200,
                                // width: MediaQuery.of(context).size.width,
                                height: 35,
                                child: TextFormField(
                                  controller: UserAddController
                                      .to.userAddressController,
                                  decoration: InputDecoration(
                                    // labelText: '',
                                    hintText: 'Address',
                                    // border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (logic.userId.isEmpty) {
                                    logic.CreateData();
                                    Fluttertoast.showToast(
                                      msg: "This Item Created",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );

                                  } else {
                                    logic.UpdateData();
                                    Fluttertoast.showToast(
                                      msg: "This Item Updated",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.blue,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  }
                                },
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                      width: 0.3,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                        (logic.userId.isEmpty)? 'Add':'update',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  )),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                      width: 0.3, color: Colors.blueAccent),
                                ),
                                child: Center(
                                    child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.blue),
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
          ;
        }));
  }
}

