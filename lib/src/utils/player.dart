//Save data Score
//Use player
class Player{
  
  String _name;
  String _photo;
  int _score;
  int _life;
  String _message = 'Aburrido!';
  bool _success = false;

  Player({name: "User", photo: "assets/img/profile/me.png", score: 0, life: 3}){

    this._name = name;
    this._photo = photo;
    this._score = score;
    this._life = life;

  }
  void saveScore(int score){
/*     var listArray = new List();
    listArray.add(photo);
    listArray.add(this.name);
    listArray.add(score); */
    var mapItems = {
      'name'  : '${this._name}',
      'photo' : '${this._photo}',
      'score' : '${this._score}',
    };

/*     var mapItemResultsGame = {
      'result': '${mapItems}',
    };
    var mapItemResultsGame =  json.encode(mapItems);
    print(mapItemResultsGame); */
  }
  void loadScore(){}

  //getters
  get getName => this._name;
  get getPhoto => this._photo;
  get getScore => this._score;
  get getLife => this._life;
  get getSuccess => this._success;
  get getMessage => this._message;
  //setters
  set setName(String name){
    this._name = name;
  }
  set setPhoto(String photo){
    this._photo = photo;
  }
  set setScore(int score){
    this._score = score;
  }
  set setLife(int life){
    this._life = life;
  }
  set setSuccess(bool succesFail){
    this._success = succesFail;
  }
  set setMessage(String message){
    this._message = message;
  }
}