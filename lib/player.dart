import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'buttons.dart';
import 'package:lottie/lottie.dart';
import 'fire_back.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer? _audioPlayer;


  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    CollectData().getData().then((data){
      List<AudioSource> MusicList = [];

      for(int i=0; i<data.length; i++){
        MusicList.add(AudioSource.uri(Uri.parse(data[i]['link'])));
      }
      _audioPlayer?.setAudioSource(
        ConcatenatingAudioSource(children: MusicList),
      );
    });


  }

  @override
  void dispose() {
    _audioPlayer?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("data/1.jpg"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 150),
                Container(
                  padding: EdgeInsets.all(25),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Lottie.asset('data/PC.json',),
                  ),
                ),
              ],
            ),

            PlayerButtons(_audioPlayer!),
          ],
        ),
      ),
    );
  }
}

