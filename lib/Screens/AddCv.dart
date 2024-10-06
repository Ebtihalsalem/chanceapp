import 'package:flutter/material.dart';

class AddCv extends StatefulWidget {

  final String title;
  final String name;

  const AddCv({super.key, required this.title, required this.name});

  @override
  State<AddCv> createState() => _AddCvState();
}

class _AddCvState extends State<AddCv> {

  @override
  Widget build(BuildContext context) {

    String title = widget.title;
    String name = widget.name;

    return AlertDialog(
      backgroundColor: const Color(0xFFEFEFEF),
      title:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/images/logo.png",
            height: 15,
            width: 15,
          ),
          SizedBox(
            width: 10,
          ),
           Text(title,
              style: const TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 15,
                  color: Color(0xFF4A4C4D),
                  fontWeight: FontWeight.bold)),
        ],
      ),
      content:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, right: 20),
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontFamily: "Tajawal",
                            color: Color(0xFF4A4C4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: name,
                      hintStyle: const TextStyle(
                          fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5,  right: 20),
                      child: Text(
                        "تاريخ الحصول عليها",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            color: Color(0xFF4A4C4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: "0000/00/00",
                      hintStyle: const TextStyle(
                          fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: const Icon(Icons.calendar_month_sharp,
                          color: Color(0xFFBBBBBB)),
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5,  right: 20),
                      child: Text(
                        "مكان الحصول عليها",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            color: Color(0xFF4A4C4D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: "اسم الجهة",
                      hintStyle: const TextStyle(
                          fontFamily: "Tajawal", color: Color(0xFFBBBBBB)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Color(0xFFBCBCBC)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: _buildHeaderText("الغاء",17,FontWeight.bold,Color(0xFFF59039)),
                    ),
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Color(0xFFF59039),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child:  _buildHeaderText("اضافة",15,FontWeight.bold,Colors.white),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),

    );

  }

  Widget _buildHeaderTextTitle(
      String text, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xff4A4C4D),
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Tajawal",
      ),
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    );
  }

  Widget _buildHeaderText(String text, double fontSize, FontWeight fontWeight, Color fontColor) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Tajawal",
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }


}

