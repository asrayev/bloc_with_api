import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/company/company_cubit.dart';
import '../../../bloc/company/company_state.dart';

class WithBuilderPage extends StatelessWidget {
  const WithBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(

        body:Center(
          child: Column(
            children: [
              SizedBox(height: 200,),
              BlocBuilder<CompanyCubit,CompanyState>(
                builder: (context, state) {
                  if(state is InitialCompanyState){
                    return Text("Area of your rectangle is : ");
                  }
                  if(state is LoadCompanyInProgress){
                    return Text("Area of your circle is : ");
                  }
                  if(state is LoadCompanyInSuccess){
                    return Text("Area of your square is :${state.companies.data.length} ");
                  }
                  return const Text("Tap the button") ;
                },

              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     TextButton(onPressed: (){
              //       BlocProvider.of<AreaCalcCubit>(context)
              //           .calcRectArea(12, 12);
              //     }, child: const Text("Rectangle")),
              //     TextButton(onPressed: (){
              //       BlocProvider.of<AreaCalcCubit>(context)
              //           .calcCircleArea(12, 12);
              //
              //     }, child: const Text("Circle")),
              //     TextButton(onPressed: (){
              //       BlocProvider.of<AreaCalcCubit>(context)
              //           .calcSquareArea(12, 12);
              //     }, child: const  Text("Square")),
              //   ],
              // )

            ],
          ),
        )

    );
  }
}