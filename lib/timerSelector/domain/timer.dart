
class Timer {
  int duration = 0;

  setMinutes(int minutes){
    duration = duration - getMinutes() * 60 + (minutes * 60);
  }

  setSeconds(int seconds){
    duration = duration - getSeconds() + seconds;
  }

  int getSeconds(){
    return duration%60;
  }

  int getMinutes(){
    return ((duration - duration%60)/60).round();
  }
}