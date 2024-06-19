import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/core/widgets/sign_out.dart';

class UserSection extends StatelessWidget {
  const UserSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(paddingHorizontal: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kPersonView);
                },
                child: Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: const [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(AssetsData.user),
                        ),
                        Positioned(
                          bottom: 3.5,
                          right: 3.5,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.green,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Eslam Elsayed / User',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kLogoColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const CustomSignOutButton(),
          ],
        ),
        const CustomDivider(paddingHorizontal: 0),
      ],
    );
  }
}
