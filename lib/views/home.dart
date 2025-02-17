import 'package:flutter/material.dart';
import 'package:sourates/style/style.dart';
import 'package:sourates/views/listes_duas.dart';
import 'package:sourates/views/qari_list_screen.dart';
import 'package:sourates/views/sourate_day.dart';
import 'package:sourates/views/surah_view.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: greenColor,
        ),
        title: Text(
          "Sourates+",
          style: titleGreenStyle(),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: blueColor,
            backgroundImage: const AssetImage(
              "assets/icons/moon.png",
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: height * .01),
                  child: Center(
                    child: Image(
                      image: const AssetImage('assets/icons/logo.png'),
                      width: width * .2,
                    ),
                  )),
              LastReadWidget(height: height, width: width),
              Dashboard(height: height)
            ],
          ),
        ),
      ),
    );
  }
}
class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Column(
            children: [
              CustomContainer(
                  height1: height * .27,
                  image: 'assets/icons/quran.png',
                  title: "Al-Quran audio",
                  color: greenColor,
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>QariListScreen
                    ()));
                  }),
              CustomContainer(
                  height1: height * .20,
                  image: 'assets/icons/bookmark.png',
                  title: "Hadith",
                  color: purpleColor,
                  onpressed: () {}),
              //CustomContainer(height1: height*.28, width1: width*.4)
            ],
          ),
        ),
        Spacer(),
        SizedBox(
          child: Column(
            children: [
              CustomContainer(
                height1: height * .2,
                image: 'assets/icons/prayer.png',
                title: "Duas",
                color: redColor,
                onpressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ListesDuas()));
                },
              ),
              CustomContainer(
                  height1: height * .27,
                  image: 'assets/icons/quran.png',
                  title: "Al-Quran lecture",
                  color: blueColor,
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SurahView()));
                  }),

              //CustomContainer(height1: height*.28, width1: width*.4)
            ],
          ),
        )
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.height1,
      required this.image,
      required this.title,
      required this.color,
      this.onpressed});

  final double height1;
  final String image;
  final String title;
  final Function? onpressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: width * .06),
      child: GestureDetector(
        onTap: onpressed as void Function()?,
        child: Container(
          height: height1,
          width: width * .4,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(1.5, 3), // changes position of shadow
                ),
              ],
              image: const DecorationImage(
                  image: AssetImage('assets/icons/dashboard.png'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(25)),
          child: Container(
            decoration: BoxDecoration(
                color: color.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * .02,
                horizontal: width * .02,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(image),
                    width: width * .15,
                    height: height * .07,
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: width * .02),
                    child: Text(title, style: titleStyle()),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * .02),
                    child: GotoWidget(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LastReadWidget extends StatelessWidget {
  const LastReadWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SourateDay()),
      );
      },
      child: Container(
      height: height * .15,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(1.5, 3), // changes position of shadow
          ),
        ],
        image: DecorationImage(
          image: AssetImage('assets/icons/dashboard.png'),
          fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(25)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
          primaryColor.withOpacity(0.7),
          secondaryColor.withOpacity(0.7)
          ]),
          borderRadius: BorderRadius.circular(25)),
        child: Row(children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .03, vertical: height * .02),
          child: SizedBox(
            width: width * .4,
            child: ListTile(
            title: Text(
            "Sourate du jour",
            style: titleStyle(),
            ),
            subtitle: Text(
            'Click moi',
            style: subtitleStyle(),
            ),
            ),
          )),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(right: width * .04),
          child: SizedBox(
          height: height * .15,
          width: width * .3,
          child: Image.asset(
            'assets/icons/lamp.png',
            fit: BoxFit.fill,
          ),
          ),
        )
        ]),
      ),
      ),
    );
  }
}

class GotoWidget extends StatelessWidget {
  final VoidCallback? onpressed;
  const GotoWidget({super.key, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Voir', style: miniStyle()),
        SizedBox(
          width: 7,
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 13,
        )
      ],
    );
  }
}