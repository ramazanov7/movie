// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/widgets/custom_horizontal_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 44, 44, 60),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Movie App', 
            style: TextStyle(
              color: Colors.amber,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // popular movies section
                Text(
                  'Popular Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 16,),
                CustomHorizontalSlider(),
                SizedBox(height: 32,),

                // trending movies section 
                Text(
                  'Trending movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 32,),
                

              ],
            ),
          ),
        )
      ),
    );
  }
}
