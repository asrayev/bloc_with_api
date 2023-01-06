import '../../data/model/company_model.dart';

abstract class CompanyState {}

class InitialCompanyState extends CompanyState {}

class LoadCompanyInProgress extends CompanyState {}

class LoadCompanyInSuccess extends CompanyState {
  LoadCompanyInSuccess({required this.companies});

  final CompaniesModel companies;
}

class LoadCompanyInFailure extends CompanyState {
  LoadCompanyInFailure({required this.errorText});

  final String errorText;
}
