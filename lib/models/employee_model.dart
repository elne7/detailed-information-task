class EmployeeModel {
  final String firstName;
  final String lastName;
  final double salary;
  final String email;
  final String img;

  EmployeeModel({
    required this.firstName,
    required this.lastName,
    required this.salary,
    required this.email,
    required this.img,
  });

  factory EmployeeModel.fromJson(jsonData) {
    return EmployeeModel(
      firstName: jsonData['firstName'],
      lastName: jsonData['lastName'],
      salary: jsonData['salary'],
      email: jsonData['email'] ,
      img: jsonData['imageUrl'],
    );
  }
}
