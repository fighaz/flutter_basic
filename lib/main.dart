import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_basic/basic_widgets/red__text_widget.dart';
import 'package:flutter_basic/geolocation.dart';
import 'package:flutter_basic/httphelper.dart';
import 'package:flutter_basic/models/pizza.dart';
import 'package:flutter_basic/models/plan.dart';
import 'package:flutter_basic/navigation_first.dart';
import 'package:flutter_basic/navigationdialog.dart';
// import 'package:flutter_basic/basic_widgets/dialog_widget.dart';
// import 'package:flutter_basic/basic_widgets/fab_widget.dart';
// import 'package:flutter_basic/basic_widgets/image_widget.dart';
// import 'package:flutter_basic/basic_widgets/input_widget.dart';
// import 'package:flutter_basic/basic_widgets/loading_cupertino.dart';
// import 'package:flutter_basic/basic_widgets/text_widget.dart';
import 'package:flutter_basic/pages/home_page.dart';
import 'package:flutter_basic/pages/item_page.dart';
import 'package:flutter_basic/provider/plan_provide.dart';
import 'package:flutter_basic/random_screen.dart';
import 'package:flutter_basic/views/plan.screen.dart';
import 'package:flutter_basic/views/plan_creator_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:async/async.dart';
import 'stream.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final pwdController = TextEditingController();
  // String myPass = '';
  // final storage = const FlutterSecureStorage();
  // final myKey = 'myPass';

  // Future writeToSecureStorage() async {
  //   await storage.write(key: myKey, value: pwdController.text);
  // }

  // Future<String> readFromSecureStorage() async {
  //   String secret = await storage.read(key: myKey) ?? '';
  //   return secret;
  // }

  Future<List<Pizza>> callPizzas() async {
    Httphelper helper = Httphelper();
    List<Pizza> pizzas = await helper.getPizzaList();
    return pizzas;
  }

  @override
  void initState() {
    super.initState();
  }

  // String documentsPath = '';
  // String tempPath = '';
  // String pizzaString = '';
  // List<Pizza> myPizzas = [];
  // int appCounter = 0;

  // late File myFile;
  // String fileText = '';

  // Future<bool> writeFile() async {
  //   try {
  //     await myFile.writeAsString('Margherita,Capricciosa,Napoli');
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future getPaths() async {
  //   final docDir = await getApplicationDocumentsDirectory();
  //   final tempDir = await getTemporaryDirectory();
  //   setState(() {
  //     documentsPath = docDir.path;
  //     tempPath = tempDir.path;
  //   });
  // }

  // Future readAndWritePreference() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   appCounter = prefs.getInt('appCounter') ?? 0;
  //   appCounter++;
  //   await prefs.setInt('appCounter', appCounter);
  //   setState(() {
  //     appCounter = appCounter;
  //   });
  // }

  // Future deletePreference() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();
  //   setState(() {
  //     appCounter = 0;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getPaths().then((_) {
  //     myFile = File('$documentsPath/pizzas.txt');
  //     writeFile();
  //   });
  //   super.initState();
  // }

  // Future<bool> readFile() async {
  //   try {
  //     String fileContent = await myFile.readAsString();
  //     setState(() {
  //       fileText = fileContent;
  //     });
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<List<Pizza>> readJsonFile() async {
  //   String myString = await DefaultAssetBundle.of(context)
  //       .loadString('assets/pizzalist.json');
  //   List pizzaMapList = jsonDecode(myString);
  //   List<Pizza> myPizzas = [];
  //   for (var pizza in pizzaMapList) {
  //     Pizza myPizza = Pizza.fromJson(pizza);
  //     myPizzas.add(myPizza);
  //   }
  //   String json = convertToJSON(myPizzas);
  //   print(json);
  //   return myPizzas;
  // }

  // String convertToJSON(List<Pizza> pizzas) {
  //   return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   readJsonFile().then((value) {
  //     setState(() {
  //       myPizzas = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON'),
      ),
      body: FutureBuilder(
          future: callPizzas(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
            if (snapshot.hasError) {
              return const Text('Sometging when wrong');
            } else if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            return ListView.builder(
                itemCount: (snapshot.data == null) ? 0 : snapshot.data!.length,
                itemBuilder: (BuildContext context, int position) {
                  return ListTile(
                    title: Text(snapshot.data![position].pizzaName),
                    subtitle: Text(
                        '${snapshot.data![position].description}i  ${snapshot.data![position].price}'),
                  );
                });
          }),
    );
  }

  // SingleChildScrollView(
  //   child: Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: Column(
  //       children: [
  //         TextField(
  //           controller: pwdController,
  //         ),
  //         ElevatedButton(
  //             onPressed: () {
  //               writeToSecureStorage();
  //             },
  //             child: const Text('Save Value')),
  //         ElevatedButton(
  //             onPressed: () {
  //               readFromSecureStorage().then((value) {
  //                 setState(() {
  //                   myPass = value;
  //                 });
  //               });
  //             },
  //             child: const Text('Read Value')),
  //         Text(myPass)
  //       ],
  //     ),
  //   ),
  // )

  //     Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
  //   Text('Doc path : $documentsPath'),
  //   Text('Temp path : $tempPath'),
  //   ElevatedButton(
  //       onPressed: () => readFile, child: const Text('Read File')),
  //   Text(fileText)
  // ])
  // Center(
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       Text('You have opened the app $appCounter times.'),
  //       ElevatedButton(
  //         onPressed: () {
  //           deletePreference();
  //         },
  //         child: const Text('Reset Counter'),
  //       )
  //     ],
  //   ),
  // )
  // ListView.builder(
  //     itemCount: myPizzas.length,
  //     itemBuilder: (context, index) {
  //       return ListTile(
  //         title: Text(myPizzas[index].pizzaName),
  //         subtitle: Text(myPizzas[index].description),
  //       );
  //     }),
  // );
}
// }
// class StreamHomePage extends StatefulWidget {
//   const StreamHomePage({super.key});
//   @override
//   State<StreamHomePage> createState() => _StreamHomePageState();
// }

