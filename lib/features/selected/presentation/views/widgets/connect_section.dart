import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';

class ConnectSection extends StatelessWidget {
  const ConnectSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButon(
            padding: EdgeInsets.zero,
            height: 40,
            background: Colors.grey[350],
            radius: 8,
            textColor: kLogoColor,
            text: 'Gmail',
            fontSize: 12,
            addLogo: true,
            itemLogo: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.email_outlined,
                color: Colors.red,
              ),
            ),
            // itemLogo: Image.asset(
            //   AssetsData.gmailLogo,
            //   width: 50,
            // ),
          ),
          CustomButon(
            padding: EdgeInsets.zero,
            height: 40,
            background: Colors.grey[350],
            radius: 8,
            textColor: kLogoColor,
            text: 'WhatsApp',
            fontSize: 12,
            addLogo: true,
            itemLogo: const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green,
              ),
            ),
          ),
          CustomButon(
            padding: EdgeInsets.zero,
            height: 40,
            background: Colors.grey[350],
            radius: 8,
            textColor: kLogoColor,
            text: 'Phone',
            fontSize: 12,
            addLogo: true,
            itemLogo: const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Icon(
                Icons.phone,
                color: Color(0xff009688),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
