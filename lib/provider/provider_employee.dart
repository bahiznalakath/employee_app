import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Model/employee_model.dart';

class EmployeeProvider extends ChangeNotifier {

  static const  _url = "https://dummy.restapiexample.com/api/v1/employees";

  bool isLoading = true;
  String error = '';
  List<EmployeeModel> _employees = [];
  List<EmployeeModel> get employees => _employees;

  Future<void> getDataFromAPI() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body)['data'];
        _employees = responseData
            .map((employeeData) => EmployeeModel.fromJson(employeeData))
            .toList();
        notifyListeners();
      } else {
        // Handle HTTP error status codes
        throw Exception('Failed to load data from the API: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other errors (e.g., network issues, parsing errors)
      error = 'Error: $e';
    } finally {
      isLoading = false; // Set loading to false after the request completes
      notifyListeners();
    }
  }
}
