import 'package:assignment06/pages/aboutApp.dart';
import 'package:assignment06/pages/login.dart';
import 'package:assignment06/pages/mainPage.dart';
import 'package:assignment06/widgets/appBar.dart';
import 'package:assignment06/widgets/bottomNavBar.dart';
import 'package:assignment06/widgets/drawer.dart';
import 'package:assignment06/widgets/notificationDrawer.dart';
import 'package:assignment06/widgets/productList.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<Home> {
  int index = 0;
  final pages = <Widget>[MainPage(), ProductList(), LoginPage(), AboutApp()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppBar("ECOM APP UI"),
      drawer: DrawerWidget.getDrawer(),
      body: pages[index],
      bottomNavigationBar:
          bottomNavBarWidget(index: index, onChangedTab: onChangedTab),
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 100,
          height: 100,
          child: Icon(Icons.search),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.pinkAccent,
                Colors.purpleAccent,
              ],
            ),
          ),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}