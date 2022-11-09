

abstract class EmployeeProvider{

  Future<dynamic> getAllEmployee({int?page,int?limit,String? search,String ?filter});
  Future<dynamic> getSortedData({request});
  Future<dynamic> getEmployeeById({required id});
  Future<dynamic>  getCheckIns({required id});


}