import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safa_cab/Ziyarat%20Screen/Provider/ziyarat_provider.dart';
import '../Routes/route_controller.dart';
import '../General Widget/appbar_widget.dart';
import '../General Widget/bottom_navigation_widget.dart';
import '../config.dart';
import './Model/ziyarat.dart';

class ZiyaratScreen extends StatefulWidget {
  const ZiyaratScreen({super.key});

  @override
  State<ZiyaratScreen> createState() => _ZiyaratScreenState();
}

class _ZiyaratScreenState extends State<ZiyaratScreen> {
  Future<List<Ziyarat>> getZiyaratDetails() async {
    return await Provider.of<ZiyaratProvider>(context).getZiyaratList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppbarWidget("Ziya-rats", false),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
      body: FutureBuilder(
          future: getZiyaratDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return snapshot.data!.length > 0
                  ? Container(
                      margin: const EdgeInsets.all(30),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            // SizedBox(
                            //   height: 35,
                            // ),
                            Container(
                              height: 100,
                              color: Theme.of(context).canvasColor,
                              child: Center(
                                child: InkWell(
                                    onTap: () => navigateToZiyaratDetailScreen(
                                        context,
                                        snapshot.data![index].carId,
                                        snapshot.data![index].id,
                                        snapshot.data![index].ziyaratName,
                                        snapshot.data![index].carImageUrl,
                                        snapshot.data![index].price,
                                        snapshot.data![index].points,
                                        snapshot.data![index].carName,
                                        snapshot.data![index].noOfSeats,
                                        snapshot.data![index].noOfLuaggage),
                                    child:
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     Image.network(
                                        //       fit: BoxFit.scaleDown,
                                        //       "https://$baseUrl/${snapshot.data![index].imageUrl}",
                                        //       width:
                                        //           MediaQuery.of(context).size.width / 3,
                                        //     ),
                                        //     Text(
                                        //       snapshot.data![index].ziyaratName,
                                        //       style:
                                        //           Theme.of(context).textTheme.bodyLarge,
                                        //     ),
                                        //   ],
                                        // ),
                                        Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Image.network(
                                            "${snapshot.data![index].imageUrl}",
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                        const SizedBox(width: 30),
                                        // Add some spacing between image and text
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            snapshot.data![index].ziyaratName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            overflow: TextOverflow
                                                .ellipsis, // To handle long text
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ))
                  : const Center(
                      child: Text(
                        "No Ziyarat Package available right now",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                    );
            }
          }),
    );
  }
}
