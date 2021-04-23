import 'company_model.dart';

class InvolvedCompanies {
  int id;
  Company company;
  bool developer;

  InvolvedCompanies({this.id, this.company, this.developer});

  InvolvedCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'] != null ? new Company.fromJson(json['company']) : null;
    developer = json['developer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    data['developer'] = this.developer;
    return data;
  }
}
