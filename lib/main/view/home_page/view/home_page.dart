import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizesApp.s48 * 2 - 42,
              color: Colors.black,
            ),
            Container(
                child: Row(
              children: [
                TextButton(
                  child: Image.asset(''),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('ss'),
                  onPressed: () {},
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('sss'),
                ),
              ],
            )),

            // child: Row(

            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: 500,
            //   child: SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: Row(
            //         children: [
            //           Container(
            //             color: Colors.amber,
            //             height: MediaQuery.of(context).size.height,
            //             width: SizesApp.s60 * 3,
            //           ),
            //           Container(
            //             width: SizesApp.s60 * 3,
            //             color: Colors.red,
            //           ),
            //           Container(
            //             width: SizesApp.s60 * 3,
            //             color: Colors.black12,
            //           ),
            //           Container(
            //             width: SizesApp.s60 * 3,
            //             color: Colors.green,
            //           ),
            //           Container(
            //             width: SizesApp.s60,
            //           ),
            //         ],
            //       )),
            // ),
            Container(
              height: 500,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
