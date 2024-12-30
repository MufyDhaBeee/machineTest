import 'dart:convert';

import 'package:machine_test/models/userdelete_model.dart';
import 'package:machine_test/models/usrcreate_model.dart';
import 'package:machine_test/models/viewcreated_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static const String baseUrl = 'https://crud-f621.onrender.com/api/user';

  Future<List<ViewUsersModelClass>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('$baseUrl/viewcreatedusers'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((user) => ViewUsersModelClass.fromJson(user)).toList();
    } else {
      throw Exception('Failed to login');
    }

  }
  Future<CreateUserModelClass> createUser({
    required String name,
    required String email,
    required String address,
  }) async {
    try {
      // Prepare the request
      final Uri url = Uri.parse('$baseUrl/create');
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'address': address,
        }),
      );

      // Check the response status
      if (response.statusCode == 200) {
        print('Success');
        print('Response Data: ${response.body}');
        // Parse and return the response data
        return CreateUserModelClass.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to create user. Status Code: ${response.statusCode}');
        print('Error Body: ${response.body}');
        throw Exception('Failed to create user');
      }
    } catch (e) {
      print('An error occurred: $e');
      rethrow; // Re-throw the exception after logging
    }
  }
  // Future<List<ViewUsersModelClass>> userUpdate({required var userId}) async {
  //   final response = await http.put(
  //     Uri.parse('$baseUrl/update/:id'),
  //   );
  //   if (response.statusCode == 200) {
  //     List<dynamic> data = jsonDecode(response.body);
  //     return data.map((user) => ViewUsersModelClass.fromJson(user)).toList();
  //   } else {
  //     throw Exception('Failed to login');
  //   }
  //
  // }


  Future<ViewUsersModelClass> userUpdate({
    required String userId,
    required String name,
    required String email,
    required String address,

  }) async {
    try {
      // Prepare the request
      final Uri url = Uri.parse('$baseUrl/update/$userId');
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
         body: jsonEncode(<String, String>{
           '_id' : userId,
        'name': name,
        'email': email,
        'address': address,
      }),
      );

      // Check the response status
      if (response.statusCode == 200) {
        print('Success');
        print('Response Data: ${response.body}');
        // Parse and return the response data
        return ViewUsersModelClass.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to create user. Status Code: ${response.statusCode}');
        print('Error Body: ${response.body}');
        throw Exception('Failed to create user');
      }
    } catch (e) {
      print('An error occurred: $e');
      rethrow; // Re-throw the exception after logging
    }
  }

  Future<UserDeleteModelClass> DeleteUsers({
    required String userId,
  }) async {
    try {
      // Prepare the request
      print('------> Userid------> $baseUrl/delete/$userId');
      final Uri url = Uri.parse('$baseUrl/delete/$userId');
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

      );

      // Check the response status
      if (response.statusCode == 200) {
        print('Success');
        print('Response Data: ${response.body}');
        // Parse and return the response data
        return UserDeleteModelClass.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to create user. Status Code: ${response.statusCode}');
        print('Error Body: ${response.body}');
        return UserDeleteModelClass.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print('An error occurred: $e');
      rethrow; // Re-throw the exception after logging
    }
  }

}