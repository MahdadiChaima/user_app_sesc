class Questions {
  String qsttxt;
  String qstans1;
  String qstans2;
  String qstans3;
  int correct;
  Questions(String q, String a1,String a2,String a3,c) {
    qsttxt = q;
    qstans1 =a1;
    qstans2=a2;
    qstans3 =a3;
    correct=c;
  }
}
class Question {
  int _qstnb = 0;
  List<Questions> _QuestionBank = [
    Questions('Some cats are actually allergic to humans', 'cat','cow','low',2),
    Questions('You can lead a cow down stairs but not up stairs.','by','me','do',3),
    Questions(
        'Approximately one quarter of human bones are in the feet.', 'yr','agm','ath',1),

  ];
  void nextqst() {
    if (_qstnb < _QuestionBank.length) {
      _qstnb++;
    }
    //  } else {
    //  _qstnb = 0;}
  }

  String getQsttxt() {
    return _QuestionBank[_qstnb].qsttxt;
  }


  String getans1txt() {
    return _QuestionBank[_qstnb].qstans1;
  }
  String getans2txt() {
    return _QuestionBank[_qstnb].qstans2;
  }
  String getans3txt() {
    return _QuestionBank[_qstnb].qstans3;
  }

  int getQstans() {
    return _QuestionBank[_qstnb].correct;
  }

  void reset() {
    _qstnb = 0;
  }

  bool isFinished() {
    if (_qstnb >= _QuestionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}