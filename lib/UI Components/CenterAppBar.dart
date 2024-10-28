
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/App_theme.dart';
import 'BuildText.dart';

AppBar centerAppBar(BuildContext context,String title)
{
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: primaryColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: Icon(Icons.arrow_back_ios_new,color: secondaryColor,size: 18,),
          onPressed: (){
            Navigator.of(context).pop();
          },),
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
    ),
  );
}
