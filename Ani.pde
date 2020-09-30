void ani() {
  //必ず最初にinit()を実行すること。

  Ani.init(this);


  //beginSequence()からendSequence()までを一連のアニメーションとして登録
  seq = new AniSequence(this);
  seq.beginSequence();

  // step 0
  seq.beginStep();
  seq.add(Ani.to(this, 2, "red_y", height/2, Ani.CIRC_OUT));
  seq.add(Ani.to(this, 2, "red_x",width/2, Ani.CIRC_OUT,"onEnd:Warp1"));
  // step 1 (一度に二つ以上のAni.to()を実行したいときはbiginStep()とendStep()で囲む)
  seq.endStep();
  
  /*seq.beginStep();
  seq.add(Ani.to(this, 2, "red_x", width/2*1, Ani.QUAD_OUT,"onStart:Shindou1"));
  //seq.add(Ani.to(this, 2, "blue_x", width/4*3, Ani.EXPO_IN_OUT, "onStart:showBlueBall"));
  seq.endStep();

  // step 2
  seq.beginStep();
  seq.add(Ani.to(this,2,"red_y",height/2*1,Ani.EXPO_IN_OUT,"onEnd:Henka1"));
  seq.endStep();

  // step 3
  seq.beginStep();
  seq.add(Ani.to(this, 2, "blue_x", width+ballSize/2, Ani.EXPO_IN_OUT));
  seq.add(Ani.to(this, 2, "blue_y:300", Ani.EXPO_IN_OUT, "onEnd:moveServo2"));
  seq.endStep();*/

  seq.endSequence();
}
