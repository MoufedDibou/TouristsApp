import 'package:flutter/material.dart';
import 'package:tourists_guide/Constants/colors.dart';
import 'package:tourists_guide/widgets/app_large_text.dart';
import 'package:tourists_guide/widgets/app_text.dart';
import 'package:tourists_guide/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({required String title});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images=[
    'tour1.jpg',
    'tour2.jpg',
    'tour3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_,index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/"+images[index]) ,
                fit: BoxFit.cover
                )
            ),

            child: Container(
              margin: const EdgeInsets.only
              (top: 150,
              left: 20,
              right: 20),
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: "Trips"),
                    AppText(text: "Mountain",size: 30,),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 250,
                      child: AppText(
                        text:"Mountain hikes give you an incredible sense of freedom along with endurance test" ,
                        color: AppColors.TextColor2,
                        size: 14,
                      )
                    ),
                    const SizedBox(height: 20,),
                    ResponsiveButton(width: 120,)
                  ],
                ),
                Column(
                  children:List.generate(3, (indexDots){
                    return Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index == indexDots ? 25 : 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots ?AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                      ),
                    );
                  }) 

                )
              ],),
              ),
          );

        }),);
  }
}