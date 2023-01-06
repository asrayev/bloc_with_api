import 'package:bloc_with_api/data/service/api_service.dart';
import 'package:bloc_with_api/ui/main_pages/companies_data_pages/widget/widget_listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/company/company_cubit.dart';
import '../../../bloc/company/company_state.dart';
import '../../../data/repository/company_repository.dart';

class WithBuilderPage extends StatelessWidget {
  const WithBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (context) => CompanyCubit(CompanyRepository(apiService: ApiService())),
     child: Scaffold(
          body:SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                BlocBuilder<CompanyCubit, CompanyState>(
                  builder: (context, state) {
                    if(state is InitialCompanyState){
                      return const Center(
                        child: Text("Not Data"),
                      );
                    }
                    if(state is LoadCompanyInProgress){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state is LoadCompanyInSuccess){
                      return Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.95,
                          height: MediaQuery.of(context).size.height,
                          child: WidgetListView(state: state),
                        ),
                      );
                    }
                    return const Text("Tap the button") ;
                  },
                ),
              ],
            ),
          )
      ),
   );
  }
}