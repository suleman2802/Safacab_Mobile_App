import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../General Widget/appbar_widget.dart';
import '../General Widget/bottom_navigation_widget.dart';
import '../Routes/route_controller.dart';
import './Widgets/package_tile_widget.dart';
import './Provider/package_provider.dart';
import './Model/package.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  Future<List<Package>> getPackageRecord() async {
    return await Provider.of<PackageProvider>(context).fetchPackageRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppbarWidget("Packages", false),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
      body: FutureBuilder(
          future: getPackageRecord(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: snapshot.data!.length >= 1
                    ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            InkWell(
                              child: PackageTileWidget(
                                  snapshot.data![index].carName,
                                  snapshot.data![index].noOfSeats,
                                  snapshot.data![index].noOfLuaggage,
                                  snapshot.data![index].carImageUrl),
                              onTap: () => navigateToPackageDetailScreen(
                                  context, snapshot.data![index].carId),
                            ),
                            //Divider(),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: Text(
                          "No Package available right now",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ),
              );
            }
          }),
    );
  }
}
