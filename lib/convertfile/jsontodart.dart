class upi_model {
  String? title;
  String? date;
  List<Listt>? listt;

  upi_model({this.title, this.date, this.listt});

  upi_model.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    if (json['listt'] != null) {
      listt = <Listt>[];
      json['listt'].forEach((v) {
        listt!.add(new Listt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    if (this.listt != null) {
      data['listt'] = this.listt!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listt {
  String? payment;
  String? transferBnk;
  String? emount;
  String? image;

  Listt({this.payment, this.transferBnk, this.emount, this.image});

  Listt.fromJson(Map<String, dynamic> json) {
    payment = json['payment'];
    transferBnk = json['TransferBnk'];
    emount = json['emount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment'] = this.payment;
    data['TransferBnk'] = this.transferBnk;
    data['emount'] = this.emount;
    data['image'] = this.image;
    return data;
  }
}
