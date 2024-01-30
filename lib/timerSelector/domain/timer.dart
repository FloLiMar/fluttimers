
class Timer {
  int duration = 0;

  addMinutes(int minutes){
    duration = duration + (minutes * 60);
  }

  addSeconds(int seconds){
    duration = duration + seconds;
  }

  int getSeconds(){
    return duration%60;
  }

  int getMinutes(){
    return ((duration - duration%60)/60).round();
  }
}