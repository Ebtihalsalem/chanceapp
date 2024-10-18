import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../UI Components/BuildText.dart';


Widget _buildCategory(String title, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Icon(
            icon,
            size: 20,
            color: const Color(0xFFBBBBBB),
          ),
        ),
        buildTextTitle(title, 13, FontWeight.normal),
      ],
    ),
  );
}


Widget buildSettings() {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextTitle("الحسـاب", 16, FontWeight.bold),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: _buildCategory("معلومات شخصية", EvaIcons.personOutline),
        ),
        _buildCategory("الحسابات المرتبطة", EvaIcons.link2Outline),
        const SizedBox(height: 20),
        buildTextTitle("عــام", 16, FontWeight.bold),
        _buildCategory("الاشعارات", EvaIcons.bellOutline),
        _buildCategory("الحماية", EvaIcons.shieldOutline),
        _buildCategory("اللغة", EvaIcons.globe),
        _buildCategory("مركز المساعدة", EvaIcons.questionMarkCircleOutline),
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Center(
            child: TextButton(
              onPressed: () {},
              child: Container(
                height: 34,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF59039)),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0, right: 40),
                      child: Icon(
                        Icons.exit_to_app_outlined,
                        color: Color(0xFFF59039),
                        size: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: buildText(
                        'تسجيل الخروج',
                        11,
                        FontWeight.bold,
                        const Color(0xFFF59039),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}