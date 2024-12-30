import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:machine_test/models/usrcreate_model.dart';
import 'package:machine_test/models/viewcreated_model.dart';
import 'package:machine_test/utis/api_provider.dart';

class UserAddBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserAddController);
  }
}

class UserAddController extends GetxController {
  static UserAddController get to => Get.find();
  var loading = false;
  var users = <ViewUsersModelClass>[].obs; // Observable list of users

  CreateUserModelClass createUserModelClass = CreateUserModelClass();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
  ViewUsersModelClass viewUsersModelClass = ViewUsersModelClass();
  var a = 6.obs;
  var userId='';

  @override
  void onInit() {
    var argument = Get.arguments;
    if(argument!=null){
      userId=argument[0];
      userNameController.text=argument[1];
      userEmailController.text=argument[2];
      userAddressController.text=argument[3];
      update();
      print('User Id ==> ${userId}');
    }

    super.onInit();
  }

  void UpdateData() async{
    loading = true;
    update();
    var data = await ApiProvider().userUpdate(
        name: userNameController.text,
        email: userEmailController.text,
        address: userAddressController.text,
        userId: '${userId}',
        );
    users.value= data as List<ViewUsersModelClass>;
    loading = false;
    // Fluttertoast.showToast(
    //     msg: "THIS item updated",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
    update();

  }

  void CreateData() async {
    loading = true;
    createUserModelClass = await ApiProvider().createUser(
        name: userNameController.text,
        email: userEmailController.text,
        address: userAddressController.text);
    loading = false;
    // Fluttertoast.showToast(
    //     msg: "THIS item CREATED",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
    update();
    clearData();
  }

  clearData() {
    userNameController.clear();
    userNameController.clear();
    userNameController.clear();
  }

}
