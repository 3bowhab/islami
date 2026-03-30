import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError {
	String? status;
	String? code;
	String? message;

	ApiError({this.status, this.code, this.message});

	factory ApiError.fromJson(Map<String, dynamic> json) {
		return _$ApiErrorFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}
