part of 'models.dart';

class Province extends Equatable {
  final String? provinceId;
  final String? province;

  const Province({this.provinceId, this.province});

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        provinceId: json['province_id'] as String?,
        province: json['province'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'province_id': provinceId,
        'province': province,
      };

  // /// `dart:convert`
  // ///
  // /// Parses the string and returns the resulting Json object as [Province].
  // factory Province.fromJson(String data) {
  //   return Province.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  // /// `dart:convert`
  // ///
  // /// Converts [Province] to a JSON string.
  // String toJson() => json.encode(toMap());

  Province copyWith({
    String? provinceId,
    String? province,
  }) {
    return Province(
      provinceId: provinceId ?? this.provinceId,
      province: province ?? this.province,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [provinceId, province];
}
