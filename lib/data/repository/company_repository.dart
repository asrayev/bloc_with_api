import '../model/my_response.dart';
import '../service/api_service.dart';

class CompanyRepository {
  CompanyRepository({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getAllCompanies() => apiService.getAllCompaniesModels();
}
