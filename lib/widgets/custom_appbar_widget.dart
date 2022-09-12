import 'package:alfred_test/config/my_colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  bool? backActive;

  MyAppBar({Key? key, this.backActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        color: MyColor.myBlue,
        // we can set width here with conditions
        width: MediaQuery.of(context).size.width,
        height: kToolbarHeight + 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Image.asset('assets/img/logo.png'),
            ),
            backActive == true
                ? Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  )
                : const SizedBox(
                    width: 40,
                  ),
          ],
        ),
      ),
    );
  }

  ///width doesnt matter
  @override
  Size get preferredSize => Size(200, kToolbarHeight + 20);
}
