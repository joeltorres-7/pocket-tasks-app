import 'dart:async';

import 'package:audio_session/audio_session.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  static AudioManager get instance => _instance;
  AudioManager._internal();

  static AudioPlayer audioPlayer = AudioPlayer();
  static late AudioSession session;
  static late bool enableSoundEffects;
  static final rxPrefs = RxSharedPreferences(SharedPreferences.getInstance());

  late StreamSubscription<bool> _subscription;

  void initializeSoundPreferences() {
    _subscription = rxPrefs
        .getBoolStream('enableSounds')
        !.where((value) => value != null)
        .cast<bool>()
        .listen((value) {
      enableSoundEffects = value;
      if (!value) {
        stop();
      }
    });
  }

  static Future<void> updatePreferences() async {
    await getSoundEffectsPreferences();
  }

  void cancelSoundPreferencesSubscription() {
    _subscription.cancel();
  }

  static Future<void> init() async {
    audioPlayer.setVolume(0.5);
    audioPlayer.setPlayerMode(PlayerMode.lowLatency);
    session = await AudioSession.instance;
    rxPrefs.getBoolStream('enableSounds').listen((bool? value) {
      if (value != null) {
        enableSoundEffects = value;
        if (!value) {
          stop();
        }
      }
    });
    await session.configure(const AudioSessionConfiguration.music());
    await getSoundEffectsPreferences();
  }

  static Future<void> getSoundEffectsPreferences() async {
    enableSoundEffects = await rxPrefs.getBool('enableSounds') ?? false;
  }

  static Future<void> play(String audioName) async {
    await requestAudioFocus();
    await audioPlayer.play(
        AssetSource('audio/$audioName')
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
