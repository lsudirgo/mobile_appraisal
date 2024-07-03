// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';

// class ConnectivityWidget extends StatefulWidget {
//   final Widget child;

//   const ConnectivityWidget({super.key, required this.child});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ConnectivityWidgetState createState() => _ConnectivityWidgetState();
// }

// class _ConnectivityWidgetState extends State<ConnectivityWidget> {
//   late Stream<ConnectivityResult> _connectivityStream;
//   ConnectivityResult? _connectionStatus;

//   @override
//   void initState() {
//     super.initState();
//     _connectivityStream =
//         Connectivity().onConnectivityChanged as Stream<ConnectivityResult>;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<ConnectivityResult>(
//       stream: _connectivityStream,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           _connectionStatus = snapshot.data;
//         }
//         return Stack(
//           children: [
//             widget.child,
//             if (_connectionStatus == ConnectivityResult.none)
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   color: Colors.red,
//                   padding: const EdgeInsets.all(8.0),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.wifi_off, color: Colors.white),
//                       SizedBox(width: 8),
//                       Text(
//                         'No Internet Connection',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
