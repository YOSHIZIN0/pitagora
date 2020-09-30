class Henka {
  int r=1;
  int s;

  void gamen(){
    background(s, s, s);
    s += r;
    if (s>255) {
      r=-1;
    }
  }
}

void Henka1(){
 HenkaVisible = true; 
 warpVisible = false;
 ShindouVisible = false;
}
