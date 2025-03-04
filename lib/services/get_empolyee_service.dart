import 'package:detailed_information_task/models/employee_model.dart';
import 'package:dio/dio.dart';

class GetAllEmployees {
  String endPoint = 'https://hub.dummyapis.com/employee?noofRecords=10&idStarts=1001';
  List<EmployeeModel> employees = [];

  Future<List<EmployeeModel>> getAllEmployees() async {
    final dio = Dio();
    try {
      final response = await dio.get(endPoint);
      print('Response: ${response.data}'); // Log the response data
      var data = response.data;
      data.forEach(
        (json) {
          EmployeeModel employee = EmployeeModel.fromJson(json);
          employees.add(employee);
        },
      );
      print('Employees: $employees'); // Log the populated employees list
    } on DioException catch (e) {
      print(
        'DioError: ${e.response?.statusCode} - ${e.response?.statusMessage}',
      );
      print('Error: ${e.message}'); // Log the error message
    } catch (e) {
      print(
        'Error: ${e.toString()}',
      );
    }
    return employees;
  }
}
