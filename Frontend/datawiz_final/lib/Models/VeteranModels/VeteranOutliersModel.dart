class VeteranOutlierModel{
  String facilityID;
  double score;

  VeteranOutlierModel(this.facilityID,this.score);

  double compareTo(double other){
    return (this.score > other)?other:this.score;
  }

}