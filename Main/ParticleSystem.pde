// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles

// クラスは↓の用に宣言してnew クラス名();で生成して使える。
// ParticleSystemって名前だから粒子管理用クラスっぽい
class ParticleSystem {
  // ArrayList<型名>で複数個入れられる箱作れるんすよ
  ArrayList<Particle> particles;  // 別ファイルのParticleクラス。粒子１つ分かな。それを複数個入れる箱ってこと。
  PVector origin;                 // (x, y, z)が格納されてる座標用クラス(PVector)のoriginだから初期値かな？

  // class名と同じ名前の関数はコンストラクタと呼ばれる。
  // 引数が一致した場合、クラス生成時に呼ばれる。
  // processingのsetup();みたいなもん。
  // 下記の場合ParticleSystem(loc);みたいに呼べばそれ以下の処理が実行される。
  ParticleSystem(PVector location) {
    // https://processing.org/reference/PVector.html
    // のget見て。
    origin = location.get();
    // 変数名と入れる型だけ決まってて、中身何もなかったのよ。classも何も無いnullって言われる状態。だからnewして空の箱作った。
    particles = new ArrayList<Particle>();
  }

  // 粒子追加
  void addParticle() {
    // 箱に一個、origin座標のパーティクル生成して追加ーかな。
    particles.add(new Particle(origin));
  }

  // 処理実行
  void run() {
    // 配列に.size()とか.countとか入ってる個数出してくれる関数や変数あるのよ。
    // for文でi変数に個数の値入れて一周ずつ数字へらして0になったらfor文終了ね。って処理。
    for (int i = particles.size()-1; i >= 0; i--) {
      // pに配列のi番目のParticleを取って入れるー
      Particle p = particles.get(i);
      // pさん実行処理(Particle型だからParticleファイルのrun処理)
      p.run();
      // pさん死んでる？
      if (p.isDead()) {
        // 配列からi番目のやつ削除(pさんのこと！)
        particles.remove(i);
      }
    }
  }
}
