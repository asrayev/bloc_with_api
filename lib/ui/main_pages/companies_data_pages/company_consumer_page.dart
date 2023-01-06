import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/company/company_cubit.dart';
import '../../../bloc/company/company_state.dart';


class WithConsumerPage extends StatelessWidget {
  const WithConsumerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //2 BlocProvider.of<CompanyCubit>(context).fetchAllAlbums();
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("All Albums"),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           BlocProvider.of<CompanyCubit>(context).fetchAllAlbums();
        //         },
        //         icon: const Icon(Icons.upload))
        //   ],
        // ),
        body: BlocConsumer<CompanyCubit, CompanyState>(
          builder: (context, state) {
            if (state is InitialCompanyState) {
              return const Center(
                child: Text("Hali data yo'q"),
              );
            } else if (state is LoadCompanyInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadCompanyInSuccess) {
              return ListView(
                children: List.generate(
                  state.companies.data.length,
                      (index) => ListTile(
                    title: Text(
                      state.companies.data[index].carModel,
                    ),
                  ),
                ),
              );
            } else if (state is LoadCompanyInFailure) {
              return Center(
                child: Text(
                  state.errorText,
                ),
              );
            }
            return const SizedBox();
          },
          listener: (context, state) {
            if (state is LoadCompanyInProgress) {}
          },
        )
    );
  }
}