// class _StreamHomePageState extends State<StreamHomePage> {
//   Color bgcColor = Colors.blueGrey;
//   late ColorStream colorStream;
//   int lastNumber = 0;
//   late StreamController numberStreamController;
//   // late NumberStream numberStream;
//   late StreamTransformer transformer;
//   late StreamSubscription subscription;
//   late StreamSubscription subscription2;
//   late Stream<int> numberStream;
//   String values = '';

//   @override
//   void initState() {
//     numberStream = NumberStream().getNumbers();
//     super.initState();
    // numberStreamController = numberStream.controller;
    // Stream stream = numberStreamController.stream.asBroadcastStream();
    // subscription = stream.listen((event) {
    //   setState(() {
    //     values += '$event - ';
    //   });
    // });
    // subscription2 = stream.listen((event) {
    //   setState(() {
    //     values += '$event - ';
    //   });
    // });
    // subscription.onError((error) {
    //   setState(() {
    //     lastNumber = -1;
    //   });
    // });
    // subscription.onDone(() {
    //   print('OnDone was called');
    // });
    // transformer = StreamTransformer<int, int>.fromHandlers(
    //     handleData: (value, sink) {
    //       sink.add(value * 10);
    //     },
    //     handleError: (error, trace, sink) {
    //       sink.add(-1);
    //     },
    //     handleDone: (sink) => sink.close());
    // stream.transform(transformer).listen((event) {
    //   setState(() {
    //     lastNumber = event;
    //   });
    // }).onError((error) {
    //   setState(() {
    //     lastNumber = -1;
    //   });
    // });
    // super.initState();
  // }

  // void stopStream() {
  //   numberStreamController.close();
  // }

  // @override
  // void dispose() {
  //   subscription.cancel();
  //   numberStreamController.close();
  //   super.dispose();
  // }

  // void addRandomNumber() {
  //   Random random = Random();
  //   int myNum = random.nextInt(10);

  //   if (!numberStreamController.isClosed) {
  //     numberStream.addNumberToSink(myNum);
  //   } else {
  //     setState(() {
  //       lastNumber = -1;
  //     });
  //   }

  //   // numberStream.addError();
  // }

  // void changeColor() async {
  //   // await for (var eventColor in colorStream.getColors()) {
  //   //   setState(() {
  //   //     bgcColor = eventColor;
  //   //   });
  //   // }
  //   colorStream.getColors().listen((eventColor) {
  //     setState(() {
  //       bgcColor = eventColor;
  //     });
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Stream Sofisugiharto Zaini'),
  //         backgroundColor: Colors.deepOrangeAccent,
  //       ),
  //       body: StreamBuilder(
  //         stream: numberStream,
  //         initialData: 0,
  //         builder: (context, snapshot) {
  //           if (snapshot.hasError) {
  //             print("Error");
  //           }
  //           if (snapshot.hasData) {
  //             return Center(
  //               child: Text(
  //                 snapshot.data.toString(),
  //                 style: const TextStyle(fontSize: 96),
  //               ),
  //             );
  //           } else {
  //             return const SizedBox.shrink();
  //           }
  //         },
  //       )
        // SizedBox(
        //   width: double.infinity,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Text(values),
        //       // Text(lastNumber.toString()),
        //       ElevatedButton(
        //           onPressed: () => addRandomNumber(),
        //           child: const Text("New Random Number")),
        //       ElevatedButton(
        //           onPressed: () => stopStream(),
        //           child: const Text("Stop Subscription")),
        //     ],
        //   ),
        // )
