import 'package:flutter/cupertino.dart';
import 'package:products_app/Provider_screen/Products_provider.dart';
import 'package:provider/provider.dart';

class Tab_bar_screen extends StatefulWidget {
  const Tab_bar_screen({Key? key}) : super(key: key);

  @override
  State<Tab_bar_screen> createState() => _Tab_bar_screenState();
}

class _Tab_bar_screenState extends State<Tab_bar_screen> {

  Product_provider? providerF;
  Product_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Product_provider>(context,listen: false);
    providerT=Provider.of<Product_provider>(context,listen: true);

    return CupertinoTabScaffold(
      tabBuilder: (context, index) {
        return providerT!.screenList[providerT!.i];
      },
      tabBar: CupertinoTabBar(
        currentIndex: providerT!.i,
        onTap: (value) {
          providerT!.selectScreen(value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: "Products"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart),label: "Cart"),
        ],
      ),
    );
  }
}
