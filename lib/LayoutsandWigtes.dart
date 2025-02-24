import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layoutsandwigtes extends StatelessWidget {
  const Layoutsandwigtes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFA9334),
                      Colors.grey.shade200,
                      Colors.grey.shade200,
                      Colors.grey.shade200,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    //stops: [0.01, 1.0],
                  ),
                ),
              ),
              Positioned(
                top: 60,
                  left: 20,
                  right: 10,
                  child:Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Good Afternoon Srivalli",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Row(
                            children: [
                              Text("1927843573",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              SizedBox(width: 10,),
                              Container(
                                width: 55,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white,),
                                child: Center(child: Text("Prepaid",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Color(0xFFFA9334),),)),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(width: 140,),
                      Icon(CupertinoIcons.bell,size: 25,weight: 50,)
                    ],
                  ) ),
              Positioned(
                  top: 120,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                                      ),
                        child: Column(
                          children: [
                            SizedBox(height: 30,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("0 pack",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                Text("Expired",style: TextStyle(color: Colors.pink,),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Color(0xFFFA9334), width: 2), // Orange Border
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View Pack",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Color(0xFFFA9334),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color:Color(0xFFFA9334),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Color(0xFFFA9334), width: 2), // Orange Border
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Recharge",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                      
                              ],
                            )
                          ],
                        ),
                                      
                                    ),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color:Colors.pinkAccent.shade100,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                        ),
                        child: Row(
                          children: [
                            Text("Uh-oh! your plan has expired recharge now",style: TextStyle(color: Colors.pink),),
                            Spacer(),
                            Text("Reacharge",style: TextStyle(color: Colors.blue),)

                          ],
                        ),
                      )
                    ],
                  ),
                
              ),

              Positioned(
                  top: 320,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                      color:Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "App Exclusive Offer",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              Text(
                                "Applicable on recharges above Rs.249",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.blue.shade600,
                                ),
                              ),
                              Text(
                                "Check Now >>",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                              Text(
                                "T&C apply",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.blue.shade100,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "2",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 100,
                              color:Color(0xFFFA9334),
                          ),
                        ),
                        Text(
                          "% OFF",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue.shade800,
                          ),
                        ),


                      ],
                    ),
                  )
              ),

              Positioned(
                  top: 475,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 280,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Quick Actions",style: TextStyle(color: Colors.blue.shade800,fontSize: 20,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircularIconWithText(icon: Icons.home, text: "Home"),
                            CircularIconWithText(icon: Icons.favorite, text: "Favorite"),
                            CircularIconWithText(icon: Icons.settings, text: "Settings"),
                            CircularIconWithText(icon: Icons.settings, text: "Settings"),
                          ],
                        ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircularIconWithText(icon: Icons.home, text: "Home"),
                              CircularIconWithText(icon: Icons.favorite, text: "Favorite"),
                              CircularIconWithText(icon: Icons.settings, text: "Settings"),
                              CircularIconWithText(icon: Icons.settings, text: "Settings"),
                            ],
                          )

                        ],
                      ),
                    ),
                  )
              ),


            ],
          ),
        );
  }
}




class CircularIconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  const CircularIconWithText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60.0, // Fixed size
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100, // Fixed background color
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              icon, // Different icon per instance
              color: Colors.white, // Fixed icon color
              size: 30.0, // Adjust icon size
            ),
          ),
        ),
        const SizedBox(height: 8.0), // Spacing between circle and text
        Text(
          text,
          style: TextStyle(
            fontSize: 14.0, // Adjust text size
            //fontWeight: FontWeight.bold,
            color: Colors.black, // Text color
          ),
        ),
      ],
    );
  }
}


