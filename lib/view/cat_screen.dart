import 'package:catapp/data/model/cat_model.dart';
import 'package:catapp/data/repository/get_cat_details_repo.dart';
import 'package:catapp/provider/cat_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatDetailsProider>(builder: (context, provider, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Cat Details'),
            actions: [
              IconButton(
                  onPressed: () async {
                    List<Cat> data = await getcatDetails();
                    provider.updateDataModel(data);
                    print('btn pressed');
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          body: provider.dataList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Container(
                  height: 400,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(4, 8),
                          spreadRadius: -3,
                          blurRadius: 5,
                          color: Colors.grey,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                            border: Border.all(
                              color: Colors.black,
                              width: 3,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            provider.dataList[0].url!,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Text(
                          'Id :',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          provider.dataList[0].id!,
                          // model.catsData[0].id!,
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      ListTile(
                        leading: const Text(
                          'Height :',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          provider.dataList[0].height.toString(),
                          // model.catsData[0].height.toString(),
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      ListTile(
                        leading: const Text(
                          'Width :',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          provider.dataList[0].width.toString(),
                          // model.catsData[0].width.toString(),
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                )));
    });

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Cat Details'),
    //     actions: [
    //       IconButton(
    //           onPressed: () async {
    //             List<Cat> data = await getcatDetails();

    //             print('btn pressed');
    //           },
    //           icon: const Icon(Icons.refresh))
    //     ],
    //   ),
    //   body: ChangeNotifierProvider(
    //     create: (context) => CatDetailsProvider(),
    //     child: Builder(builder: (context) {
    //       final model = Provider.of<CatDetailsProvider>(context);
    //       if (model.homeState == HomeState.loading) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (model.homeState == HomeState.error) {
    //         return Center(
    //           child: Text('an error occured ${model.message}'),
    //         );
    //       }
    //       return Center(
    //         child: Container(
    //           height: 400,
    //           width: 200,
    //           decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Image.network(
    //                 model.catsData[0].url!,
    //                 height: 200,
    //                 fit: BoxFit.cover,
    //               ),
    //               ListTile(
    //                 leading: const Text(
    //                   'Id :',
    //                   style: TextStyle(fontSize: 20),
    //                 ),
    //                 trailing: Text(
    //                   model.catsData[0].id!,
    //                   style: const TextStyle(fontSize: 16),
    //                 ),
    //               ),
    //               ListTile(
    //                 leading: const Text(
    //                   'Height :',
    //                   style: TextStyle(fontSize: 20),
    //                 ),
    //                 trailing: Text(
    //                   model.catsData[0].height.toString(),
    //                   style: const TextStyle(fontSize: 16),
    //                 ),
    //               ),
    //               ListTile(
    //                 leading: const Text(
    //                   'Width :',
    //                   style: TextStyle(fontSize: 20),
    //                 ),
    //                 trailing: Text(
    //                   model.catsData[0].width.toString(),
    //                   style: const TextStyle(fontSize: 16),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     }),
    //   ),
    // );
  }
}

// class CatScreen extends StatefulWidget {
//   const CatScreen({super.key});

//   @override
//   State<CatScreen> createState() => _CatScreenState();
// }

// class _CatScreenState extends State<CatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Cat Details'),
//           actions: [
//             IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
//           ],
//         ),
//         body: ChangeNotifierProvider(
//           create: (context) => CatDetailsProvider(),
//           child: Builder(builder: (context) {
//             final model = Provider.of<CatDetailsProvider>(context);
//             if (model.homeState == HomeState.loading) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (model.homeState == HomeState.error) {
//               return Center(
//                 child: Text('an error occured ${model.message}'),
//               );
//             }
//             return ListView.builder(itemBuilder: (context, index) {
//               return Text(model.catsData[0].width.toString());
//             });
//           }),
//         )
//         // body: FutureBuilder(
//         //     future: catdata,
//         //     builder: (context, snapshot) {
//         //       if (snapshot.hasData) {
//         //         List<Cat>? data = snapshot.data;
//         //         return Center(
//         //           child: Container(
//         //             height: 400,
//         //             width: 200,
//         //             // height: data![0].height.toDouble(),
//         //             // width: data[0].width.toDouble(),
//         //             decoration:
//         //                 BoxDecoration(border: Border.all(color: Colors.grey)),
//         //             child: Column(
//         //               crossAxisAlignment: CrossAxisAlignment.center,
//         //               children: [
//         //                 Image.network(
//         //                   data![0].url,
//         //                   height: 200,
//         //                   fit: BoxFit.cover,
//         //                 ),
//         //                 ListTile(
//         //                   leading: const Text(
//         //                     'Id :',
//         //                     style: TextStyle(fontSize: 20),
//         //                   ),
//         //                   trailing: Text(
//         //                     data[0].id,
//         //                     style: const TextStyle(fontSize: 16),
//         //                   ),
//         //                 ),
//         //                 ListTile(
//         //                   leading: const Text(
//         //                     'Height :',
//         //                     style: TextStyle(fontSize: 20),
//         //                   ),
//         //                   trailing: Text(
//         //                     data[0].height.toString(),
//         //                     style: const TextStyle(fontSize: 16),
//         //                   ),
//         //                 ),
//         //                 ListTile(
//         //                   leading: const Text(
//         //                     'Width :',
//         //                     style: TextStyle(fontSize: 20),
//         //                   ),
//         //                   trailing: Text(
//         //                     data[0].width.toString(),
//         //                     style: const TextStyle(fontSize: 16),
//         //                   ),
//         //                 ),
//         //               ],
//         //             ),
//         //           ),
//         //         );
//         //       } else if (snapshot.hasError) {
//         //         return Text("${snapshot.error}");
//         //       } else {
//         //         return const Center(
//         //           child: CircularProgressIndicator(),
//         //         );
//         //       }
//         //     }),
//         );
//   }
// }
