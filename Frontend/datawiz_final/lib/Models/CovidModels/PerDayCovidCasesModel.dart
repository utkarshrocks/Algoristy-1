class PerDayCovidCasesModel{
  int Totalconfirmed;
  int Totaldeaths;
  int Totalrecovered;
  int dailyConfirmed;
  int dailyDeaths;
  int dailyRecovered;
  String date;

  PerDayCovidCasesModel({this.Totalconfirmed,this.Totaldeaths,this.Totalrecovered,this.dailyConfirmed,this.dailyDeaths,this.dailyRecovered});

  PerDayCovidCasesModel copy(PerDayCovidCasesModel x){
    return PerDayCovidCasesModel(
        Totalconfirmed : x.Totalconfirmed,
        Totaldeaths: x.Totaldeaths,
      Totalrecovered: x.dailyRecovered,
      dailyConfirmed: x.dailyConfirmed,
      dailyDeaths: x.dailyDeaths,
      dailyRecovered: x.dailyDeaths
    );
  }
}