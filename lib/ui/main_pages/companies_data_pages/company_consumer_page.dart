import 'package:bloc_with_api/ui/main_pages/companies_data_pages/widget/widget_listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/company/company_cubit.dart';
import '../../../bloc/company/company_state.dart';

class WithConsumerPage extends StatelessWidget {
  const WithConsumerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
         child: BlocConsumer<CompanyCubit, CompanyState>(
             builder: (context, state) {
             if (state is InitialCompanyState) {
                return const Center(child: Text("Not Data"),);

             }else if (state is LoadCompanyInProgress) {
                return const Center(child: CircularProgressIndicator(),);

             }else if (state is LoadCompanyInSuccess) {
                return Center(child: SizedBox(
                           width: MediaQuery.of(context).size.width * 0.95,
                           child: WidgetListView(state:state),),);

             } else if (state is LoadCompanyInFailure) {
                return Center(child: Text(state.errorText,),);
             }
          return const SizedBox();
        },
        listener: (context, state) {
          if (state is LoadCompanyInProgress) {}
        },
      ),
     )
    );
  }





}
