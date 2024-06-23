import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/features/services/data/models/get_service_model/user_id.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectSectionService extends StatelessWidget {
  const ConnectSectionService({Key? key, required this.userId})
      : super(key: key);

  final UserId userId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CustomButon(
              padding: EdgeInsets.zero,
              height: 40,
              //width: 160,
              background: Colors.grey[350],
              radius: 8,
              textColor: kLogoColor,
              text: 'Email'.tr(context),
              fontSize: 12,
              addLogo: true,
              itemLogo: const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.email_outlined,
                  color: Colors.red,
                  size: 14,
                ),
              ),
              onPressed: () {
                _launchEmail(userId.email!);
              },
            ),
            const SizedBox(width: 10),
            CustomButon(
              padding: EdgeInsets.zero,
              height: 40,
              //width: 160,
              background: Colors.grey[350],
              radius: 8,
              textColor: kLogoColor,
              text: 'WhatsApp'.tr(context),
              fontSize: 12,
              addLogo: true,
              itemLogo: const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                  size: 14,
                ),
              ),
              onPressed: () {
                _launchWhatsApp('2${userId.phoneNumber!}');
              },
            ),
            const SizedBox(width: 10),
            CustomButon(
              padding: EdgeInsets.zero,
              height: 40,
              //width: 160,
              background: Colors.grey[350],
              radius: 8,
              textColor: kLogoColor,
              text: 'Phone'.tr(context),
              fontSize: 12,
              addLogo: true,
              itemLogo: const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(
                  Icons.phone,
                  color: Color(0xff009688),
                  size: 14,
                ),
              ),
              onPressed: () {
                _launchPhone(userId.phoneNumber!);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  Future<void> _launchWhatsApp(String phoneNumber) async {
    String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
    final Uri whatsappUri = Uri.parse('https://wa.me/$cleanedPhoneNumber');
    // final Uri whatsappUri = Uri.parse('whatsapp://send?phone=$cleanedPhoneNumber');

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }

  void _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }
}
