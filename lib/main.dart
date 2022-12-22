import 'package:flutter/material.dart';
import 'package:mockoapp/data/api_cervice/api_cervice.dart';
import 'package:mockoapp/data/repository/mocko_repository.dart';
import 'package:mockoapp/screens/app_router.dart';
import 'package:mockoapp/view_models/moco_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MockoViewModel(
            mockoRepository: MockoRepository(
              apiService: ApiService(),
            ),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.mocko,
      onGenerateRoute: AppRouts.generateRoute,
      title: 'Mockoapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
