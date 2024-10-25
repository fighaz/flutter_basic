import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_basic/basic_widgets/red__text_widget.dart';
import 'package:flutter_basic/models/plan.dart';
// import 'package:flutter_basic/basic_widgets/dialog_widget.dart';
// import 'package:flutter_basic/basic_widgets/fab_widget.dart';
// import 'package:flutter_basic/basic_widgets/image_widget.dart';
// import 'package:flutter_basic/basic_widgets/input_widget.dart';
// import 'package:flutter_basic/basic_widgets/loading_cupertino.dart';
// import 'package:flutter_basic/basic_widgets/text_widget.dart';
import 'package:flutter_basic/pages/home_page.dart';
import 'package:flutter_basic/pages/item_page.dart';
import 'package:flutter_basic/provider/plan_provide.dart';
import 'package:flutter_basic/views/plan.screen.dart';
import 'package:flutter_basic/views/plan_creator_screen.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: 'State management app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PlanCreatorScreen(),
      ),
    );
  }
}

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
