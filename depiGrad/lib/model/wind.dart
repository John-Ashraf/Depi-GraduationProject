class Wind {
  final double? speed;
  final int? deg;
  final double? gust;


  Wind({this.speed, this.deg,this.gust});

  Map<String, dynamic> toJson() {
    return {
      "speed": this.speed,
      "deg": this.deg,
      "gust": this.gust,
    };
  }

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: double.parse(json["speed"].toString()),
      deg: json["deg"],
    );
  }
//
}
