import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/UI/Home/bind/home_bind.dart';
import 'package:machine_test/UI/userAdd/view/useradd_more.dart';
import 'package:machine_test/res/image.dart';
import 'package:machine_test/utis/app_routes.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return ListView.builder(
          itemCount: logic.users.value?.length ?? 0,
          // Replace with dynamic length
          itemBuilder: (context, index) {
            var data = logic.users.value?[index];
            return UserCard(
              name: data?.name ?? '',
              email: data?.email ?? '',
              address: data?.address ?? '',
              userId: data?.sId ?? '',
            );
          });
    });
  }
}
// class AddUsers extends StatelessWidget {
//   const AddUsers({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       height: 75,
//       width: 75,
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'MENU',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//
//
//     );
//   }
// }

class UserCard extends StatelessWidget {
  var name;
  var email;
  var address;
  var userId;

  UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.address,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // How wide the shadow spreads
            blurRadius: 3, // How soft the shadow is
            offset: Offset(2, 3), // Position of the shadow (x, y)
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              SizedBox(
                width: 155,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: $name'),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Email: $email'),
                    SizedBox(
                      height: 3,
                    ),
                    Text('Address: $address'),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.usrAdd,
                            arguments: [userId, name, email, address]);
                      },
                      child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            width: 0.3,
                            color: Colors.blue,
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showDeleteDialog(context, userId);
                      },
                      child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border:
                              Border.all(width: 0.3, color: Colors.blueAccent),
                        ),
                        child: Center(
                            child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.blue),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showDeleteDialog(BuildContext context, userId) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            content:
                GetBuilder<HomeController>(builder: (logic) {
                return
                SizedBox(
              height: 150,
              width: 110,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delete contact?',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Are you sure you want to delete this contact?'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            logic.deleteData(userId: userId);
                          },
                          child: Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
      }
                ));});
}
