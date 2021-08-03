import 'package:flutter/material.dart';
import 'package:dragame/src/utils/audio.dart';
import 'package:dragame/src/utils/player.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

class LevelOne extends StatefulWidget {
  // LevelOne({Key key}) : super(key: key);
  @override
  _LevelOneState createState() {
    return _LevelOneState();
  }
}

class _LevelOneState extends State<LevelOne> {
  //Lista de imagenes dragables
  //lista de imagenes temporales
  //lista de imagenes destino

  List<List<ItemModel>> itemsOrigen;
  List<ItemModel> itemsDestino;
  Player player = null;
  Audio audio = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initGame(); //initialize game
  }

  initGame() {
    //inicialización del juego
    player = new Player();
    audio = new Audio();
    audio.playBgMusic(); //play bg music

    player = new Player(
        score: 0,
        name: "Me",
        life: 3,
        photo: "assets/img/profile/me.png"); // new Player Gamer
    itemsOrigen = [
      [
        ItemModel(
            nombre: 'Cubre vocas',
            valor: 'mask',
            imagen: 'assets/img/icon/003-mask-1.png',
            estado: false),
        ItemModel(
            nombre: 'Cubre vocas',
            valor: 'medical-mask',
            imagen: 'assets/img/icon/004-medical-mask.png'),
        ItemModel(
            nombre: 'Lavarse',
            valor: 'mask-orig',
            imagen: 'assets/img/icon/009-hand-wash-1.png'),
      ],
      [
        ItemModel(
            nombre: 'Cubre vocas',
            valor: 'mask',
            imagen: 'assets/img/icon/003-mask-1.png',
            estado: false),
        ItemModel(
            nombre: 'Cubre vocas',
            valor: 'medical-mask',
            imagen: 'assets/img/icon/004-medical-mask.png'),
        ItemModel(
            nombre: 'Lavarse',
            valor: 'mask-orig',
            imagen: 'assets/img/icon/009-hand-wash-1.png'),
      ],
      [
        ItemModel(
            nombre: 'Cubre vocas',
            valor: 'mask',
            imagen: 'assets/img/icon/003-mask-1.png',
            estado: false),
        ItemModel(
            nombre: 'Cubre vocas',
            valor: 'medical-mask',
            imagen: 'assets/img/icon/004-medical-mask.png'),
        ItemModel(
            nombre: 'Lavarse',
            valor: 'mask-orig',
            imagen: 'assets/img/icon/009-hand-wash-1.png'),
      ],
      [
        ItemModel(
            nombre: 'Cubre vocas',
            valor: 'mask',
            imagen: 'assets/img/icon/003-mask-1.png',
            estado: false),
        ItemModel(
            nombre: 'Cubre vocas',
            valor: 'medical-mask',
            imagen: 'assets/img/icon/004-medical-mask.png'),
        ItemModel(
            nombre: 'Lavarse',
            valor: 'mask-orig',
            imagen: 'assets/img/icon/009-hand-wash-1.png'),
      ],
    ];
    itemsDestino = [
      ItemModel(
          nombre: 'Cubre bocas',
          valor: 'mask',
          imagen: 'assets/img/icon/002-mask.png',
          estado: false,
          audio: 'voices/cubreBocas.mp3'),
      ItemModel(
          nombre: 'Cubre bocas',
          valor: 'medical-mask',
          imagen: 'assets/img/icon/005-medical-mask-1.png',
          audio: 'voices/cubreBocasMedico.mp3'),
      ItemModel(
          nombre: 'Lavarse',
          valor: 'mask-orig',
          imagen: 'assets/img/icon/008-hand-wash.png',
          audio: 'voices/lavarse.mp3'),
      ItemModel(
          nombre: 'Virus',
          valor: 'virus',
          imagen: 'assets/img/icon/corona_virus.png',
          estado: false,
          audio: 'voices/virus.mp3'),
      ItemModel(
          nombre: 'No besos',
          valor: 'no_besos',
          imagen: 'assets/img/icon/037-kissing.png',
          audio: 'voices/no_besos.mp3'),
      ItemModel(
          nombre: 'Estornudar',
          valor: 'estornudar',
          imagen: 'assets/img/icon/023-cough-3.png',
          audio: 'voices/estornudar.mp3'),
    ];
    itemsOrigen.shuffle(); //randomize data of objets
    itemsDestino.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //Quita el logo verificar que sea heredado
      theme: Theme.of(context),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Level 1"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset('assets/img/icon/heart_0.png'),
                  Text(":${player.getLife}"),
                  SizedBox(width: 15),
                  /* IconButton(icon: Icon(Icons.ac_unit), onPressed: null), */
                  Text(
                    "Score:${player.getScore}",
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              ),
            )
          ],
          //title: Text("Level 1      score: ${_score}"),
          elevation: 5.0,
        ),
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        body: this.loadLayout(),
      ),
    );
  }

  //methods

  Widget loadLayout() {
    return SafeArea(
      child: Column(
        //Columna principal dividido en rows por Expanded
        children: <Widget>[
          Expanded(
            // 1ra columna Expanded
            flex: 8,
            child: Container(
              //decoration: const BoxDecoration(color: Colors.red), //sobrescrito
              child: Row(
                //Renglón principal dividido por columnas por Expanded
                children: <Widget>[
                  Expanded(
                    //Columna Expanded
                    flex: 7,
                    child: Container(
                        //Contenedor
                        margin: EdgeInsets.all(5),
                        color: Colors.blueGrey[
                            100], //BACKGROUND COLUMNA IZQUIERDA DE LOS ELEMENTOS DRAGABLES
                        child: Padding(
                          padding: EdgeInsets.all(
                              10), //Agrega padding a los elementos de imagen
                          child: Column(
                              //Columna izquierda
                              children: //<Widget>[ //arreglo de widgets rows de los elementos Imagenes Origen
                                  retornaRowsDeItems() //creacion de los renglones de elementos
                              ),
                        )),
                  ),
                  Expanded(
                    //Columna Expanded izquierda
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                      color: Colors.white70, //BACKGROUND COLUMNA DERECHA
                      //Scrollable container
                      child: SingleChildScrollView(
                        child: Column(
                          //columna derecha --arreglo de widgets rows de los elementos Imagenes
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: itemsDestino.map((item) {
                            //item: Elemento de la lista

                            return DragTarget<ItemModel>(
                              //HACER EN FUNCION
                              builder: (context, acceptedItems, rejectedItems) {
                                return Container(
                                  child: Column(
                                    children: <Widget>[
                                      item.getEstado == true
                                          ? //verifica si el estado del item es true o false para agregar el efecto hover al activar o desactivar su estado
                                          Opacity(
                                              opacity: 0.5,
                                              child: Image(
                                                image: AssetImage(item.imagen),
                                              ))
                                          : //estado == false
                                          Opacity(
                                              opacity: 1,
                                              child: Image(
                                                  image: AssetImage(
                                                item.imagen,
                                              ))),
                                      Text(item.nombre,
                                          style: TextStyle(fontSize: 10)),
                                      RaisedButton(
                                          child: Text("Play"),
                                          onPressed: () {
                                            audio.playVoices(item.getAudio);
                                          })
                                    ],
                                  ),
                                );
                              },
                              onWillAccept: (receivedItem) {
                                print("caca");
                                setState(() {
                                  item.setEstado = true;
                                });
                                return true;
                              },
                              onAccept: (receivedItem) {
                                //valor del item origen es igual al  del destino?
                                if (item.getValorItem ==
                                    receivedItem.getValorItem) {
                                  //ItemModel obj = ItemModel(nombre: 'Bien', valor: 'ok', imagen: 'assets/img/icon/success.png');
                                  String imgTemp = receivedItem.imagen;
                                  receivedItem
                                      .setValorItem(); // change value item received
                                  //
                                  setState(() {
                                    receivedItem.imagen =
                                        receivedItem.setItemImagen =
                                            'assets/img/icon/success.png';
                                    //setting user player status
                                    item.setItemImagen = imgTemp;
                                    int scoreTemp = player.getScore;
                                    player.setScore = scoreTemp += 10;
                                    audio.playDragged();
                                    item.setEstado = false;
                                    //change smile face
                                    player.setSuccess = true;

                                    //Verificar ganador!
                                    if (itemsOrigen.length * 10 == scoreTemp) {
                                      audio.stopBgMusic();
                                      audio.playSuccess();
                                      this.muestraDialog(context,
                                          messageGame: "Ganaste!",
                                          audio: this.audio,
                                          action1: "Reiniciar",
                                          action2: "Salir");
                                    } else {
                                      print('perdedor');
                                    }
                                  });
                                } else {
                                  setState(() {
                                    //setting user player status
                                    item.setEstado = false;
                                    int tempLife = player.getLife;
                                    //Check helt lifes
                                    if (player.getLife > 0) {
                                      player.setLife = tempLife -= 1;
                                      //change smile face
                                      player.setSuccess = false;
                                    } else if (player.getLife == 0) {
                                      this.muestraDialog(context,
                                          messageGame: "Game over",
                                          audio: this.audio,
                                          action1: "Reiniciar",
                                          action2: "Salir");
                                      //Calling message death
                                    }
                                  });
                                }
                              },
                              onLeave: (receivedItem) {
                                // Posar el item imagen sobre el destino
                                print('on leave :v');
                                setState(() {
                                  item.setEstado = false;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            //2da Columna Expanded (Barra inferior)
            flex: 2,
            child: Container(
              color: Colors
                  .white70, //COLOR DE LA SECCIÓN SPEAKERS Y SALIR - REFRESH
              margin: EdgeInsets.only(right: 5, left: 5, bottom: 5),
              //decoration: const BoxDecoration(color: Colors.green),     ///////////////////////////
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: 250,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              //Image(image: AssetImage("assets/img/icon/emotion.png")),
                              flipImageFace(),
                              Text('${player.getMessage}'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      //color: Colors.white70,   //COLOR SECCIÓN SPEAKERS Y SALIR
                      //decoration: const BoxDecoration(color: Colors.blue),
                      //MediaQuery.of(context).orientation == Orientation.portrait? Text("True"): null,
                      child:
                          sectionExitSpeakers(), //sección del layout con detección de cambio de orientación
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.refresh),
                              iconSize: 60,
                              color: Color.fromARGB(255, 10, 166, 229),
                              highlightColor: Colors.white,
                              splashColor: Colors.blue,
                              onPressed: () {
                                setState(() {
                                  audio.stopBgMusic();
                                  this.initGame();
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget sectionExitSpeakers() {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  //icon: Image.asset('assets/img/icon/speaker.png'),
                  icon: flipImage(),
                  //icon: Icon(Icons.speaker),
                  iconSize: 60,
                  color: Colors.white,
                  highlightColor: Colors.blueGrey,
                  splashColor: Colors.blue,
                  tooltip: 'Volumen',
                  onPressed: () {
                    if (audio.audioBgActivated == true) {
                      audio.stopBgMusic();
                      audio.setAudioBg = false;
                    } else if (audio.audioBgActivated == false) {
                      audio.playBgMusic();
                      audio.setAudioBg = true;
                    }
                    setState(() {
                      //redibuja
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text("Salir"),
                textColor: Colors.white,
                highlightColor: Colors.red,
                onPressed: () {
                  this.muestraDialog(context,
                      messageGame: "Seguro?",
                      audio: this.audio,
                      action1: "Si",
                      action2: "No",
                      routingHome: true);
                },
              )
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  //icon: Image.asset('assets/img/icon/speaker.png'),
                  icon: flipImage(),
                  iconSize: 60,
                  color: Colors.white,
                  highlightColor: Colors.blueGrey,
                  splashColor: Colors.blue,
                  tooltip: 'Volumen',
                  onPressed: () {
                    if (audio.audioBgActivated == true) {
                      audio.stopBgMusic();
                      audio.setAudioBg = false;
                    } else if (audio.audioBgActivated == false) {
                      audio.playBgMusic();
                      audio.setAudioBg = true;
                    }
                    setState(() {
                      //redibuja
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text("Salir"),
                textColor: Colors.white,
                highlightColor: Colors.red,
                onPressed: () {
                  this.muestraDialog(context,
                      messageGame: "Seguro?",
                      audio: this.audio,
                      action1: "Si",
                      action2: "No",
                      routingHome: true);
                },
              )
            ],
          ),
        ],
      );
    }
  }

  List<Widget> retornaRowsDeItems() {
    //create rows of items
    List<Widget> temp = [];
    this.itemsOrigen.forEach((elementList) {
      temp.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: elementList.map((item) {
            //item element of array
            return Container(
              child: Draggable<ItemModel>(
                data: item,
                //imagen arrastrando
                feedback: Opacity(
                    opacity: 0.5,
                    child: Image(
                        image: AssetImage(
                            item.imagen))), // drag image con opacidad
                //imagen origen cuando se arrastra el elemento imagen
                childWhenDragging: Image(
                    image: AssetImage(item.imagen),
                    color: Color.fromARGB(255, 60, 60, 60)),
                child: Image(
                    //-->original imagen
                    image: AssetImage(item.imagen)),
              ),
            );
          }).toList()));
    });
    return temp;
  }

  //cambia la imagen del icono speaker
  Image flipImage() {
    if (audio.audioBgActivated == true) {
      return Image.asset('assets/img/icon/speaker.png');
    } else if (audio.audioBgActivated == false) {
      return Image.asset('assets/img/icon/mute.png');
    }
  }

  //change image smile face
  Image flipImageFace({String emotion}) {
    int i = 0; //initial image
    if (i == 0 && player.getSuccess == false) {
      i++;
      return Image.asset('assets/img/icon/emotion.png');
    } else if (player.getSuccess == false) {
      player.setSuccess = true;
      player.setMessage = 'Ups!';
      i++;
      return Image.asset('assets/img/icon/thinking.png');
    } else if (player.getSuccess == true) {
      player.setSuccess = false;
      player.setMessage = 'Ok!!!';
      i++;
      return Image.asset('assets/img/icon/winking-face.png');
    }
    if (emotion == 'thinking') {
      player.setSuccess = false;
      player.setMessage = 'Ok!!!';
      return Image.asset('assets/img/icon/thinking.png');
    }
  }

  //Dialog
  Future muestraDialog(BuildContext context,
      {Audio audio,
      String messageGame,
      String action1,
      String action2,
      bool routingHome = false}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          if (routingHome == true) {
            return AlertDialog(
              title: Text("Seguro? "),
              actions: <Widget>[
                FlatButton(
                  child: Text("Si"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                    setState(() {
                      audio.stopBgMusic();
                      //return to home page
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  },
                ),
                FlatButton(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          } else {
            return AlertDialog(
              title: Text(messageGame),
              actions: <Widget>[
                FlatButton(
                  child: Text(action1),
                  onPressed: () {
                    setState(() {
                      audio.stopBgMusic();
                      this.initGame();
                      Navigator.pop(context);
                    });
                  },
                ),
                FlatButton(
                  child: Text(action2),
                  onPressed: () {
                    audio.stopBgMusic();
                    SystemNavigator.pop();
                  },
                ),
              ],
            );
          }
        });
  }
}

class ItemModel {
  final String nombre;
  String valor;
  String imagen;
  String audio;
  bool estado; //item para verificar si el item es aceptado o rechazado

  ItemModel(
      {this.nombre,
      this.valor,
      this.imagen,
      this.estado = false,
      this.audio}); // Constructor
  //setters
  set setItemImagen(String imagen) {
    this.imagen = imagen;
  }

  void setValorItem({String valor: "Ok"}) {
    this.valor = valor;
  }

  set setEstado(bool estado) {
    this.estado = estado;
  }

  //getters
  get getItemImagen => this.imagen;
  get getValorItem => this.valor;
  get getEstado => this.estado;
  get getAudio => this.audio;
}
