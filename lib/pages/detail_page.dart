import 'package:flutter/material.dart';
import 'package:tourists_guide/Constants/colors.dart';
import 'package:tourists_guide/widgets/app_button.dart';
import 'package:tourists_guide/widgets/app_large_text.dart';
import 'package:tourists_guide/widgets/app_text.dart';
import 'package:tourists_guide/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
int evalution =4;
int selectedIndex=-1;
 
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [

               Positioned(
              left: 0,
              top: 0,
              width: size.width,
                height: 300,
              child: Container(
               width: size.width,
                height: 250,
               // child: Image(image:  AssetImage("images/tour4.jpg"),fit: BoxFit.cover,),
                decoration: BoxDecoration(
                  image:  DecorationImage(image: AssetImage("images/tour4.jpg"),
                  fit: BoxFit.cover
                  ) 
                ),
              )
              
              ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
              children: [
                IconButton(
                  onPressed: (){},
                 icon: Icon(Icons.menu,size: 40,)
                 
                 ),

                 SizedBox(width: 200,),
                 IconButton(onPressed: (){}, icon: Icon(Icons.donut_small,size: 40))
              ],
            )
            ),

            Positioned(
              top: 280,
              child: Container(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                width: size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)
                  )
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Yosemite",color: Colors.black.withOpacity(0.8),),
                        AppLargeText(text: "\$ 250",color: AppColors.mainColor,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on,color: AppColors.mainColor,),
                        SizedBox(width: 5,),
                        AppText(text: "Syria , Damascus",color: AppColors.TextColor1,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(
                          children: 
                            List.generate(5, (index){
                              return Icon(Icons.star,color: index< evalution ? Colors.yellow : Colors.grey,) ;
                            })
                          ,
                        ),
                         SizedBox(width: 10,),
                        AppText(text: "(4.0)",color: AppColors.TextColor2,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    AppLargeText(text: "People",color: Colors.black.withOpacity(0.8),size: 20,),
                    SizedBox(height: 10,),
                    AppText(text: "Number of people in your group",color: AppColors.mainColor,),
                    SizedBox(height: 10,),
                    Wrap(
                      children: List.generate(5, (index){
                        return InkWell(
                          onTap: (){
                             setState(() {
                               selectedIndex=index;
                             });
                          },
                          child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: AppButton(
                            color: selectedIndex==index ? Colors.white : Colors.black,
                         backgroundColor: selectedIndex==index ? Colors.black : Colors.white,
                          size:50,
                          text: (index+1).toString(),
                           borderColor: Colors.white)
                           )
                           );
                      }),
                    ),
                    SizedBox(height: 10,),
                    AppLargeText(text: "Description",color: Colors.black.withOpacity(0.8),size: 20,),
                     SizedBox(height: 10,),
                     AppText(text: "Travel to charge your energy and soul, Communicate with nature to feel the pleasure you want, discover every new thing",
                     color: AppColors.mainColor,
                     size: 15,),
                     SizedBox(height: 20,),

                  ],
                ),
                 
            )
            ),

            Positioned(
              bottom:20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButton(color: AppColors.TextColor1,
                   backgroundColor: Colors.white,
                    size: 60, borderColor: AppColors.TextColor1,
                    isIcon: true,
                    icon:Icons.favorite_border
                    ),
                    SizedBox(width: 20,),

                    ResponsiveButton(isResponsive: true,)
                ],)
                
                )
         
          ],
        ),
      ),
    );
  }
}