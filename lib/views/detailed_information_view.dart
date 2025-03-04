import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class DetailedInformationView extends StatelessWidget {
  final EmployeeModel employee;

  const DetailedInformationView({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.network(
                  employee.img,
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 10),
                Text(
                  '${employee.firstName} ${employee.lastName}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Email: ${employee.email}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Salary: \$${employee.salary.toString()}00',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