//         );
//   }
// }




// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: 'Future Demo Zaini',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const LocationScreen(),
//     );
//   }
// }

// class FuturePage extends StatefulWidget {
//   const FuturePage({super.key});

//   @override
//   State<FuturePage> createState() => _FuturePageState();
// }

// class _FuturePageState extends State<FuturePage> {
//   String result = '';
//   late Completer completer;

//   Future handleError() async {
//     try {
//       await returnError();
//     } catch (error) {
//       setState(() {
//         result = error.toString();
//       });
//     } finally {
//       print('Complete');
//     }
//   }

//   Future returnError() async {
//     await Future.delayed(const Duration(seconds: 2));
//     throw Exception('Something terrible happened');
//   }

//   Future<Response> getData() async {
//     const authority = 'www.googleapis.com';
//     const path = '/books/v1/volumes/ObtCSg3BZBIC';
//     Uri url = Uri.https(authority, path);
//     return http.get(url);
//   }

//   void returnFG() {
//     final futures = Future.wait<int>([
//       returnOneAsync(),
//       returnTwoAsync(),
//       returnThreeAsync(),
//     ]);
//     futures.then((List<int> value) {
//       int total = 0;
//       for (var element in value) {
//         total += element;
//       }
//       setState(() {
//         result = total.toString();
//       });
//     });
//   }

//   Future getNumber() {
//     completer = Completer<int>();
//     calculate2();
//     return completer.future;
//   }

//   calculate2() async {
//     try {
//       await new Future.delayed(const Duration(seconds: 5));
//       completer.complete(42);
//     } catch (_) {
//       completer.completeError({});
//     }
//   }

//   Future calculate() async {
//     await Future.delayed(const Duration(seconds: 5));
//     completer.complete(42);
//   }

//   Future<int> returnOneAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 1;
//   }

//   Future<int> returnTwoAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 2;
//   }

//   Future<int> returnThreeAsync() async {
//     await Future.delayed(const Duration(seconds: 3));
//     return 3;
//   }

//   Future count() async {
//     int total = 0;
//     total = await returnOneAsync();
//     total += await returnTwoAsync();
//     total += await returnThreeAsync();
//     setState(() {
//       result = total.toString();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Back from the Future Zaini'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             const Spacer(),
//             ElevatedButton(
//               child: const Text('Go!'),
//               onPressed: () {
//                 // setState(() {
//                 //   getData().then((value) {
//                 //     result = value.body.toString().substring(0, 450);
//                 //     setState(() {});
//                 //   }).catchError((_) {
//                 //     result = 'An error occured';
//                 //     setState(() {});
//                 //   });
//                 // });
//                 // getNumber().then((value) {
//                 //   setState(() {
//                 //     result = value.toString();
//                 //   });
//                 // }).catchError((e) {
//                 //   result = 'An error occurred';
//                 // });
//                 returnError().then((value) {
//                   setState(() {
//                     result = 'Success';
//                   });
//                 }).catchError((onError) {
//                   setState(() {
//                     result = onError.toString();
//                   });
//                 }).whenComplete(() => print('Complete'));
//                 handleError();
//               },
//             ),
//             const Spacer(),
//             Text(result),
//             const Spacer(),
//             const CircularProgressIndicator(),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }



// void main() => runApp(MasterPlanApp());

// class MasterPlanApp extends StatelessWidget {
//   const MasterPlanApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PlanProvider(
//       notifier: ValueNotifier<List<Plan>>(const []),
//       child: MaterialApp(
//         title: 'State management app',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: PlanCreatorScreen(),
//       ),
//     );
//   }
// }

