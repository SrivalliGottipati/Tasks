import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grid_View extends StatefulWidget {
  const Grid_View({super.key});

  @override
  State<Grid_View> createState() => _Grid_ViewState();
}

class _Grid_ViewState extends State<Grid_View> {
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.sticky_note_2_rounded,"color":Color(0xffF2BC59), "text": "Basics", "progress": 4 / 5},
    {"icon": Icons.shopping_bag_rounded,"color":Color(0xffF53E57), "text": "Occupations", "progress": 1 / 5},
    {"icon": Icons.message, "color":Color(0xff3A9CD1),"text": "Conversation", "progress": 3 / 5},
    {"icon": Icons.location_on,"color":Color(0xff3CB671), "text": "Places", "progress": 1 / 5},
    {"icon": Icons.people,"color":Color(0xffB47BDD), "text": "Family members", "progress": 3 / 5},
    {"icon": Icons.apple,"color":Color(0xff0C4CBE), "text": "Foods", "progress": 2 / 5},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xffFFAD2D),
        title: Text("Curse", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: Colors.white)
        ],
      ),
      body: Stack(
        children: [
          Container(
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                height: 300,
                color: Color(0xffFFAD2D),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Spanish',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                            SizedBox(height: 15),
                            Container(
                              height: 43,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Beginner',
                                      style: TextStyle(
                                          color: Color(0xffFFB727), fontSize: 20),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          CupertinoIcons.chevron_down,
                                          color: Color(0xffFFB727),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 90),
                        // Circle with Dynamic Border
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // Outer thin white border
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                            // Custom Paint for percentage border
                            CustomPaint(
                              size: Size(100, 100),
                              painter: PercentageBorderPainter(43), // Set your percentage
                            ),
                            // Text Inside
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '43%',
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Completed',
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.red, size: 30),
                          Icon(Icons.star, color: Colors.red, size: 30),
                          SizedBox(width: 10),
                          Text('2 Milestones',
                              style:
                              TextStyle(color: Colors.white, fontSize: 20))
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 items per row
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: 1,
                    ),
                    itemCount: 6, // Change as needed
                    itemBuilder: (context, index) {
                      var item = items[index];
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon in a circle with shadow
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 6,
                                    spreadRadius: 2,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Icon(item["icon"], color: item["color"], size: 40),
                            ),
                            SizedBox(height: 8),

                            // Text Below Icon
                            Text(
                              item["text"],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.4)),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "${(item["progress"] * 5).toInt()}/5",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color:Colors.black.withOpacity(0.4)),
                            ),
                            SizedBox(height: 10),
                                LinearProgressIndicator(
                                  value: item["progress"],
                                  backgroundColor: Colors.grey[300],
                                  valueColor: AlwaysStoppedAnimation<Color>(item["color"]),
                                  minHeight: 8,
                                  borderRadius: BorderRadius.circular(5),
                                ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Custom Painter for Dynamic Border Thickness
class PercentageBorderPainter extends CustomPainter {
  final double percentage;

  PercentageBorderPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint thinPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Default thin border

    Paint thickPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5; // Thick part

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;

    // Draw thin full-circle border
    canvas.drawCircle(center, radius - 1, thinPaint);

    // Draw thick border based on percentage (43% = about 155 degrees)
    double sweepAngle = (percentage / 100) * 2 * pi;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 1),
      -pi / 2, // Start from top
      sweepAngle, // Sweep angle based on percentage
      false,
      thickPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height + 100, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}



class GridWithProgress extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.star, "text": "Achievement", "progress": 1 / 5},
    {"icon": Icons.favorite, "text": "Health", "progress": 2 / 5},
    {"icon": Icons.book, "text": "Knowledge", "progress": 3 / 5},
    {"icon": Icons.fitness_center, "text": "Workout", "progress": 4 / 5},
    {"icon": Icons.music_note, "text": "Music", "progress": 5 / 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text("Grid with Progress")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            var item = items[index];
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon in a circle with shadow
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.4),
                          blurRadius: 6,
                          spreadRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(item["icon"], color: Colors.white, size: 40),
                  ),
                  SizedBox(height: 8),

                  // Text Below Icon
                  Text(
                    item["text"],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 8),

                  // Progress Bar with Text
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: item["progress"],
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                        minHeight: 10,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      Text(
                        "${(item["progress"] * 5).toInt()}/5",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


