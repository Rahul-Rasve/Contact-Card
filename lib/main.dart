// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations, empty_catches

import 'package:contact_me/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(ContactMeApp());
}

class ContactMeApp extends StatelessWidget {
  const ContactMeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[900],
        body: SafeArea(
          child: ContactCard(),
        ),
      ),
    );
  }
}

class ContactCard extends StatefulWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  void openUrl() {}

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: AnimationConfiguration.toStaggeredList(
          duration: Duration(milliseconds: 1500),
          childAnimationBuilder: (Column) => SlideAnimation(
            horizontalOffset: 200.0,
            child: FadeInAnimation(
              child: Column,
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('images/rahul_image.jpeg'),
              ),
            ),
            Text(
              'Rahul Rasve',
              style: TextStyle(
                fontFamily: 'Solitreo',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: 50.0,
              ),
            ),
            Divider(
              height: 30.0,
              thickness: 2.5,
              color: Colors.teal[800],
              indent: 60.0,
              endIndent: 60.0,
            ),
            Card(
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 15.0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: ListTile(
                  onTap: () async {
                    final url = 'tel: 1234567890';
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    }
                  },
                  leading: Icon(
                    Icons.phone,
                    size: 35.0,
                    color: Colors.blue,
                  ),
                  title: Text(
                    '+91 (12345) 67890',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  horizontalTitleGap: 30.0,
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: ListTile(
                  onTap: () async {
                    final url = 'mailto:rahul@gmail.com';
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    }
                  },
                  leading: Icon(
                    Icons.email,
                    size: 35.0,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'rahul@gmail.com',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  horizontalTitleGap: 15.0,
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 30.0,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: ListTile(
                  onTap: () async {
                    final url = 'https://www.instagram.com/rahul_rasve_712/';
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    }
                  },
                  leading: Icon(
                    CustomIcons.instagram,
                    size: 35.0,
                    color: Colors.blue,
                  ),
                  title: Text(
                    '@rahul_rasve_712',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  horizontalTitleGap: 30.0,
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: ListTile(
                  onTap: () async {
                    final url = 'https://www.linkedin.com/in/rahulrasve/';
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    }
                  },
                  leading: Icon(
                    CustomIcons.linkedin_circled,
                    size: 37.0,
                    color: Colors.blue,
                  ),
                  title: Text(
                    '@rahulrasve',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  horizontalTitleGap: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
