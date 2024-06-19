import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/assets.dart';
import 'package:sakkiny/core/utils/const.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({Key? key}) : super(key: key);

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
              children: const [
                Text(
                  'Eslam Elsayed',
                  style: TextStyle(
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
                  'USER',
                  style: TextStyle(
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
              children: const [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(AssetsData.user),
                ),
                Positioned(
                  bottom: 2.5,
                  right: 2.5,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
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
