class CovidOutlierModel{
  String state;
  int score;
  double lowerbound;
  double upperbound;
  double median;

  CovidOutlierModel(this.state,this.score);

  int compareTo(int other){
    return (this.score > other)?other:this.score;
  }
}