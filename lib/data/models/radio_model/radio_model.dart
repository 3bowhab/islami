import 'package:json_annotation/json_annotation.dart';

import 'radio.dart';

part 'radio_model.g.dart';

@JsonSerializable()
class RadioModel {
	final List<RadioItem>? radios;

	const RadioModel({this.radios});

	@override
	String toString() => 'RadioModel(radios: $radios)';

	factory RadioModel.fromJson(Map<String, dynamic> json) {
		return _$RadioModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$RadioModelToJson(this);

	RadioModel copyWith({
		List<RadioItem>? radios,
	}) {
		return RadioModel(
			radios: radios ?? this.radios,
		);
	}
}
