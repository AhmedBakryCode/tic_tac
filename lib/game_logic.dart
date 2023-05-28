import 'dart:math';

class Player {
  static const x = "X";
  static const o = "O";
  static const empty = " ";
  static List<int> playerx = [];
  static List<int> playero = [];
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null)
      return contains(x) && contains(y);
    else
      return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  void playgame(int index, String? Activeplayer) {
    if (Activeplayer == "X")
      Player.playerx.add(index);
    else
      Player.playero.add(index);
  }

  Future autoplay(Activeplayer) async {
    int index = 0;
    List<int> emptycells = [];
    for (var i = 0; i < 9; i++) {
      if (!(Player.playero.contains(i) && Player.playerx.contains(i))) {
        emptycells.add(i);
      }
    }
    if (Player.playerx.containsAll(0, 1) && emptycells.contains(2))
      index = 2;
    else if (Player.playerx.containsAll(3, 4) && emptycells.contains(5))
      index = 5;
    else if (Player.playerx.containsAll(6, 7) && emptycells.contains(8))
      index = 8;
    else if (Player.playerx.containsAll(0, 3) && emptycells.contains(6))
      index = 6;
    else if (Player.playerx.containsAll(1, 4) && emptycells.contains(7))
      index = 7;
    else if (Player.playerx.containsAll(2, 5) && emptycells.contains(8))
      index = 8;
    else if (Player.playerx.containsAll(0, 4) && emptycells.contains(8))
      index = 8;
    else if (Player.playerx.containsAll(2, 4) && emptycells.contains(6))
      index = 6;
//start-end
    else if (Player.playerx.containsAll(0, 2) && emptycells.contains(1))
      index = 1;
    else if (Player.playerx.containsAll(3, 5) && emptycells.contains(4))
      index = 4;
    else if (Player.playerx.containsAll(6, 8) && emptycells.contains(7))
      index = 7;
    else if (Player.playerx.containsAll(0, 6) && emptycells.contains(3))
      index = 3;
    else if (Player.playerx.containsAll(1, 7) && emptycells.contains(4))
      index = 4;
    else if (Player.playerx.containsAll(2, 8) && emptycells.contains(5))
      index = 5;
    else if (Player.playerx.containsAll(0, 8) && emptycells.contains(4))
      index = 4;
    else if (Player.playerx.containsAll(2, 6) && emptycells.contains(4))
      index = 4;
//center-end
    else if (Player.playerx.containsAll(1, 2) && emptycells.contains(0))
      index = 2;
    else if (Player.playerx.containsAll(4, 5) && emptycells.contains(3))
      index = 3;
    else if (Player.playerx.containsAll(7, 8) && emptycells.contains(6))
      index = 6;
    else if (Player.playerx.containsAll(3, 6) && emptycells.contains(0))
      index = 0;
    else if (Player.playerx.containsAll(4, 7) && emptycells.contains(1))
      index = 1;
    else if (Player.playerx.containsAll(5, 8) && emptycells.contains(2))
      index = 2;
    else if (Player.playerx.containsAll(4, 8) && emptycells.contains(0))
      index = 0;
    else if (Player.playerx.containsAll(4, 6) && emptycells.contains(2))
      index = 2;

    //start-center
    else if (Player.playero.containsAll(0, 1) && emptycells.contains(2))
      index = 2;
    else if (Player.playero.containsAll(3, 4) && emptycells.contains(5))
      index = 5;
    else if (Player.playero.containsAll(6, 7) && emptycells.contains(8))
      index = 8;
    else if (Player.playero.containsAll(0, 3) && emptycells.contains(6))
      index = 6;
    else if (Player.playero.containsAll(1, 4) && emptycells.contains(7))
      index = 7;
    else if (Player.playero.containsAll(2, 5) && emptycells.contains(8))
      index = 8;
    else if (Player.playero.containsAll(0, 4) && emptycells.contains(8))
      index = 8;
    else if (Player.playero.containsAll(2, 4) && emptycells.contains(6))
      index = 6;
//start-end
    else if (Player.playero.containsAll(0, 2) && emptycells.contains(1))
      index = 1;
    else if (Player.playero.containsAll(3, 5) && emptycells.contains(4))
      index = 4;
    else if (Player.playero.containsAll(6, 8) && emptycells.contains(7))
      index = 7;
    else if (Player.playero.containsAll(0, 6) && emptycells.contains(3))
      index = 3;
    else if (Player.playero.containsAll(1, 7) && emptycells.contains(4))
      index = 4;
    else if (Player.playero.containsAll(2, 8) && emptycells.contains(5))
      index = 5;
    else if (Player.playero.containsAll(0, 8) && emptycells.contains(4))
      index = 4;
    else if (Player.playero.containsAll(2, 6) && emptycells.contains(4))
      index = 4;
//center-end
    else if (Player.playero.containsAll(1, 2) && emptycells.contains(0))
      index = 2;
    else if (Player.playero.containsAll(4, 5) && emptycells.contains(3))
      index = 3;
    else if (Player.playero.containsAll(7, 8) && emptycells.contains(6))
      index = 6;
    else if (Player.playero.containsAll(3, 6) && emptycells.contains(0))
      index = 0;
    else if (Player.playero.containsAll(4, 7) && emptycells.contains(1))
      index = 1;
    else if (Player.playero.containsAll(5, 8) && emptycells.contains(2))
      index = 2;
    else if (Player.playero.containsAll(4, 8) && emptycells.contains(0))
      index = 0;
    else if (Player.playero.containsAll(4, 6) && emptycells.contains(2))
      index = 2;
    else {
      Random random = Random();
      var randomindex = random.nextInt(emptycells.length);
      index = emptycells[randomindex];
    }
    playgame(index, Activeplayer);
  }

  String checkwinner() {
    String winner = '';
    if (Player.playero.containsAll(0, 1, 2) ||
        Player.playero.containsAll(3, 4, 5) ||
        Player.playero.containsAll(6, 7, 8) ||
        Player.playero.containsAll(0, 3, 6) ||
        Player.playero.containsAll(1, 4, 7) ||
        Player.playero.containsAll(2, 5, 8) ||
        Player.playero.containsAll(0, 4, 8) ||
        Player.playero.containsAll(2, 4, 6))
      winner = "O";
    else if (Player.playerx.containsAll(0, 1, 2) ||
        Player.playerx.containsAll(3, 4, 5) ||
        Player.playerx.containsAll(6, 7, 8) ||
        Player.playerx.containsAll(0, 3, 6) ||
        Player.playerx.containsAll(1, 4, 7) ||
        Player.playerx.containsAll(2, 5, 8) ||
        Player.playerx.containsAll(0, 4, 8) ||
        Player.playerx.containsAll(2, 4, 6))
      winner = "X";
    else
      winner = "";
    return winner;
  }
}
