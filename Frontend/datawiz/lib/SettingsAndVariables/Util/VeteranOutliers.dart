import 'package:datawiz/SettingsAndVariables/Util/maxAndmin.dart';
import 'package:datawiz/SettingsAndVariables/Variables/variables.dart';

void getOutliers() async {
  ScoreOutliersList.sort((a,b) {
    return a.score.compareTo(b.score);
  });

  SampleOutliersList.sort((a,b){
    return a.score.compareTo(b.score);
  });

  double maxnum = ScoreOutliersList.last.score;
  double maxnum2 = SampleOutliersList.last.score;

  scoreOutliersMedian = (ScoreOutliersList[440].score + ScoreOutliersList[441].score)/2;
  lowerBoundScoreOutliersMedian = maxd(scoreOutliersMedian - 1.5*ScoreOutliersList[220].score,0.00);
  upperBoundScoreOutliersMedian = mind(scoreOutliersMedian + 1.5*ScoreOutliersList[661].score, maxnum);

  sampleOutliersMedian = (SampleOutliersList[440].score + SampleOutliersList[441].score)/2;
  lowerBoundSampleOutliersMedian = maxd(sampleOutliersMedian - 1.5*SampleOutliersList[220].score,0.00);
  upperBoundSampleOutliersMedian = mind(sampleOutliersMedian + 1.5*SampleOutliersList[661].score, maxnum2);
}