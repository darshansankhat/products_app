import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_app/Provider_screen/Products_provider.dart';
import 'package:products_app/Viwe_screen/Tab_bar_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return DevicePreview(
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => Product_provider(),)
            ],
            child: CupertinoApp(
              debugShowCheckedModeBanner: false,
              routes: {
                "/":(p0) => Tab_bar_screen(),
              },
            ),
          ),
          enabled: true,
        );
      },
    ),
  );
}
