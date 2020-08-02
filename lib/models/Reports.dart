class Reports {
  Reports({
    this.reporter,
    this.email,
    this.alertType,
    this.regionAffected,
    this.countryAffected,
    this.description
});
  Reports.fromJson(Map<String, dynamic> json) :
        reporter = json['reporter'],
        email = json['email'],
        alertType = json['alertType'],
        regionAffected = json['regionAffected'],
        countryAffected = json['countryAffected'],
        description = json['description'];
  String reporter,
      email,
      alertType,
      regionAffected,
      countryAffected,
      description;
  List<Reports> reports = [];
  Map<String, dynamic> toJson() => {
    'reporter': reporter,
    'email': email,
    'alertType': alertType,
    'regionAffected': regionAffected,
    'countryAffected': countryAffected,
    'description': description
  };

  void addReport(Reports report) {
    print(report);
    reports.add(report);
  }

  void removeReport(Reports report) {
    reports.remove(report);
    if(reports.isEmpty) {

    }
  }
}

