// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:homfoo/categories.dart';
// import 'package:homfoo/home.dart';
// import 'package:http/http.dart' as http;

// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   List<Map<String, dynamic>> restaurant = [];
//   Set<Marker> _markers = {};
//   LatLng initialLocation = const LatLng(9.9469883, 76.2762553);
//   final String restaurantsEndpoint = "https://f204-59-99-83-118.ngrok-free.app/restaurants/";

//   bool isRestaurantSelected = false;
//   Map<String, dynamic>? selectedRestaurant;

//   @override
//   void initState() {
//     super.initState();
//     fetchRestaurants();
//   }

//   Future<void> fetchRestaurants() async {
//     try {
//       final response = await http.get(Uri.parse(restaurantsEndpoint));
//       print('Response: ${response.statusCode}');

//       if (response.statusCode == 200) {
//         final parsed = jsonDecode(response.body);
//         final List<dynamic> restaurantsData = parsed['data'];
//         print('Restaurant Data: $restaurantsData');

         

//         setState(() {
           

//           restaurant = restaurantsData.cast<Map<String, dynamic>>();
//         });

//         addMarkers();
//       } else {
//         throw Exception('Failed to load restaurants');
//       }
//     } catch (error) {
//       print('Error fetching restaurants: $error');
//     }
//   }

//    void addMarkers() {
//     for (var restaurantData in restaurant) {
//       print('Adding marker for restaurant: ${restaurantData}');
//       Marker marker = Marker(
//         markerId: MarkerId(restaurantData['id'].toString()),
//         position: LatLng(
//           double.parse(restaurantData['latitude']),
//           double.parse(restaurantData['longitude']),
//         ),
//         infoWindow: InfoWindow(
//           title: restaurantData['name'],
//           snippet: restaurantData['location'],
//         ),
//         onTap: () {
//           setState(() {
//             // Set selectedRestaurant to the tapped restaurant
//             selectedRestaurant = restaurantData;
             
//             isRestaurantSelected = true;
//           });
//         },
//       );
//       _markers.add(marker);
//     }
//     setState(() {
//       _markers = _markers;
//     });
//   }

// @override
//  Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [

//             Container(
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color.fromARGB(255, 183, 183, 183)
//                       .withOpacity(0.5), // Shadow color
//                   spreadRadius: 5,
//                   blurRadius: 10,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],

//               color: Colors.white, // Background color
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 12),
//               child: Row(
//                 children: [
//                   Column(
//                     children: [
//                       Image.asset(
//                         "lib/assets/logo.png",
//                         width: 70,
//                         height: 70,
//                         fit: BoxFit.cover,
//                       ),
//                     ],
//                   ),
//                   // Text(
//                   //   ' ${_currentAddress ?? ""}',
//                   //   style: TextStyle(fontWeight: FontWeight.bold),
//                   // ),
//                   Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap: (){
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
//                           },
//                           child: Image.asset(
//                             "lib/assets/notification.png",
//                             width: 20,
//                             height: 20,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                    Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap:(){
//                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>map()));

//                           },
//                           child: Image.asset(
//                             "lib/assets/loc_r.png",
//                             width: 25,
//                             height: 25,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//             Center(
//               child: Container(
//                 height: MediaQuery.of(context).size.height / 1.5, // Set height to half of the screen
//                 child: GoogleMap(
//                   initialCameraPosition: CameraPosition(
//                     target: initialLocation,
//                     zoom: 14,
//                   ),
//                   markers: _markers,
//                   onTap: (LatLng latLng) {
//                     // Clear selected restaurant details if the map is tapped
//                     setState(() {
//                       selectedRestaurant = null;
//                       isRestaurantSelected = false;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 15,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   color: Colors.grey,
//                   height: 3,
//                   width: 45,
//                 )
//               ],
//             ),
//             SizedBox(height: 10,),
            
//               if (isRestaurantSelected && selectedRestaurant != null)
          
//              Padding(
//   padding: const EdgeInsets.only(left: 4, right: 4,top: 5),
//   child: SizedBox(
//     width: double.infinity,
//     height: 180,
//     child: Card(
//       elevation: 3,
//       color: Colors.white,
//       margin: EdgeInsets.all(10),
    
       
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image on the left
//            ClipRRect(
//   borderRadius: BorderRadius.only(
//     topLeft: Radius.circular(10), // Adjust the radius for top left corner
//     bottomLeft: Radius.circular(10), // Adjust the radius for bottom left corner
//   ),
//   child: Image.network(
//     "https://f204-59-99-83-118.ngrok-free.app/${selectedRestaurant?['image']}",
//     width: 150,
//     height: 180,
//     fit: BoxFit.cover,
//   ),
// ),

//             SizedBox(width: 16), // Space between image and text
//             // Details on the right
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 10,),
//                   Text(
//                     selectedRestaurant!['name'],
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
                  
//                   SizedBox(height: 8),
//                   Text(
//                     'Location: ${selectedRestaurant!['location']}',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   ),
// SizedBox(height: 20,)

          
//           ],
//         ),
//       ),
//     );
//   }

// }
