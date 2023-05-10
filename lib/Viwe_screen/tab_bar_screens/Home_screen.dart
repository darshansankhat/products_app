import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Provider_screen/Products_provider.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  Product_provider? providerF;
  Product_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Product_provider>(context,listen: false);
    providerT=Provider.of<Product_provider>(context,listen: true);

    return CupertinoPageScaffold(
      child: Column(
        children: [
          //name
          Container(
            height: 20.h,
            width: 100.w,
            color: CupertinoColors.black.withOpacity(0.1),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Cupertino Store",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: CupertinoColors.black),
              ),
            ),
          ),
          //product
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return product1(index);
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget product1(int index) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Row(
        children: [
          //image
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CupertinoColors.activeBlue,
              image: DecorationImage(image: AssetImage("${providerT!.productList[index].img}"),fit: BoxFit.cover)
            ),
          ),
          //name
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${providerT!.productList[index].name}",
                style: TextStyle(fontSize: 18, color: CupertinoColors.black),
              ),
              SizedBox(height: 10),
              Text(
                "${providerT!.productList[index].price}",
                style: TextStyle(
                    fontSize: 15,
                    color: CupertinoColors.black.withOpacity(0.5)),
              )
            ],
          ),
          Spacer(),
          Icon(
            CupertinoIcons.add_circled,
            color: CupertinoColors.activeBlue,
          ),
        ],
      ),
    );
  }
}
