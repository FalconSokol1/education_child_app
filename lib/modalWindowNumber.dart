import 'package:education_child_app/lernWindowNumber.dart';
import 'package:education_child_app/lernWindowWord.dart';
import 'package:education_child_app/numberWindow.dart';
import 'package:education_child_app/wordWindow.dart';
import 'package:flutter/material.dart';

void createCenterNumberSheet(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            right: 20,
            left: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 120,width: 400,child: Stack(alignment: Alignment.center,children: [
                Container(height: 70,width: 390,decoration: BoxDecoration(color: const Color(0xFFC71A4F),borderRadius: BorderRadius.circular(20),boxShadow: [
                  BoxShadow(offset: Offset(0, 1),blurRadius: 5,spreadRadius: 3,color: const Color(0xFFC71A4F).withOpacity(.4),),],), child: Center(child: Text(
                  'Выбирай режим', textAlign: TextAlign.center, style: TextStyle( color: Colors.white, fontWeight:  FontWeight.bold, fontSize: 20,decoration: TextDecoration.none
                ),
                ),
                ),
                ),]),),
              FloatingActionButton.extended(
                heroTag: null,
                label: Text('Изучаем', style: TextStyle(fontSize: 40),),
                foregroundColor: Colors.white,// <-- Text
                backgroundColor: const Color(0xFFC71A4F),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnNumberWindow()));},
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton.extended(
                heroTag: null,
                label: Text('Играем',style: TextStyle(fontSize: 40),),
                foregroundColor: Colors.white,// <-- Text
                backgroundColor: const Color(0xFFC71A4F),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>NumberWindow()));},
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.door_front_door, color: const Color(0xFFC71A4F)),
                backgroundColor: Colors.white,
                tooltip: 'Выйти',
              )
            ],
          ),
        );
      });
}