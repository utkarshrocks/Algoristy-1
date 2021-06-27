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

  VeteranModel.fromJson(var json) {
    facilityId = json["Facility ID"];
    facilityName = json["Facility Name"];
    address = json["Address"];
    city = json["City"];
    state = json["State"];
    zIPCode = json["ZIP Code"].toString();
    countryName = json["County Name"];
    phoneNumber = json["Phone Number"];
    condition = json["Condition"];
    measureID = json["Measure ID"];
    measureName = json["Measure Name"];
    score = json["Score"].toString();
    sample = json["Sample"].toString();
    footnote = json["Footnote"].toString();
    startDate = json["Start Date"];
    endDate = json["End Date"];
    location = json["Location"];
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