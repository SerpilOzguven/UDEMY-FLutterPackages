import 'dart:math';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatefulWidget {
  const PhotoViewPage({super.key});

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {

  PhotoViewController? photoViewController;
  PhotoViewScaleStateController? scaleStateController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    photoViewController = PhotoViewController(initialScale: 0.02);
    scaleStateController = PhotoViewScaleStateController();
  }

  @override
  void dispose() {
    photoViewController!.dispose();
    scaleStateController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo View'), backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: PhotoView(
              imageProvider: const NetworkImage('https://media.wired.com/photos/5fb70f2ce7b75db783b7012c/master/pass/Gear-Photos-597589287.jpg'),
              //minScale:PhotoViewComputedScale.contained * 0.8,
              maxScale:PhotoViewComputedScale.contained * 2,
              enableRotation:true,
              backgroundDecoration:const BoxDecoration(color: Colors.black),
              controller:photoViewController,
              //initialScale
              //initialScale: 0.02,
              scaleStateController: scaleStateController,
            ),
          ),
        StreamBuilder(
        stream:photoViewController!.outputStateStream,
        builder: (BuildContext context,AsyncSnapshot<PhotoViewControllerValue> snapshot){
          if(!snapshot.hasData) {
            return Container();
          } else {
            return Column(
              children: [
                Slider(
                  min: 0.03,
                  max: 0.6,
                  value: snapshot.data!.scale!.clamp(0.03, 0.6),
                  onChanged: (value){
                    photoViewController!.scale = value;
                  },),
                Slider(
                  min: -pi,
                  max: pi,
                  value: snapshot.data!.rotation.clamp(-pi, pi),
                  onChanged: (value){
                    photoViewController!.rotation = value;
                  },),
                ],
              );
            }
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                photoViewController!.scale = photoViewController!.initial.scale;
              }, child: Text('Reset Secale')),
              ElevatedButton(onPressed: (){
                photoViewController!.rotation = photoViewController!.initial.rotation;
              }, child: Text('Reset Rotation')),

            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
