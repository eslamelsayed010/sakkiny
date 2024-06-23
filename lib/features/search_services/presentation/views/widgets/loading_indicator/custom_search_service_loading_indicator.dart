import 'package:flutter/material.dart';
import 'package:sakkiny/core/widgets/custom_fading_widget.dart';

class CustomSearchServiceLoadingIndicator extends StatelessWidget {
  const CustomSearchServiceLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 10),
        child: SizedBox(
          height: 150,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 20,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 20,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
