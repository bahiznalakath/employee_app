class EmployeeModel {
  final int id;
  final String employeeName;
  final int employeeSalary;
  final int employeeAge;
  final String profileImage;

  EmployeeModel({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json['id'],
    employeeName: json['employee_name'],
    employeeSalary: json['employee_salary'],
    employeeAge: json['employee_age'],
    profileImage: json['profile_image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'employee_name': employeeName,
    'employee_salary': employeeSalary,
    'employee_age': employeeAge,
    'profile_image': profileImage,
  };

  @override
  String toString() {
    return 'Employee(id: $id, employeeName: $employeeName, employeeSalary: $employeeSalary, employeeAge: $employeeAge, profileImage: $profileImage)';
  }
}

class EmployeeData {
  final String status;
  final List<EmployeeModel> data;
  final String message;

  EmployeeData({
    required this.status,
    required this.data,
    required this.message,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) {
    List<EmployeeModel> employees = List<EmployeeModel>.from(
      (json['data'] as List).map(
            (employee) => EmployeeModel.fromJson(employee as Map<String, dynamic>),
      ),
    );

    return EmployeeData(
      status: json['status'],
      data: employees,
      message: json['message'],
    );
  }

  @override
  String toString() {
    return 'EmployeeData(status: $status, data: $data, message: $message)';
  }
}
