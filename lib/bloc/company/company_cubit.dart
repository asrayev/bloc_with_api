import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/my_response.dart';
import '../../data/repository/company_repository.dart';
import 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit(this.companyRepository) : super(InitialCompanyState()) {
    // 1  fetchAllAlbums();
  }

  final CompanyRepository companyRepository;

  fetchAllAlbums() async {
    //loading
    emit(LoadCompanyInProgress());
    MyResponse myResponse = await companyRepository.getAllCompanies();
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadCompanyInSuccess(companies: myResponse.data));
    } else {
      //error
      emit(LoadCompanyInFailure(errorText: myResponse.error));
    }
  }
}