import 'package:flutter/material.dart';
import './category_button_widget.dart';
import '../../Routes/route_controller.dart';

// class CategoryBannerWidget extends StatelessWidget {
//   const CategoryBannerWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             CategoryButtonWidget(
//               "Train Station",
//               "Pick/Drop",
//               "taxi",
//               () => navigateToAvaliableScreen(context),
//             ),
//             CategoryButtonWidget(
//               "Airpot",
//               "Pick/Drop",
//               "aeroplane",
//               () => navigateToAvaliableScreen(context),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 25,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             CategoryButtonWidget(
//               "Ziya-rats",
//               "",
//               "ziyarat",
//               () => navigateToZiyaratScreen(context),
//             ),
//             CategoryButtonWidget(
//               "Packages",
//               "",
//               "package",
//               () => navigateToPackagesScreen(context),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 25,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             CategoryButtonWidget(
//               "Bookings",
//               "",
//               "schedule",
//               () => navigateToBookingScreen(context),
//             ),
//             CategoryButtonWidget(
//               "Reviews",
//               "",
//               "review",
//               () => navigateToReviewScreen(context),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
class CategoryBannerWidget extends StatelessWidget {
  const CategoryBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CategoryButtonWidget(
                "Train Station",
                "Pick/Drop",
                "taxi",
                    () => navigateToAvaliableScreen(context),
              ),
            ),
            Expanded(
              child: CategoryButtonWidget(
                "Airpot",
                "Pick/Drop",
                "aeroplane",
                    () => navigateToAvaliableScreen(context),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CategoryButtonWidget(
                "Ziya-rats",
                "",
                "ziyarat",
                    () => navigateToZiyaratScreen(context),
              ),
            ),
            Expanded(
              child: CategoryButtonWidget(
                "Packages",
                "",
                "package",
                    () => navigateToPackagesScreen(context),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CategoryButtonWidget(
                "Bookings",
                "",
                "schedule",
                    () => navigateToBookingScreen(context),
              ),
            ),
            Expanded(
              child: CategoryButtonWidget(
                "Reviews",
                "",
                "review",
                    () => navigateToReviewScreen(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
