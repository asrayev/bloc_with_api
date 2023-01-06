import 'package:bloc_with_api/bloc/company/company_cubit.dart';
import 'package:bloc_with_api/ui/main_pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repository/company_repository.dart';
import 'data/service/api_service.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CompanyCubit(CompanyRepository(apiService: ApiService()))..fetchAllAlbums(),
        ),
      ],

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
      home: MainPage()
    );
  }
}
