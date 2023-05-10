import 'package:flutter/cupertino.dart';
import 'package:products_app/Model_screen/Product_model.dart';
import 'package:products_app/Viwe_screen/tab_bar_screens/Cart_screen.dart';
import 'package:products_app/Viwe_screen/tab_bar_screens/Home_screen.dart';
import 'package:products_app/Viwe_screen/tab_bar_screens/Search_screen.dart';

class Product_provider extends ChangeNotifier
{
  int i=0;

  List screenList=[
    Home_screen(),
    Search_screen(),
    Cart_screen(),
  ];

  void selectScreen(int value)
  {
    i=value;

    notifyListeners();
  }

  DateTime dateTime=DateTime.now();

  void datechange(DateTime temp)
  {
    dateTime = temp;
    notifyListeners();

  }

  List<Product_model> productList=[
    Product_model(name: "King",img: "assets/iamge/1.jpg",price: "\$10"),
    Product_model(name: "Goals",img: "assets/iamge/2.jpg",price: "\$20"),
    Product_model(name: "star",img: "assets/iamge/3.jpg",price: "\$1"),
    Product_model(name: "Fish",img: "assets/iamge/4.jpg",price: "\$5"),
    Product_model(name: "King",img: "assets/iamge/5.jpg",price: "\$1"),
    Product_model(name: "King",img: "assets/iamge/6.jpg",price: "\$10"),
    Product_model(name: "King",img: "assets/iamge/7.jpg",price: "\$15"),
    Product_model(name: "123",img: "assets/iamge/8.jpg",price: "\$100"),
    Product_model(name: "img",img: "assets/iamge/9.jpg",price: "\$25"),
    Product_model(name: "star",img: "assets/iamge/10.jpg",price: "\$20"),
  ];
}