// final _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => MyHomePage(title: 'Flutter Demo Home Page'),
//     ),
//     GoRoute(
//       path: '/item',
//       builder: (context, state) => ItemPage(),
//     )
//   ],
// );

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               color: Colors.yellowAccent,
//               width: 55,
//               child: const RedTextWidget(
//                 text: 'You have pushed the button this many times:',
//               ),
//             ),
//             Container(
//               color: Colors.greenAccent,
//               width: 100,
//               child: const Text(
//                 'You have pushed the button this many times:',
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: _router,
//     );
//   }
  // Widget titleSection = Container(
  //   padding: const EdgeInsets.all(32),
  //   child: Row(
  //     children: [
  //       Expanded(
  //         /* soal 1*/
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             /* soal 2*/
  //             Container(
  //               padding: const EdgeInsets.only(bottom: 8),
  //               child: const Text(
  //                 'Wisata Gunung di Batu',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //             const Text('Batu, Malang, Indonesia',
  //                 style: TextStyle(color: Colors.grey)),
  //           ],
  //         ),
  //       ),
  //       /* soal 3*/
  //       const Icon(
  //         Icons.star_rate,
  //         color: Colors.red,
  //       ),
  //       const Text("41"),
  //     ],
  //   ),
  // );

  // @override
  // Widget build(BuildContext context) {
  //   Color color = Theme.of(context).primaryColor;

  //   Widget buttonSection = Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [
  //       _buildButtonColumn(color, Icons.call, 'CALL'),
  //       _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
  //       _buildButtonColumn(color, Icons.share, 'SHARE'),
  //     ],
  //   );

  //   Widget textSection = Container(
  //     padding: const EdgeInsets.all(32),
  //     child: const Text(
  //       'Gunung Bromo atau dalam bahasa Tengger dieja "Brama", juga disebut Kaldera Tengger, adalah sebuah gunung berapi aktif di Jawa Timur, Indonesia. Gunung ini memiliki ketinggian 2.614 meter di atas permukaan laut dan berada dalam empat wilayah kabupaten, yakni Kabupaten Probolinggo, Kabupaten Pasuruan, Kabupaten Lumajang, dan Kabupaten Malang. 🙂.'
  //       'Sofisugiharto Zaini-2241720026',
  //       softWrap: true,
  //     ),
  //   );

  //   return MaterialApp(
  //     title: 'Flutter layout: Nama dan NIM Anda',
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Flutter layout demo'),
  //       ),
  //       body: ListView(
  //         children: [
  //           Image.asset(
  //             'images/bromo.jpeg',
  //             width: 600,
  //             height: 240,
  //             fit: BoxFit.cover,
  //           ),
  //           titleSection,
  //           buttonSection,
  //           textSection,
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Column _buildButtonColumn(Color color, IconData icon, String label) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Icon(icon, color: color),
  //       Container(
  //         margin: const EdgeInsets.only(top: 8),
  //         child: Text(
  //           label,
  //           style: TextStyle(
  //             fontSize: 12,
  //             fontWeight: FontWeight.w400,
  //             color: color,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
// }


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ReelsLikeLayout(),
//     );
//   }
// }

// class ReelsLikeLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Reels'),
//           backgroundColor: Colors.transparent,
//         ),
//         body: Stack(
//           children: [
//             // Background image or video
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       'images/2.jpeg'), // Ganti dengan URL foto atau video yang sesuai
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // User info, description and bottom content
//             const Positioned(
//               bottom: 10,
//               left: 10,
//               right: 10,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: NetworkImage(
//                             'images/cl.png'), // Foto profil pengguna
//                         radius: 20,
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         'championsleague',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Icon(Icons.verified, color: Colors.blue, size: 16),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Pedri masterclass 👌...',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     'Liked by bagusf.anggriawan and 474,149 others',
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Right-side buttons (like, comment, share, etc.)
//             Positioned(
//               bottom: 10,
//               right: 10,
//               child: Column(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.favorite, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                   const Text(
//                     '474K',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   const SizedBox(height: 20),
//                   IconButton(
//                     icon: const Icon(Icons.comment, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                   const Text(
//                     '1,972',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   const SizedBox(height: 20),
//                   IconButton(
//                     icon: const Icon(Icons.send, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                   const Text(
//                     '4,480',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.more_vert_outlined,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {},
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//         // Bottom Navigation Bar
//         bottomNavigationBar: Container(
//           color: Colors.black,
//           child: BottomNavigationBar(
//             backgroundColor: Colors.black,
//             selectedItemColor: Colors.black,
//             unselectedItemColor: Colors.black,
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: 'Search',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.add_box),
//                 label: 'Add',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.movie),
//                 label: 'Reels',
//               ),
//               BottomNavigationBarItem(
//                 icon: CircleAvatar(
//                   backgroundImage:
//                       NetworkImage('images/cl.png'), // Gambar profil pengguna
//                   radius: 12,
//                 ),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ));
//   }
// }