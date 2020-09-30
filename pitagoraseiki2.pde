
import processing.serial.*;
import de.looksgood.ani.*;

//アニメーションを行うオブジェクト
AniSequence seq;

//描画される円に関する変数
boolean redBallVisible, blueBallVisible, warpVisible, ShindouVisible, HenkaVisible;
int ballSize = 80;
float red_x, red_y;
float blue_x, blue_y;

//class
Warp wa;
Henka He;
Warp[] warp = new Warp[800];
void setup() {  
  //描画の基本設定
  fullScreen(); //発表はフルスクリーンで行うこと
  background(0);
  //Warp動作
  for (int i = 0; i< warp.length; i++) {
    warp[i] = new Warp();
  }
  noStroke();
  smooth();
  ellipseMode(CENTER);




  He = new Henka();
  //描画する円の初期化
  redBallVisible = true;
  blueBallVisible = false;
  warpVisible = false;
  ShindouVisible = false;
  HenkaVisible = false;
  red_x = width/4;
  red_y = -ballSize/2;
  blue_x = width/2;
  blue_y = height-ballSize/2;
  
  int time1=2000;
  int time2=7000;
  int time3=10000;
  int time4=13000;
  int time5=16000;
  //Arduino設定
  /*if(arduinoOn){
   printArray(Serial.list()); // 使用可能なシリアルポート一覧の出力。デバッグ用
   String portName = Serial.list()[0]; // 使用するシリアルポート名
   serialPort = new Serial(this, portName, 9600);
   serialPort.buffer(inByte.length); // 読み込むバッファの長さをの指定
   initServo();
   }*/

  //ani関数開始
  ani();
}



void draw() { 
  // 初期描画
  background(0);
  fill(0);

  //円を描画
  //xとyはAni.to()によって変化する
  if (blueBallVisible) {
    fill(0, 0, 255);
    ellipse(blue_x, blue_y, ballSize, ballSize);
  }
  if (redBallVisible) {
    fill(255, 0, 0);
    ellipse(red_x, red_y, ballSize, ballSize);
  }
  if (warpVisible) {
    translate(width/2, height/2);
    for (int i = 0; i< warp.length; i++) {
      warp[i].update();
      warp[i].show();
    }
  }
  if (ShindouVisible) {
    Shindou();
  }
  if (HenkaVisible) {
    He.gamen();
  }
  


  /*if(arduinoOn){
   text("oval1: "+oval1, 10, 20); // デバッグ用。発表時には非表示にすること
   text("oval2: "+oval2, 10, 40); // デバッグ用。発表時には非表示にすること
   }*/
  /*background(0);
   translate(width/2, height/2);
   for (int i = 0; i< warp.length; i++) {
   warp[i].update();
   warp[i].show();
   }*/
}

//Step1開始時に呼び出される。
//青いボールを出現させる。
void showBlueBall() {
  blueBallVisible = true;
}


/*---------------------
 
 以下、Arduino関連
 
 ----------------------
 
 boolean arduinoOn = false; //Arduinoを使用するときはtrueにする。
 
 Serial serialPort;  // Arduinoにデータを送るシリアルポート
 boolean firstContact = false;  //Arduinoからのはじめの送信を確認する
 byte[] inByte = new byte[3]; // 受信データ用バッファ
 
 int oval1; // サーボ1用変数
 int oval2; // サーボ2用変数
 
 //サーボの位置を初期化
 void initServo(){
 oval1 = oval2 = 20;
 sendToServo(1, oval1); //ゲートを閉じる
 sendToServo(2, oval2); //ゲートを閉じる 
 }
 
 // シリアルポートにデータが受信されると呼び出されるメソッド
 void serialEvent(Serial port) {
 inByte = port.readBytes();
 
 if(firstContact == false) {
 if(inByte[0] == 'C') {
 println("connect!");
 port.clear();
 firstContact = true;
 initServo();
 }
 }
 }
 
 // シリアルポートにサーボの値を送るメソッド
 void sendToServo(int id, int value){
 if(!firstContact) return;
 int v = value;
 if(v < 15) v = 15; // サーボの最小値。個体差による。
 if(v > 125) v = 125; // サーボの最大値。個体差による。
 serialPort.write((byte)'S');
 serialPort.write((byte)id);
 serialPort.write((byte)v);
 }
 
 //Step2終了時に呼び出される。
 //サーボ1を動かす
 void moveServo1(){
 if(arduinoOn){
 oval1 = 120;
 sendToServo(1, oval1);
 }
 }
 
 //Step3終了時に呼び出される。
 //サーボ2を動かす
 void moveServo2(){
 if(arduinoOn){
 oval2 = 120;
 sendToServo(2, oval2);
 }
 }
 
 */
