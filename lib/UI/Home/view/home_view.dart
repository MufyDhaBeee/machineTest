import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:machine_test/UI/Home/bind/home_bind.dart';
import 'package:machine_test/UI/Home/view/home_more.dart';
import 'package:machine_test/res/image.dart';
import 'package:machine_test/utis/app_routes.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Obx(
                () => IconButton(
              icon: controller.isLoading.value
                  ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2,
                ),
              )
                  : Icon(Icons.refresh, color: Colors.white),
              tooltip: 'Refresh',
              onPressed: controller.isLoading.value
                  ? null
                  : () {
                controller.refreshData();
              },
            ),
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
          onPressed: () {
            Get.toNamed(Routes.usrAdd);
          },
        child: Icon(Icons.add, color: Colors.white,),
      ),
      body: UserHome(),
    );
  }
}

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         appBar: AppBar(
//           title: Text('data', style: TextStyle(color: Colors.white),),
//           backgroundColor: Colors.blueAccent,
//         ),
//       body:ListView.builder(
//     itemCount: 10, // Replace with dynamic length
//     itemBuilder: (context, index) {
//           return Container(
//             height: 150,
//             width: 250,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5), // Shadow color
//                   spreadRadius: 2, // How wide the shadow spreads
//                   blurRadius: 3,   // How soft the shadow is
//                   offset: Offset(2, 3), // Position of the shadow (x, y)
//                 ),
//               ],
//               color: Colors.white,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 80,
//                  width: 80,
//                  color: Colors.white,
//                  child: Image.asset(profile, height: 80, width: 80,),
//                 ).cPadOnly(l: 10, t: 10),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Name:'),
//                     SizedBox(height: 10,),
//                     Text('Email:'),
//                     SizedBox(height: 10,),
//                     Text('Address:'),
//                     SizedBox(height: 20,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(5)),
//                             border: Border.all(
//                               width: 0.3,
//                               color: Colors.blue,
//                             ),
//                           ),
//                           child: Center(child: Text('Edit', style: TextStyle(
//                             color: Colors.blue,
//                           ),)),
//                         ),
//                         SizedBox(width: 10,),
//                         Container(
//                           height: 30,
//                           width: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(5)),
//                             border: Border.all(
//                               width: 0.3,
//                               color: Colors.blueAccent
//                             ),
//                           ),
//                           child: Center(child: Text('Delete', style: TextStyle(color: Colors.blue),)),
//                         ),
//                       ],
//                     ).cPadOnly(l: (context.cWidth > 1400) ? 1250 : 200),
//                   ],
//                 ).cPadOnly(l: 10, t: 10),
//               ],
//             ),
//
//           ).cPadOnly(l: 20, t: 15, r: 20, b: 10);
//         }
//       ),
//
//     );
//   }
// }

