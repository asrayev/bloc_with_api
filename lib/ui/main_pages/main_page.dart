import 'package:flutter/material.dart';
import 'companies_data_pages/company_builder.dart';
import 'companies_data_pages/company_consumer_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 300,),
            ElevatedButton(onPressed: ((){Navigator.push(context, MaterialPageRoute(builder: (context)=>const WithBuilderPage()));}), child: const Text("With BlocBuilder")),
            ElevatedButton(onPressed: ((){Navigator.push(context, MaterialPageRoute(builder: (context)=>const WithConsumerPage()));}), child: const Text("With Consumer"))
          ],
        ),
      ),
    );
  }
}
