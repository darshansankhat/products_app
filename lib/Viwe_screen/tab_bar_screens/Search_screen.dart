import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Provider_screen/Products_provider.dart';

class Search_screen extends StatefulWidget {
  const Search_screen({Key? key}) : super(key: key);

  @override
  State<Search_screen> createState() => _Search_screenState();
}

class _Search_screenState extends State<Search_screen> {

  Product_provider? providerF;
  Product_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Product_provider>(context,listen: false);
    providerT=Provider.of<Product_provider>(context,listen: true);

    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //search
            SizedBox(height: 40),
            Container(
              height: 6.h,
              decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey4,
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 2.h, left: 3.w, right: 3.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 3.w,
                  ),
                  Icon(
                    CupertinoIcons.search,
                    color: CupertinoColors.systemGrey,
                    size: 25,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Container(
                    height: 5.h,
                    width: 51.w,
                    margin: EdgeInsets.only(top: 1.h),
                    //color: CupertinoColors.systemGrey4,
                    child: CupertinoTextField(decoration: BoxDecoration()),
                  ),
                ],
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
