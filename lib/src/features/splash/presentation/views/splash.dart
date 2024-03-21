//import 'package:cozo/src/features/home/home_screen.dart';
import 'package:cozo/src/features/onboarding/onboarding_view.dart';
import 'package:cozo/src/features/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  final bool onboarding;
  SplashScreen({super.key,this.onboarding=false});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
@override

 /* void initState(){
           WidgetsFlutterBinding.ensureInitialized();
   final prefs = await SharedPreferences.getInstance();
   final onboarding = prefs.getBool("onboarding")??false;
    // TODO: implement initState
    super.initState();
    Duration(seconds: 5);

   onboarding? Home():OnboardingView();

  }*/
  @override
   
   void dispose() async{
    // TODO: implement dispose
    super.dispose();
      WidgetsFlutterBinding.ensureInitialized();
   final prefs = await SharedPreferences.getInstance();
   final onboarding = prefs.getBool("onboarding")??false;
   
   onboarding? Navigator.push(context,MaterialPageRoute(builder:(BuildContext context) => OnboardingView())):Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>OnboardingView()));
   
  }
  @override
  Widget build(BuildContext context) {
      Animate animate({required Offset begin,required Offset end,required Widget chid,required int time,Effect? effect,int? fadetime,int? delaytime,Function(AnimationController)? oncomplete}){
    return Animate(
              effects: [
                SlideEffect(
                  delay: Duration(milliseconds: delaytime!),
                  duration: Duration(seconds: time),
                  begin: begin,
                  end: end,
                ),
                effect!,
                FadeEffect(duration:Duration(milliseconds:fadetime!)),
              ],
              child:chid,
              onComplete:oncomplete,
            );
  }
    // TODO: implement build
    return Scaffold(
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            animate(begin: const Offset(3.2,0.0),end: const Offset(0.40,0.0),chid: const Text(
                'C',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold),
              ),time:2,effect:const Effect(),fadetime: 600,delaytime:2000,),
            
            animate(begin: const Offset(2.1,0.0),end: const Offset(0.4,0.0),chid: const Text(
                'O',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold),
              ),time:2,effect:const Effect(),fadetime: 600,delaytime:2000,),
            animate(begin: const Offset(1.0,0.0),end: const Offset(2.5,0.0),chid: const Text(
                'O',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold),
              ),time:2,effect:const Effect(),fadetime: 600,delaytime:2000,oncomplete:  (controller) async{ 
                dispose();
                }),
            Container(
                transformAlignment: const Alignment(-1.7, 0),
                width: 60.0,
                height: 100.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.black),),
                animate(begin:const Offset(-1.0,7.0),end:const Offset(-1.0,0.0),chid:Image.asset('assets/images/logo.png',width: 80.0,height: 80.0,),time:1,effect: const AlignEffect(),fadetime:500,delaytime: 0,),
              
          ],
        ),
    );
  }
}
//

