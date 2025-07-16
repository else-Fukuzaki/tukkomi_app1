import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _audioPlayer = AudioPlayer();

  // String _text01 = 'おめでとうございます';
  // String _text02 = '合格です';
  // String _text03 = '良くできました';
  // String _text04 = '残念でした';
  // String _text05 = '不合格です';
  // String _text06 = '頑張りましょう';

  final List<String> _texts = [
    'おめでとうございます',
    '合格です',
    '良くできました',
    '残念でした',
    '不合格です',
    '頑張りましょう',
  ];

  final List<String> _soundPaths = [
    'assets/sounds/sound1.mp3',
    'assets/sounds/sound2.mp3',
    'assets/sounds/sound3.mp3',
    'assets/sounds/sound4.mp3',
    'assets/sounds/sound5.mp3',
    'assets/sounds/sound6.mp3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ツッコミマシーン"), centerTitle: true),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _soundButton(_texts[0], _soundPaths[0]),
                  ),
                  Expanded(child: _soundButton(_texts[1], _soundPaths[1])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _soundButton(_texts[2], _soundPaths[2]),
                  ),
                  Expanded(
                    flex: 1,
                    child: _soundButton(_texts[3], _soundPaths[3]),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _soundButton(_texts[4], _soundPaths[4]),
                  ),
                  Expanded(
                    flex: 1,
                    child: _soundButton(_texts[5], _soundPaths[5]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _soundButton(String displayText, String soundPath) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _playSound(soundPath),
        child: Text(displayText),
      ),
    );
  }

  _playSound(String soundPath) async {
    await _audioPlayer.setAsset(soundPath, initialPosition: Duration.zero);
    _audioPlayer.play();
  }
}
