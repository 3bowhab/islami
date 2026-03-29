import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'location.dart';
import 'params.dart';

part 'method.g.dart';

@JsonSerializable()
class Method {
	final int? id;
	final String? name;
	final Params? params;
	final Location? location;

	const Method({this.id, this.name, this.params, this.location});

	@override
	String toString() {
		return 'Method(id: $id, name: $name, params: $params, location: $location)';
	}

	factory Method.fromJson(Map<String, dynamic> json) {
		return _$MethodFromJson(json);
	}

	Map<String, dynamic> toJson() => _$MethodToJson(this);

	Method copyWith({
		int? id,
		String? name,
		Params? params,
		Location? location,
	}) {
		return Method(
			id: id ?? this.id,
			name: name ?? this.name,
			params: params ?? this.params,
			location: location ?? this.location,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Method) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			id.hashCode ^
			name.hashCode ^
			params.hashCode ^
			location.hashCode;
}
