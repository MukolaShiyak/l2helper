import 'package:flutter/material.dart';
import 'package:l2helper_v2/my_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('L2 helper'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Image.asset(
            'images/mainPhoto.png',
            fit: BoxFit.fill,
          )
          // Text('L2 kraft app')
          ,
        ),
      ),
    );
  }
}
