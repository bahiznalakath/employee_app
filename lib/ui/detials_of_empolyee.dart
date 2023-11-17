import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_employee.dart'; // Adjust the import path accordingly
class DetailsOfEmployee extends StatelessWidget {
  final String employee;

  const DetailsOfEmployee({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final employeeProvider = Provider.of<EmployeeProvider>(context, listen: false);

    // Find the employee with the matching name
    final matchingEmployee = employeeProvider.employees
        .firstWhere((emp) => emp.employeeName == employee, ); // You might want to replace `Employee()` with a default value or handle the case when no employee is found.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details of Employee'),
        centerTitle: true,
      ),
      body: matchingEmployee.employeeName.isNotEmpty
          ? Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: CircleAvatar(
              radius: 40,
              child: Text('Image'), // Display the actual image here
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Card(
              elevation: 17,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(

                        children: [
                          const Text('ID:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                          const SizedBox(width: 7,),
                          Text(matchingEmployee.id.toString(),style: const TextStyle(fontWeight: FontWeight.w200,fontSize: 24),), // Display the actual ID here
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Name:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                          const SizedBox(width: 7,),
                          Text(matchingEmployee.employeeName,style: const TextStyle(fontWeight: FontWeight.w200,fontSize: 24),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Age:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                          const SizedBox(width: 7,),
                          Text(matchingEmployee.employeeAge.toString(),style: const TextStyle(fontWeight: FontWeight.w200,fontSize: 24),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text('Salary:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                          const SizedBox(width: 7,),
                          Text(matchingEmployee.employeeSalary.toString(),style: const TextStyle(fontWeight: FontWeight.w200,fontSize: 24),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          : const Center(
        child: Text('Employee not found'),
      ),
    );
  }
}
