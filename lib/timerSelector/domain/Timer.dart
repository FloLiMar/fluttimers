class Timer {
  int duration;

  Timer([this.duration = 0]);

  int getSeconds(){
    return duration%60;
  }

  int getMinutes(){
    return ((duration - duration%60)/60).round();
  }

  setMinutes(int minutes){
    duration = duration - getMinutes() * 60 + (minutes * 60);
  }

  setSeconds(int seconds){
    duration = duration - getSeconds() + seconds;
  }

  @override
  String toString() {
    final String minutes = getMinutes().toString().padLeft(2, '0');
    final String seconds = getSeconds().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
