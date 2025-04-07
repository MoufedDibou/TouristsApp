import 'package:flutter/material.dart';
import 'package:tourists_guide/Constants/colors.dart';
import 'package:tourists_guide/widgets/app_large_text.dart';
import 'package:tourists_guide/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var images ={
    "tour6.jpg":"Mountain",
    "tour7.jpg":"Snow",
    "tour8.jpg":"River",
    "tour9.jpg":"beach",
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50,left: 20),
            child: Row(
              children: [
                const Icon(Icons.menu,size: 30,color: Colors.black,),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20 ),
                child: AppLargeText(text: "Discover",size: 22,),
              ),
            ],
          ),
          const SizedBox(height: 20),
          //tabbar 

          Container(
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20,right: 20),
                controller: tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.TextColor1,radius: 4),
                tabs: const [
                 Text("Places"),
                  Text("Inspiration"),
                   Text("Emotions"),
              ]
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabController,
              children: [
               ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: const EdgeInsets.only(right: 15,top: 10),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: const DecorationImage(
                      image: AssetImage("images/tour4.jpg"),
                      fit: BoxFit.cover
                      )
                  ),
                );
               }),
               const Text("There"),
               const Text("World")
            ]),
          ),
           const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore",size: 22,),
                AppText(text: "See All",color: AppColors.TextColor1,)
              ],
            ),
          ),
           const SizedBox(height: 10),
           Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,index){
               return Container(
                margin: const EdgeInsets.only(right: 30),
                 child: Column(
                  children: [
                  Container(
                               //    margin: const EdgeInsets.only(right: 30),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("images/"+images.keys.elementAt(index)),
                        fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: AppText(text: images.values.elementAt(index),color: AppColors.TextColor2,),
                  )
                  ],
                 ),
               );
            }
            ),
           )

        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{

  final Color color;
  double radius;

  CircleTabIndicator({required this.color,required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
   
   return _CirclePainter(color: color,radius: radius);
  }
  
}


class _CirclePainter extends BoxPainter{

   final Color color;
  double radius;

  _CirclePainter({required this.color,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset,
   ImageConfiguration configuration) {

  Paint paint= Paint();
  paint.color=color;
  paint.isAntiAlias=true;
  final Offset circleOffset = Offset(configuration.size!.width/2 -radius/2, configuration.size!.height -radius);
    canvas.drawCircle(offset+circleOffset , radius, paint);
  }
  
}