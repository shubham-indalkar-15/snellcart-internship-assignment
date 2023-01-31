import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'snellcart',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewScreen()));
          },
          child: const Text('Enter'),
        ),
      ),
    );
  }
}

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  var thinWhiteTextStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w300, fontFamily: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green,
            child: Image.asset('assets/green.jpg',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill),
          ),
          Positioned(
              top: 40,
              right: 85,
              child: customMarker('Geriatrics', 18.44, 145)),
          Positioned(
              top: 87,
              left: 90,
              child: customMarker('Oftmatology', 20.95, 160)),
          Positioned(
              bottom: 220,
              left: 50,
              child: customMarker('Psychiatry', 19.44, 150)),
          Positioned(
              bottom: 20,
              right: 5,
              child: customMarker('Children pavilion', 22.82, 185)),
        ],
      ),
    );
  }

  Widget customMarker(String text, double percentage, double markerWidth) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(0),
          color: Colors.grey[850]!.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Colors.white, width: 3),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              width: markerWidth,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DecoratedIcon(
                              icon: Icon(
                                Icons.favorite,
                                size: 27,
                                color: Colors.grey[850]!.withOpacity(0.2),
                              ),
                              decoration: const IconDecoration(
                                border: IconBorder(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(text, style: thinWhiteTextStyle),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Text('$percentage %',
                                    style: thinWhiteTextStyle),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.circle,
                              size: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.transparent,
              ],
            ),
          ),
          width: 2,
          height: 60,
        )
      ],
    );
  }
}


// first tried with list tile but ended up using rows & columns as they provide more customisation

// ListTile(
//               leading: DecoratedIcon(
//                 icon: Icon(
//                   Icons.favorite,
//                   size: 27,
//                   color: Colors.black.withOpacity(0.2),
//                 ),
//                 decoration: const IconDecoration(
//                     border: IconBorder(color: Colors.white, width: 2)),
//               ),
//               title: Text(text, style: thinWhiteTextStyle),
//               horizontalTitleGap: 0,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 8),
//               subtitle: Text('$percentage %', style: thinWhiteTextStyle),
//               trailing: const Icon(
//                 Icons.circle,
//                 size: 18,
//                 color: Colors.white,
//               ),
//             ),
