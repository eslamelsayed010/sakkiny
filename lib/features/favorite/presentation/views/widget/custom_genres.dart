import 'package:flutter/material.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_container_genres.dart';
import 'package:sakkiny/features/favorite/presentation/views/widget/bloc_builder_fav_item.dart';
import 'package:sakkiny/features/favorite/presentation/views/widget/bloc_builder_fav_service_item.dart';

class CustomGenres extends StatefulWidget {
  const CustomGenres({Key? key}) : super(key: key);
  @override
  State<CustomGenres> createState() => _CustomGenresState();
}

class _CustomGenresState extends State<CustomGenres>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[300],
              ),
              child: Center(
                child: TabBar(
                  controller: tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: kLogoColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    CustomContainerGenres(
                      text: 'House'.tr(context),
                      icon: Icons.home,
                    ),
                    CustomContainerGenres(
                      text: 'Services'.tr(context),
                      icon: Icons.cleaning_services,
                    ),
                  ],
                  padding: const EdgeInsets.only(bottom: 10),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TabBarView(
              controller: tabController,
              physics: const BouncingScrollPhysics(),
              children: const [
                BlocBuilderFavItem(),
                BlocBuilderFavServiceItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
