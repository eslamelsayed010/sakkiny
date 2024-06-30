import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
import 'package:sakkiny/core/widgets/sign_out.dart';
import 'package:sakkiny/features/home/data/models/user_model/user_model.dart';

class UserSection extends StatelessWidget {
  const UserSection({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
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
                      children: [
                        CircleAvatar(
                          backgroundColor: kLogoColor,
                          radius: 30,
                          backgroundImage: userModel
                                      .user!.profilePicture!.secureUrl !=
                                  null
                              ? NetworkImage(
                                  userModel.user!.profilePicture!.secureUrl!)
                              : const NetworkImage(AssetsData.user),
                        ),
                        const Positioned(
                          bottom: 3.5,
                          right: 3.5,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        const Positioned(
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
                    Expanded(
                      child: Text(
                        '${userModel.user!.name!} / ${userModel.user!.role!}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
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
