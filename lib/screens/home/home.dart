import 'package:flutter/material.dart';
import 'package:mshop/provider/app_provider.dart';
import 'package:mshop/screens/checkout/cart/cart.dart';
import 'package:mshop/screens/home/components/banner.dart';
import 'package:mshop/screens/home/components/topbar.dart';

import 'package:mshop/screens/products/products.dart';
import 'package:mshop/screens/settings/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:mshop/screens/category/category_list_page.dart';
// import 'components/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  // Pages
  HomePage homePage;
  OrderPage orderPage;
  CategoryListPage categoryListPage ;
  SettingsPage settingsPage;

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    // call the fetch method on food
    // widget.foodModel.fetchFoods();
    // widget.model.fetchFoods();

    homePage = HomePage();
    orderPage = OrderPage();
    categoryListPage = CategoryListPage();
    settingsPage = SettingsPage();
    pages = [homePage,categoryListPage,orderPage, settingsPage];

    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            TopBar(),
            //  FeaturedProducts(),
            BannerImage(),
            Products(),
          ],
        ),
      ]),
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16),
          child: Image.asset(
            "assets/images/menu.png",
            cacheHeight: 30,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 16),
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.grey[500],
              // fontSize:
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoryListPage()));
                  }))
        ],
      ),
      resizeToAvoidBottomPadding: true,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        currentIndex: currentTab,
        onTap: (index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
              Icon(
                Icons.home,
              ),
            ]),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            title: Text("Cart"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
