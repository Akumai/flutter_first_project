import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

final audioFiles = <Uri>[
  Uri.parse("https://www.myinstants.com/media/sounds/leroy.swf.mp3"),
  Uri.parse(
      "https://predanie.ru/download/uploads/ftp/kuraev-andrey-protod/lekcii-1/lekcii-chast-pervaya/01-hristianstvo.mp3"),
];

class SoundPage extends StatefulWidget {
  @override
  _SoundState createState() => _SoundState();
}

class _SoundState extends State<SoundPage> {
  final AudioPlayer _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Вопросики?"),
      ),
      body: Column(
        children: [
          _PlayerButton(_player, audioFiles[0]),
          _PlayerButton(_player, audioFiles[1]),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}

class _PlayerButton extends StatelessWidget {
  final Uri _audioFile;

  final AudioPlayer _player;

  const _PlayerButton(this._player, this._audioFile, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder<PlayerState>(
          stream: _player.playerStateStream,
          builder: (_, snapshot) {
            return _playPauseButton(
                snapshot.data?.processingState ?? ProcessingState.ready);
          },
        ),
        Expanded(child: Container())
      ],
    );
  }

  Widget _playPauseButton(ProcessingState processingState) {
    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      return Container(
        margin: EdgeInsets.all(8.0),
        width: 40.0,
        height: 40.0,
        child: CircularProgressIndicator(),
      );
    } else if (_player.playing &&
        processingState != ProcessingState.completed) {
      return IconButton(
        icon: Icon(Icons.pause),
        iconSize: 40.0,
        onPressed: _player.pause,
      );
    } else {
      return IconButton(
        icon: Icon(Icons.play_arrow),
        iconSize: 40.0,
        onPressed: () {
          _player
              .setAudioSource(AudioSource.uri(_audioFile))
              .catchError((error) {
            print("An error occured $error");
          });
          _player.play();
        },
      );
    }
  }
}
