import 'package:flutter/material.dart';
import 'package:movies_app/presentation/views/views.dart';
import 'package:movies_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  final viewRoute = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoriteView(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoute,
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: pageIndex,),
    );
  }
}


