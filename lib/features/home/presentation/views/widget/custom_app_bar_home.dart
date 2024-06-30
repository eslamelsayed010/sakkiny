import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/features/home/data/models/user_model/user_model.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel.user!.name!,
                  style: const TextStyle(
                    height: 1,
                    color: kLogoColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    //fontStyle: FontStyle.italic,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  userModel.user!.role!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kPersonView);
            },
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundColor: kLogoColor,
                  radius: 25,
                  backgroundImage: userModel.user!.profilePicture!.secureUrl !=
                          null
                      ? NetworkImage(userModel.user!.profilePicture!.secureUrl!)
                      : const NetworkImage(AssetsData.user),
                ),
                const Positioned(
                  bottom: 2.5,
                  right: 2.5,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.white,
                  ),
                ),
                const Positioned(
                  bottom: 3,
                  right: 3,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
