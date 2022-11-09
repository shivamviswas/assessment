import 'package:shivam_task/service/employee_service/employee_provider.dart';

import '../api_contstant.dart';
import '../http_service.dart';

class EmployeeService implements EmployeeProvider {
  final HttpService _httpService = HttpService.instance!;

  @override
  Future getAllEmployee(
      {int? page, int? limit, String? search, String? filter}) async {
    var request = {
      "page": page ?? "",
      "search": search ?? "",
      "filter": filter ?? "",
      "limit": limit ?? 10
    };

    return await _httpService.get(url: API.employee, prams: request);
  }

  @override
  Future getSortedData({request})async {
    return await _httpService.get(url: API.employee, prams: request);
  }

  @override
  Future getEmployeeById({required id}) async{
    return await _httpService.get(url: "${API.employee}/$id", );
  }

  @override
  Future getCheckIns({required id}) async{
    return await _httpService.get(url: "${API.employee}/$id/checkin", );
  }




}
