import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider_employee.dart';
import 'detials_of_empolyee.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<EmployeeProvider>(context, listen: false).getDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    final employeeProvider = Provider.of<EmployeeProvider>(context);

    if (employeeProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (employeeProvider.error.isNotEmpty) {
      return Center(child: Text('Error: ${employeeProvider.error}'));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Employee List'),
        ),
        body: ListView.builder(
          itemCount: employeeProvider.employees.length,
          itemBuilder: (context, index) {
            final employee = employeeProvider.employees[index];
            return Card(
              elevation: 1,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(employee.profileImage),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsOfEmployee(employee: employee.employeeName, ),
                    ),
                  );
                },
                title: Text(employee.employeeName),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<EmployeeProvider>(context, listen: false).getDataFromAPI();
          },
          child: const Icon(Icons.refresh),
        ),
      );
    }
  }
}
