// A simple Particle class

class Particle {
  PVector location;     // 座標
  PVector velocity;     // 速度
  PVector acceleration; // 加速度
  float lifespan;       // 寿命

  Particle(PVector l) {
    acceleration = new PVector(0,0.05);     // yに0.05の加速度！
    velocity = new PVector(random(-1,1),random(-2,0));  // randomは２つの引数の範囲内の値をランダムで返すよfloatという少数点以下の値も含む数値で返す。
    location = l.get(); // new Particle(new PVector(x, y))の　Pvectorが返ってきてるねー
    lifespan = 255.0;   // 255フレームの寿命。。processingは毎秒30フレームかな？60あったかも。
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);   // 速度に加速度追加
    location.add(velocity);       // 座標に速度追加
    lifespan -= 1.0;              // 死に近づく
  }

  // Method to display
  void display() {
    stroke(255,lifespan);     // 線。透明度の値にlifespan入れてるから255が不透明度100%でだんだん透明になってくねー
    fill(255,lifespan);       // 塗り。同上。
    ellipse(location.x,location.y,8,8);   // ↑の線&塗りで円を書きます。
  }

  // Is the particle still useful?
  // 死んでる？
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;  // 死んでるー死んでるー
    } else {
      return false; // 生きてるわー
    }
  }
}
