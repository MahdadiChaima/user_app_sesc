class modelQuest{

  String id, qst,A1,A2,A3,correct,score;
  modelQuest({this.id,this.qst,this.A1,this.A2,this.A3,this.correct,this.score});
  factory modelQuest.fromJson(Map<String,dynamic>json){
    return modelQuest(
      id: json['id_q'],
      qst: json['Question'],
      A1: json['A1'],
      A2: json['A2'],
      A3: json['A3'],
      correct: json['correct'],
      score: json['score'],

    );
  }
}