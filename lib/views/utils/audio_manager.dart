import 'dart:developer';

import 'package:audio_session/audio_session.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioManager {
  static AudioPlayer audioPlayer = AudioPlayer();
  static late AudioSession session;
  static late bool enableSoundEffects;

  static Future<void> init() async {
    audioPlayer.setVolume(0.5);
    audioPlayer.setPlayerMode(PlayerMode.lowLatency);
    session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    await getSoundEffectsPreferences();
  }

  static Future<void> getSoundEffectsPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    enableSoundEffects = prefs.getBool('enableSounds') ?? false;
  }

  static Future<void> play(String audioName) async {
    await requestAudioFocus();
    await audioPlayer.play(
        AssetSource('audio/$audioName.wav')
    );
  }

  static Future<void> playFromName(String audioName) async {
    if (enableSoundEffects) {
      try {
        if (audioPlayer.state == PlayerState.playing) {
          await stop();
        }
      
        await play(audioName);
      } catch (e) {
        await play(audioName);
      }
    }
  }

  static Future<void> stop() async {
    await audioPlayer.stop();
    await _releaseAudioFocus();
  }

  static Future<void> requestAudioFocus() async {
    try {
      await session.setActive(true);
    } catch (e) {
      print('Error requesting audio focus: $e');
    }
  }

  static Future<void> _releaseAudioFocus() async {
    try {
      await session.setActive(false);
    } catch (e) {
      print('Error releasing audio focus: $e');
    }
  }
}
