import 'package:datawiz_final/SettingsAndVariables/Util/findOutliers.dart';
import 'package:datawiz_final/SettingsAndVariables/Variables/variables.dart';

void getOutliers() async {
  ScoreOutliersList.sort((a,b) {
    return a.score.compareTo(b.score);
  });

  SampleOutliersList.sort((a,b){
    return a.score.compareTo(b.score);
  });

  int mid1 = findMID(ScoreOutliersList);
  int mid2 = findMID(SampleOutliersList);

  int Q1 = findFirstQ(mid1);
  int Q2 = findFirstQ(mid2);

  int lenght1 = ScoreOutliersList.length;
  int lenght2 = SampleOutliersList.length;

  if(lenght1&1 == 1)scoreOutliersMedian = ScoreOutliersList[mid1].score;
  else scoreOutliersMedian = (ScoreOutliersList[mid1-1].score + ScoreOutliersList[mid1].score)/2;

  if(lenght2&1 == 1) sampleOutliersMedian = SampleOutliersList[mid1].score;
  else sampleOutliersMedian = (SampleOutliersList[mid1-1].score + SampleOutliersList[mid1].score)/2;

  double q11;
  double q12;

  double q21;
  double q22;

  if(mid1&1 == 1){
    q11 = ScoreOutliersList[Q1].score;
    if(lenght1&1 == 1) q12 = ScoreOutliersList[mid1 + Q1 + 1].score;
    else q12 = ScoreOutliersList[mid1 + Q1].score;
  }
  else{
    q11 = (ScoreOutliersList[Q1].score + ScoreOutliersList[Q1-1].score)/2;
    q12 = (ScoreOutliersList[mid1 + Q1].score + ScoreOutliersList[mid1 + Q1-1].score)/2;
  }

  if(mid2&1 == 1){
    q21 = SampleOutliersList[Q2].score;
    if(lenght2&1 == 1) q22 = SampleOutliersList[mid2 + Q2 + 1].score;
    else q22 = SampleOutliersList[mid1 + Q2].score;
  }
  else{
    q21 = (SampleOutliersList[Q2].score + SampleOutliersList[Q2-1].score)/2;
    q22 = (SampleOutliersList[mid2 + Q2].score + SampleOutliersList[mid2 + Q2-1].score)/2;
  }

  double iqr1 = 1.5*iqr(q11, q12);
  double iqr2 = 1.5*iqr(q21, q22);

  lowerBoundScoreOutliersMedian = q11 - iqr1;
  upperBoundScoreOutliersMedian = q12 + iqr1;

  lowerBoundSampleOutliersMedian = q21 - iqr2;
  upperBoundSampleOutliersMedian = q22 + iqr2;

}