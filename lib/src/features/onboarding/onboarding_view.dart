import 'package:flutter/material.dart';
import 'package:cozo/src/features/onboarding/color.dart';
import 'package:cozo/src/features/onboarding/onboarding_items.dart';
import 'package:cozo/src/features/home/home_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' hide SlideEffect;

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: isLastPage? getStarted() : Padding(
          padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              //Indicator
              SmoothPageIndicator(
                textDirection: TextDirection.rtl,
                  controller: pageController,
                  count: controller.items.length,
                  onDotClicked: (index)=> pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
                  effect: const WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    activeDotColor: primaryColor,
                  ),
              ),
          
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          reverse: true,
            onPageChanged: (index)=> setState(()=> isLastPage = controller.items.length-1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context,index){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.items[index].image),
                  const SizedBox(height: 15),
                  Text(controller.items[index].title,textDirection:TextDirection.rtl,
                    style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                  const SizedBox(height: 15),
                  Text(controller.items[index].descriptions,textDirection:TextDirection.rtl,
                      style: const TextStyle(color: Colors.grey,fontSize: 17,), textAlign: TextAlign.center),
                ],
              );

        }),
      ),
    );
  }

  //Now the problem is when press get started button
  // after re run the app we see again the onboarding screen
  // so lets do one time onboarding

  //Get started button

 Widget getStarted(){
    return Animate(
      effects: [SlideEffect(duration: Duration(milliseconds: 1200)),
      FadeEffect()],
      child: Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: primaryColor
          ),
          width: MediaQuery.of(context).size.width * .9,
          height: 55,
          child: TextButton(
              onPressed: ()async{
                final pres = await SharedPreferences.getInstance();
                pres.setBool("onboarding", true);
        
                //After we press get started button this onboarding value become true
                // same key
                if(!mounted)return;

                Navigator.pushReplacement(context, PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) => Home(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        }
      )
      );
              },
              child: const Text("Get started",style: TextStyle(color: Colors.black),)),
        ),
      ),
    );
 }
}
