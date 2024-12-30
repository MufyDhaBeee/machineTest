import 'package:get/get.dart';
import 'package:machine_test/models/userdelete_model.dart';
import 'package:machine_test/models/viewcreated_model.dart';
import 'package:machine_test/utis/api_provider.dart';
import 'package:machine_test/utis/app_routes.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());  }

}
class HomeController extends GetxController{
  var dataList = <String>[].obs;
  var loading=false;
  var users = <ViewUsersModelClass>[].obs;// Observable list of users
  var user = <UserDeleteModelClass>[].obs;// Observable list of users

  ViewUsersModelClass viewUsersModelClass = ViewUsersModelClass();
  UserDeleteModelClass userDeleteModelClass = UserDeleteModelClass();

  @override
  void onInit() {
    refreshData();
    UsersData();
    //UpdateData();
    // fetchData();
    super.onInit();
  }

  void UsersData() async {
    loading = true;
    update();
    var data = await ApiProvider().fetchUsers();
    users.value = data;
    loading = false;
    update();
  }
  // void fetchData() {
  //   // Simulate fetching data
  //   dataList.assignAll(['Item 1', 'Item 2', 'Item 3']);
  // }
  // void refreshData() {
  //   // Simulate a refresh by clearing and re-fetching data
  //   dataList.clear();
  //   fetchData();
  //   print('Data refreshed');
  // }

  // void UpdateData() async{
  //   loading = true;
  //   update();
  //   var data = await ApiProvider().userUpdate();
  //   users.value= data;
  //   loading = false;
  //   update();
  // }

  var isLoading = false.obs;

  void refreshData() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // Simulating data fetch
    // Add your data refresh logic here
    isLoading.value = false;
    UsersData();
    Get.snackbar('Refreshed', 'Data has been refreshed successfully');
  }
  void deleteData({required var userId}) async {
    loading = true;
    update();
    var data = await ApiProvider().DeleteUsers(userId: userId);
    user.value.clear();
    loading = false;
    update();
    Get.back();
    Get.back();
    UsersData();
  }
}
