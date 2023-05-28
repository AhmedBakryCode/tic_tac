import 'package:flutter/material.dart';
import 'package:tic_tac/game_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   bool darkheme = true;

  String activePlayer = 'X';
  bool gameover = false;
  int turn = 0;
  String result = "";
  Game game = Game();
  bool isswitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:MediaQuery.of(context).orientation==Orientation.portrait?
        Column(
          children: [
            ...firstblock(),
            _expanded(context),
            ...lastblock()
           ],
        ):Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  ...firstblock(),
                ...lastblock(),
                ],
              ),
            ),
           _expanded(context),
          ],
        ),
      ),
    );
  }
  List<Widget>firstblock(){
    return[
      SwitchListTile.adaptive(
          title: Text("Turn on /off darktheme"),
          value: darkheme,
          onChanged: (newval) {
            setState(() {
              darkheme = newval;
            });
          }),
      SwitchListTile.adaptive(
          title: Text('Turn on/off Two Players'),
          value: isswitched,
          onChanged: (newvalue) {
            setState(() {
              isswitched = newvalue;
            });
          }),
      Text(
        "it is $activePlayer Turn",
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),

    ];
  }
List <Widget>lastblock(){
    return[
      Text(
        result,
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
      ElevatedButton.icon(
          onPressed: () {
            setState(() {
              Player.playerx=[];
              Player.playero=[];
              result = "";
              gameover = false;
              turn = 0;
              activePlayer = "X";
            });
          },
          icon: Icon(Icons.replay_5_outlined),
          label: Text("Repeat The Game"))

    ];
}
  Expanded _expanded(BuildContext context) {
    return Expanded(
              child: GridView.count(
            padding: EdgeInsets.all(15),
            crossAxisCount: 3,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1.0,
            children: List.generate(
                9,
                (index) => InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: gameover ? null : () => Ontap(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                            child: Text(
                          Player.playerx.contains(index)
                              ? "X"
                              : Player.playero.contains(index)
                                  ? "O"
                                  : " ",
                          style: TextStyle(
                              color: Player.playerx.contains(index)
                                  ? Colors.blue
                                  : Colors.pink,
                              fontSize: 52),
                        )),
                      ),
                    )),
          ));
  }

  Ontap(int index) async {
    if ((!Player.playerx.contains(index) || Player.playerx.isEmpty) &&
        (!Player.playero.contains(index) || Player.playero.isEmpty)) {
      game.playgame(index, activePlayer);
      updateState();
      if (!isswitched && !gameover&&turn!=9) {
        await game.autoplay(activePlayer);
        updateState();
      }
    }
  }

  void updateState() {
    setState(() {
      activePlayer = (activePlayer == "X") ? "O" : "X";
      turn++;
      String winner=game.checkwinner();
      if(winner!="") {
        gameover = true;
        result = "$winner is the Winner";
      }else if(!gameover&&turn==9){
  result="it is Drawer";}
    });
  }
}
