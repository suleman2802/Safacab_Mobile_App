import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safa_cab/Reviews%20Screen/Provider/review_provider.dart';

// import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../General Widget/appbar_widget.dart';
import '../General Widget/bottom_navigation_widget.dart';
import 'Model/review.dart';

class ReviewsScreen extends StatefulWidget {
  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  Future<List<Review>> getReviews() async {
    return await Provider.of<ReviewProvider>(context).getReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppbarWidget("Reviews", false),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
      body: FutureBuilder(
          future: getReviews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return snapshot.data!.length >= 1
                  ? Container(
                      margin: const EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            listTileWidget(context, snapshot.data![index].name,
                                snapshot.data![index].reviewText),
                            Divider(),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: Text("There is no review avaliable"),
                    );
            }
          }),
    );
  }

  ListTile listTileWidget(BuildContext context, String name, String review) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person, color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
      ),
      title: Text(name),
      subtitle: Text(
        review,
      ),
      // trailing: SmoothStarRating(
      //   rating: 5,
      //   size: 18,
      //   filledIconData: Icons.star,
      //   halfFilledIconData: Icons.star_half,
      //   defaultIconData: Icons.star_border,
      //   starCount: 5,
      //   allowHalfRating: false,
      //   spacing: 2.0,
      // ),
    );
  }
}
