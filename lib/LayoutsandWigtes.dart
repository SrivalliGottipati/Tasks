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
                      Color(0xFFFA9334), // Corrected Orange Color
                      Colors.white,      // White at the bottom
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.01, 1.0],
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
                  right: 10,
                  child: Container(
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
                              height: 30,
                              width: 80,
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
                              height: 30,
                              width: 80,
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
                
              )),

              // Positioned(
              //     child:
              // )
            ],
          ),
        );
  }
}
