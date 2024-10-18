
import 'package:flutter/cupertino.dart';

import 'BuildText.dart';

Widget centerAppBar(String title)
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        "lib/images/logo.png",
        height: 20,
        width: 20,
      ),
      const SizedBox(
        width: 10,
      ),
      buildTextTitle(title,
          20,FontWeight.bold),
    ],
  );
}
