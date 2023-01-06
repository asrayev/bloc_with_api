
import 'package:flutter/material.dart';
import '../../../../bloc/company/company_state.dart';
// ignore: must_be_immutable
class WidgetListView extends StatelessWidget {
  LoadCompanyInSuccess state;
   WidgetListView({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
