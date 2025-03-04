import 'package:detailed_information_task/models/employee_model.dart';
import 'package:detailed_information_task/services/get_empolyee_service.dart';
import 'package:detailed_information_task/views/detailed_information_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<EmployeeModel> employees = [];
  bool isLoading = false;

  getEmployees() async {
    isLoading = true;
    setState(() {});
    employees = await GetAllEmployees().getAllEmployees();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          '${employees[index].firstName} ${employees[index].lastName}',
                        ),
                        subtitle: Text(
                          '${employees[index].salary}00 \$',
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailedInformationView(employee: employees[index]);
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
