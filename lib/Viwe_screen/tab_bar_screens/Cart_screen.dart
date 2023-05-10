import 'package:flutter/cupertino.dart';
import 'package:products_app/Provider_screen/Products_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Cart_screen extends StatefulWidget {
  const Cart_screen({Key? key}) : super(key: key);

  @override
  State<Cart_screen> createState() => _Cart_screenState();
}

class _Cart_screenState extends State<Cart_screen> {

  TextEditingController name = TextEditingController(text: "Name");
  TextEditingController email = TextEditingController(text: "Email");
  TextEditingController location = TextEditingController(text: "Location");

  Product_provider? providerF;
  Product_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Product_provider>(context,listen: false);
    providerT=Provider.of<Product_provider>(context,listen: true);

    return CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Column(
            children: [
            Container(
            height: 20.h,
            width: 100.w,
            color: CupertinoColors.black.withOpacity(0.1),
            alignment: Alignment.bottomLeft,
             child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Shopping Cart", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                    inherit: false
                ),),
              ),),
              SizedBox(height: 10,),
              TabsFields(icon: CupertinoIcons.person_alt, controller: name),
              TabsFields(icon: CupertinoIcons.mail_solid, controller: email),
              TabsFields(
                  icon: CupertinoIcons.location_solid, controller: location),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 15),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.stopwatch_fill,
                      color: CupertinoColors.systemGrey3,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Delivery time",
                      style: TextStyle(
                          color: CupertinoColors.systemGrey3,
                          fontSize: 15,
                          inherit: false),
                    ),
                    Spacer(),
                    Text(
                      "${providerT!.dateTime.day} / ${providerT!.dateTime.month} / ${providerT!.dateTime
                          .year}  ${providerT!.dateTime.hour} : ${providerT!.dateTime.minute}",
                      style: TextStyle(
                          color: CupertinoColors.systemGrey3,
                          fontSize: 15,
                          inherit: false),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 220,
                  child: CupertinoDatePicker(
                    onDateTimeChanged: (value) {
                      DateTime? temp;
                      temp = value;
                      providerF!.datechange(temp);
                    },
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: DateTime.now(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Padding TabsFields({
    TextEditingController? controller,
    IconData? icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: CupertinoTextField(
        prefix: Icon(
          icon,
          color: CupertinoColors.systemGrey3,
          size: 20,
        ),
        style: TextStyle(color: CupertinoColors.systemGrey3, fontSize: 15),
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: BoxDecoration(
            border:
            Border(bottom: BorderSide(color: CupertinoColors.systemGrey3))),
      ),
    );
  }
}
