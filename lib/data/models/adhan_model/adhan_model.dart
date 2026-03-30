import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'adhan_model.g.dart';

@JsonSerializable()
class AdhanModel {
	final int? code;
	final String? status;
	final Data? data;

	const AdhanModel({this.code, this.status, this.data});

	@override
	String toString() {
		return 'AdhanModel(code: $code, status: $status, data: $data)';
	}

	factory AdhanModel.fromJson(Map<String, dynamic> json) {
		return _$AdhanModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AdhanModelToJson(this);

	AdhanModel copyWith({
		int? code,
		String? status,
		Data? data,
	}) {
		return AdhanModel(
			code: code ?? this.code,
			status: status ?? this.status,
			data: data ?? this.data,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! AdhanModel) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => code.hashCode ^ status.hashCode ^ data.hashCode;
}
