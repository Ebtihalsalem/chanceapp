import 'package:chanceapp/CompanyScreens/MyAccountForCompany/Data/CompanyUser.dart';
import 'package:flutter/cupertino.dart';

import '../UI Components/BuildText.dart';

Widget aboutTab(CompanyUser companyUser) {

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextTitle("ملخص", 14, FontWeight.bold),
        const SizedBox(height: 10),

          buildTextTitle(companyUser.company.description, 12, FontWeight.normal),

        const SizedBox(height: 20,),
        buildTextTitle("الموقع", 14, FontWeight.bold),
        const SizedBox(height: 10),

        buildTextTitle(companyUser.company.website, 12, FontWeight.normal),

        const SizedBox(height: 20,),
        buildTextTitle("المجال", 14, FontWeight.bold),
        const SizedBox(height: 10),

        buildTextTitle(companyUser.company.industry, 12, FontWeight.normal),
        const SizedBox(height: 20,),
        buildTextTitle("حجم الشركة", 14, FontWeight.bold),
        const SizedBox(height: 10),

        buildTextTitle(companyUser.company.size, 12, FontWeight.normal),

        const SizedBox(height: 20,),
        buildTextTitle("المقر الرئيسي", 14, FontWeight.bold),
        const SizedBox(height: 10),

        buildTextTitle(companyUser.company.location, 12, FontWeight.normal),

        const SizedBox(height: 20,),
        buildTextTitle("النوع", 14, FontWeight.bold),
        const SizedBox(height: 10),

        buildTextTitle(companyUser.company.typeCompany, 12, FontWeight.normal),

        const SizedBox(height: 20,),
        buildTextTitle("تاسست", 14, FontWeight.bold),
        const SizedBox(height: 10),
        buildTextTitle(companyUser.company.foundedYear, 12, FontWeight.normal),
        const SizedBox(height: 20,),
        buildTextTitle("التخصص", 14, FontWeight.bold),
        const SizedBox(height: 10),
        buildTextTitle(companyUser.company.specializations, 12, FontWeight.normal),

      ],
    ),
  );
}