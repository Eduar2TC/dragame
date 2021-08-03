import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu principal'),
      ),
      body: Container(
        //Conteiner
        child: Center(
          child: Column(
            // 1 column
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Arreglo de Widgets
              RaisedButton(
                child: Text("Jugar"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/level_one');
                },
              ),
              SizedBox(height: 35.0),
              RaisedButton(
                child: Text("Puntuaciones"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, '/score');
                },
              ),
              SizedBox(height: 35.0),
              RaisedButton(
                  child: Text("Acerca"),
                  textColor: Colors.white,
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    this.dialogo(context);
                  })
            ],
          ),
        ),
      ),
    );
  }

  void dialogo(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text('Mensaje del mas allá'),
                content: Container(
                    height: 300,
                    child: Card(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            radius: 32.0,
                            backgroundImage:
                                AssetImage("assets/img/profile/me.png"),
                          ),
                          title: Text("Hola soy Eduardo"),
                          subtitle: Text("Gracias por utilizar la App."),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton.icon(
                              icon: Image.asset('assets/img/icon/facebook.png'),
                              color: Colors.blue,
                              label: Text(
                                "Facebook",
                                style: TextStyle(color: Colors.white),
                              ),
                              elevation: 2.0,
                              onPressed: () {},
                            ),
                            RaisedButton.icon(
                              color: Colors.blue,
                              icon: Icon(
                                Icons.done_outline,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Aceptar",
                                style: TextStyle(color: Colors.white),
                              ),
                              elevation: 2.0,
                              onPressed: () => Navigator.pop(context, true),
                            )
                          ],
                        )
                      ],
                    ))),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }
}
