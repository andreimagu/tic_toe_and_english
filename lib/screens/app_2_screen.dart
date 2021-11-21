import 'package:flutter/material.dart';

class App2Screen extends StatefulWidget {
  static const routeName = '/app-2';

  @override
  _App2ScreenState createState() => _App2ScreenState();
}

class _App2ScreenState extends State<App2Screen> {
  int whatPlayer = 0;
  List<int> l1 = [0, 0, 0];
  List<int> l2 = [0, 0, 0];
  List<int> l3 = [0, 0, 0];
  List<int> c1 = [0, 0, 0];
  List<int> c2 = [0, 0, 0];
  List<int> c3 = [0, 0, 0];
  int win = 0;

  int colorCheck(int index) {
    if (index >= 0 && index <= 2) {
      return l1[index];
    } else if (index >= 3 && index <= 5) {
      return l2[index - 3];
    } else if (index >= 6 && index <= 8) {
      return l3[index - 6];
    }

    return 0;
  }

  void changeMatrix(int index) {
    if(colorCheck(index)!=0){

      return;
    }
    if (whatPlayer == 0) {
      whatPlayer = 1;
    } else if (whatPlayer == 1)
      whatPlayer = -1;
    else if (whatPlayer == -1) {
      whatPlayer = 1;
    }


    if (index == 0) {
      l1[0] = whatPlayer;
      c1[0] = whatPlayer;
    }
    if (index == 1) {
      l1[1] = whatPlayer;
      c2[0] = whatPlayer;
    } else if (index == 2) {
      l1[2] = whatPlayer;
      c3[0] = whatPlayer;
    } else if (index == 3) {
      l2[0] = whatPlayer;
      c1[1] = whatPlayer;
    } else if (index == 4) {
      l2[1] = whatPlayer;
      c2[1] = whatPlayer;
    } else if (index == 5) {
      l2[2] = whatPlayer;
      c3[1] = whatPlayer;
    } else if (index == 6) {
      l3[0] = whatPlayer;
      c1[2] = whatPlayer;
    } else if (index == 7) {
      l3[1] = whatPlayer;
      c2[2] = whatPlayer;
    } else if (index == 8) {
      l3[2] = whatPlayer;
      c3[2] = whatPlayer;
    }
  }



  int validator() {
    int i, s1 = 0, s2 = 0, s3 = 0, s4 = 0, s5 = 0, s6 = 0;
    for (i = 0; i <= 2; i = i + 1) {
      s1 = s1 + c1[i];
      s2 = s2 + c2[i];
      s3 = s3 + c3[i];
      s4 = s4 + l1[i];
      s5 = s5 + l2[i];
      s6 = s6 + l3[i];
    }
    // print('s1=$s1');
    // print('s2=$s2');
    // print('s3=$s3');
    // print('s4=$s4');
    // print('s5=$s5');
    // print('s6=$s6');
    if (s1 == -3 ||
        s1 == 3 ||
        s2 == 3 ||
        s2 == -3 ||
        s3 == -3 ||
        s4 == -3 ||
        s4 == 3 ||
        s5 == -3 ||
        s5 == 3 ||
        s6 == -3 ||
        s6 == 3)
      return 1;
    else
      return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Phrases'),
      ),
      body: win == 0
          ? Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 1.2,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(0.0),
                      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        color:
                            colorCheck(index) == 0 ? Colors.white : (colorCheck(index) == 1 ? Colors.blue : Colors.red),
                        border: Border.all(color: Color(0xFF282f61), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(14.0)),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        changeMatrix(index);
                        win = validator();
                      });
                    },
                  );
                },
              ),
            )
          : AlertDialog(
              elevation: 5,
              title: Text('You Win!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    setState(() {
                      l1 = [0, 0, 0];
                      l2 = [0, 0, 0];
                      l3 = [0, 0, 0];
                      c1 = [0, 0, 0];
                      c2 = [0, 0, 0];
                      c3 = [0, 0, 0];
                      win = 0;
                    });
                  },
                  child: Text('Try Again'),
                ),
              ],
            ),
    );
  }
}
