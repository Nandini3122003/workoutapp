import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:workoutapp/videoinfo.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List info=[];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
    setState(() {
      info=json.decode(value);
    });

    });
  }
  @override
  void initState(){
    super.initState();
    _initData();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body:Container(//huge container
        padding: const EdgeInsets.only(top:20,left:30,right: 30),
        child: Column(
          children: [
            Row( // training and 3 icons
              children: [
                Text('Training',
                    style:TextStyle(
                      fontSize: 31,
                      color:color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w700,
                    )),
                Expanded(child: Container()),
                Icon(Icons.arrow_back_ios,
                size:20,
                color:color.AppColor.homePageIcons),
                SizedBox(width: 10,),
                Icon(Icons.calendar_today_outlined,
                size:20,
                color:color.AppColor.homePageIcons),
                SizedBox(width: 10,),
                Icon(Icons.arrow_forward_ios,
                size:20,
                color: color.AppColor.homePageIcons,),
              ],
            ),
            SizedBox(height: 30,),
            Row(// your program,details and arrow
              children: [
                Text('Your program',
                style:TextStyle(
                  fontSize: 20,
                  color:color.AppColor.homePageSubtitle,
                  fontWeight:FontWeight.w700,
                )),
                Expanded(child: Container()),
                Text('Details',
                style:TextStyle(
                  fontSize: 20,
                  color: color.AppColor.homePageDetail,

                )),
                SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    Get.to(()=>VideoInfo());
                  },
                  child: Icon(Icons.arrow_forward,
                  size:20,
                  color:color.AppColor.homePageIcons),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Container(//blue gradient container
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:[
                    color.AppColor.gradientFirst.withOpacity(0.8),
                    color.AppColor.gradientSecond.withOpacity(0.9),
                  ],
                  begin:Alignment.bottomLeft,
                  end:Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(10),
                  bottomLeft:Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),


                ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5,10),
                      blurRadius: 20,
                      color: color.AppColor.gradientSecond.withOpacity(0.2)
                    )
                  ]


              ),
              child: Container(//container inside blue container
                padding: const EdgeInsets.only(left:20,top:25,right:20 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Next workout',
                    style:TextStyle(
                      fontSize: 16,
                      color:color.AppColor.homePageContainerTextSmall,
                    )),
                    Text('Legs Toning',
                        style:TextStyle(
                          fontSize: 25,
                          color:color.AppColor.homePageContainerTextSmall,
                        )),
                    Text('and Glutes Workout',
                        style:TextStyle(
                          fontSize: 25,
                          color:color.AppColor.homePageContainerTextSmall,
                        )),
                    SizedBox(height: 25,),
                    Row( //play button
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Row( // 60min timer

                          children: [
                            Icon(Icons.timer,size:20,color:color.AppColor.homePageContainerTextSmall),
                            SizedBox(width: 10,),
                            Text('60 min',
                                style:TextStyle(
                                  fontSize: 14,
                                  color:color.AppColor.homePageContainerTextSmall,
                                )),

                          ],
                        ),
                        Expanded(child: Container()),
                        Container(// play button container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color:color.AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: Offset(4,8),
                              )
                            ]
                          ),
                          child: Icon(Icons.play_circle_fill,
                            color:Colors.white,size:60,),
                        )

                      ],
                    )

                  ],
                ),
              ),

            ),
           SizedBox(height: 5,),
           Container(// new container
             height: 180,
             width: MediaQuery.of(context).size.width,
             child:Stack( //for images
               children: [
                 Container(
                   margin:const EdgeInsets.only(top:30),
                   width: MediaQuery.of(context).size.width,
                   height: 120,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     image: DecorationImage(
                       image:AssetImage(
                         "assets/card.jpg"
                       ),
                       fit:BoxFit.fill
                     ),
                     boxShadow: [
                       BoxShadow(
                         blurRadius: 40,
                         offset: Offset(8,10),
                         color:color.AppColor.gradientSecond.withOpacity(0.3),
                       ),
                       BoxShadow(
                         blurRadius: 20,
                         offset: Offset(-1,-5),
                         color:color.AppColor.gradientSecond.withOpacity(0.3),
                       )
                     ]

                   ),

                 ),
                 Container(
                   height: 200,
                     width: MediaQuery.of(context).size.width,
                     margin:const EdgeInsets.only(right:200,bottom:30),
                     decoration: BoxDecoration(
                         //color:Colors.redAccent.withOpacity(0.2),
                       borderRadius: BorderRadius.circular(20),
                       image: DecorationImage(

                           image:AssetImage
                             (
                             "assets/figure.png"
                           )
                       )
                     ),
                 ),
                 Container(
                   width: double.maxFinite,
                   height: 100,

                   margin:const EdgeInsets.only(top:50,left:150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('You are doing great',
                          style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                           color:color.AppColor.homePageDetail
                          ),),
                      SizedBox(height: 10,),
                      RichText(text: TextSpan(
                        text:"Keep it up\n",
                        style: TextStyle(
                          color:color.AppColor.homePagePlanColor,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                          text:"stick to your plan",
                          )
                        ]

                      ))
                    ],
                  ),

                 )
             ],
             ),


           ),
            Row(
              children: [
                Text("Area of focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color:color.AppColor.homePageTitle
                  ),
                    )
              ],
            ),
           Expanded(child:OverflowBox(
             maxWidth: MediaQuery.of(context).size.width,
             child: MediaQuery.removePadding(
               removeTop: true,
               context:context,
               child: ListView.builder(
                 itemCount: (info.length.toDouble()/2).toInt(),
                   itemBuilder: (_,i){
                   int a=2*i;
                   int b=2*i+1;
                     return Row(
                       children: [
                         Container(
                           height: 170,
                           width: (MediaQuery.of(context).size.width-90)/2,
                           margin:EdgeInsets.only(left:30,bottom: 15,top:15) ,
                           padding: const EdgeInsets.only(bottom: 5),
                           decoration: BoxDecoration(
                             color:Colors.white,
                             borderRadius: BorderRadius.circular(15),
                             image: DecorationImage(
                                 image: AssetImage(
                                     info[a]['img']
                                 )
                             ),
                             boxShadow: [
                               BoxShadow(
                                 blurRadius: 3,
                                 offset: Offset(5,5),
                                 color:color.AppColor.gradientSecond.withOpacity(0.1)
                               ),
                               BoxShadow(
                                   blurRadius: 3,
                                   offset: Offset(-5,-5),
                                   color:color.AppColor.gradientSecond.withOpacity(0.1)
                               ),
                             ]
                           ),
                           child: Center(
                             child:Align(
                               alignment: Alignment.bottomCenter,
                               child: Text(
                               info[a]["title"],
                               style: TextStyle(
                                 fontSize: 20,
                                 color: color.AppColor.homePageDetail,
                               ),),
                             )
                           ),
               
                         ),
                         Container(
                           height: 170,
                           width: (MediaQuery.of(context).size.width-90)/2,
                           margin:EdgeInsets.only(left:30,bottom:15,top:15),
                           padding: const EdgeInsets.only(bottom: 5),
                           decoration: BoxDecoration(
                               color:Colors.white,
                               borderRadius: BorderRadius.circular(15),
                               image: DecorationImage(
                                   image: AssetImage(
                                       info[b]['img']
                                   )
                               ),
                               boxShadow: [
                                 BoxShadow(
                                     blurRadius: 3,
                                     offset: Offset(5,5),
                                     color:color.AppColor.gradientSecond.withOpacity(0.1)
                                 ),
                                 BoxShadow(
                                     blurRadius: 3,
                                     offset: Offset(-5,-5),
                                     color:color.AppColor.gradientSecond.withOpacity(0.1)
                                 ),
                               ]
                           ),
                           child: Center(
                               child:Align(
                                 alignment: Alignment.bottomCenter,
                                 child: Text(
                                   info[b]["title"],
                                   style: TextStyle(
                                     fontSize: 20,
                                     color: color.AppColor.homePageDetail,
                                   ),),
                               )
                           ),
               
                         ),
                       ],
               
                     );
               
                   }),
             ),
           )
           )

          ],
        ),
      )

    );
  }
}