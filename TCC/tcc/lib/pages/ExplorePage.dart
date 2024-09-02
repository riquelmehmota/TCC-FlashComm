import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key});
  @override
  Widget build(BuildContext context) {
    //explore in web page
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[900],
                  
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.compass, size: 100, color: Colors.blue,),
                      Text('Explore novos decks na web!', style: TextStyle(fontSize: 24, color: Colors.white),)
                    ],
                  ),
                ),
              ),
            )
          ),
          Text("OU", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white),),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[900]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.add, size: 100, color: Colors.red,),
                      Text('Crie um novo deck!', style: TextStyle(fontSize: 24, color: Colors.white),)
                    ],
                  )
                ),
              ),
            )
          )
        ],
      )
    );
  }
}