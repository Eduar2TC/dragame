//Audio controler
// music package
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class Audio {
  AudioCache audioCache;
  AudioPlayer audioPlayer;

  String _musicBg = '';
  String _draggedSucces = '';
  String _succesGame = '';
  bool audioBgActivated = true;

  //String errorPath = null;
  Audio() {
    this.audioCache = new AudioCache(prefix: 'audio/');
    this.initializeAudio(
        'bg-music/bg.mp3', 'bg-music/clip.mp3', 'bg-music/trumpets.mp3');
    //preload music
    this
        .audioCache
        .loadAll([this._musicBg, this._draggedSucces, this._succesGame]);
    this.audioPlayer = new AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  }
  void initializeAudio(String music, String dragged, String success) {
    this._musicBg = music;
    this._draggedSucces = dragged;
    this._succesGame = success;
  }

  Future playBgMusic() async {
    //audioCache.play('assets/audio/bg-music/bg.mp3');
    //return audioPlayer = await audioCache.play('audio/bg-music/bg.mp3');
    //this.audioCache.loop(this._musicBg);
    this.audioPlayer = await audioCache.loop(this._musicBg);
  }

  void stopBgMusic() {
    this.audioPlayer?.stop();
  }

  void playDragged() {
    this.audioCache.play(this._draggedSucces);
  }

  Future playSuccess() async {
    this.audioCache.play(this._succesGame);
  }

  void playVoices(String path) {
    this.audioCache.play(path);
  }

  set setAudioBg(bool estado) {
    this.audioBgActivated = estado;
  }
}
