import 'package:flutter/material.dart';
import 'package:pdpui3/pages/homepage.dart';
import 'package:pdpui3/utels/Strings.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
static final String id = "IntroPage";
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  late PageController _pageController;
  int covariantIndex = 0;

  @override
  void initState() {
    _pageController =PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page){
              setState(() {
                covariantIndex = page;
              });
            },
            children: [
              makePage(
                image: "asset/images/ic1.jpg",
                title: Strings.stipOneTitle,
                content: Strings.stipOneContent,
              ),
              makePage(
                image: "asset/images/ic2.jpg",
                title: Strings.stipTwoTitle,
                content: Strings.stipTwoContent,
              ),
              makePage(
                image: "asset/images/ic3.jpg",
                title: Strings.stipThreeTitle,
                content: Strings.stipThreeContent,

              )

            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndecator(),
              ),


            ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            covariantIndex == 2
                ? Container(
              margin: const EdgeInsets.only(bottom: 40, right: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, HomePage.id);
                },
                child: const Text(
                  "skip",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
                : Container(),
          ],

        )


        ],

      ),
    );
  }

  Widget makePage({image, title, content, }){
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: (
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(title, style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),),
              Text(content, style: TextStyle(color: Colors.grey, fontSize: 20), textAlign: TextAlign.center,),



              Padding(

                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),

            ],
          ),
        ],
      )
      ),
    );
  }

  Widget _indecator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30:6,

      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndecator(){
    List<Widget> indecator = [];
     for(int i= 0; i<3; i++ ){
        if (covariantIndex == i){
          indecator.add(_indecator(true));
        }
          else {
            indecator.add(_indecator(false));
        }
     }
     return indecator;

  }
}


