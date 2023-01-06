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
                           child: WidgetListView(state),),);

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





  // ignore: non_constant_identifier_names
  ListView WidgetListView(LoadCompanyInSuccess state) {
    return ListView.builder(
        itemCount: state.companies.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Image.network(state.companies.data[index].logo)),
                    Text(
                      state.companies.data[index].carModel,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.companies.data[index].averagePrice.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(state.companies.data[index].establishedYear
                            .toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
