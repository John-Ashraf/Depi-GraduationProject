class Clouds {
  final int? all;

  Clouds({this.all});

  factory Clouds.fromJson(dynamic json) {
    if (json == null) {
      return Clouds();
    }

    return Clouds(
      all: json['all'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "all": this.all,
    };
  }
}

