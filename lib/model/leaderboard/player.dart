class Player {
  String name;
  int score;

  Player(this.name, this.score);

  Player.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        score = json['score'];

  Map<String, dynamic> toJson() => {'name': name, 'score': score};
}
