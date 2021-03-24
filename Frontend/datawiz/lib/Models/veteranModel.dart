class VeteranModel {
  String facilityId;
  String facilityName;
  String address;
  String city;
  String state;
  String zIPCode;
  String countryName;
  String phoneNumber;
  String condition;
  String measureID;
  String measureName;
  String score;
  String sample;
  String footnote;
  String startDate;
  String endDate;
  String location;

  VeteranModel(
      {this.facilityId,
        this.facilityName,
        this.address,
        this.city,
        this.state,
        this.zIPCode,
        this.countryName,
        this.phoneNumber,
        this.condition,
        this.measureID,
        this.measureName,
        this.score,
        this.sample,
        this.footnote,
        this.startDate,
        this.endDate,
        this.location});

  VeteranModel.fromJson(List<dynamic> json) {
    facilityId = json[8];
    facilityName = json[9];
    address = json[10];
    city = json[11];
    state = json[12];
    zIPCode = json[13];
    countryName = json[14];
    phoneNumber = json[15];
    condition = json[16];
    measureID = json[17];
    measureName = json[18];
    score = json[19];
    sample = json[20];
    footnote = json[21];
    startDate = json[22];
    endDate = json[23];
    location = json[24];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Facility Id'] = this.facilityId;
    data['Facility Name'] = this.facilityName;
    data['Address'] = this.address;
    data['City'] = this.city;
    data['State'] = this.state;
    data['ZIP Code'] = this.zIPCode;
    data['Country Name'] = this.countryName;
    data['Phone Number'] = this.phoneNumber;
    data['Condition'] = this.condition;
    data['Measure ID'] = this.measureID;
    data['Measure Name'] = this.measureName;
    data['Score'] = this.score;
    data['Sample'] = this.sample;
    data['Footnote'] = this.footnote;
    data['Start Date'] = this.startDate;
    data['End Date'] = this.endDate;
    data['Location'] = this.location;
    return data;
  }
}