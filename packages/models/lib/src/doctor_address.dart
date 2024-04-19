import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorAddress extends Equatable {
  final String id;
  final String doctorId;
  final LatLng latLng;
  final String streetAddress;
  final String streetNumber;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  const DoctorAddress({
    required this.id,
    required this.doctorId,
    required this.latLng,
    required this.streetAddress,
    required this.streetNumber,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  @override
  List<Object> get props {
    return [
      id,
      doctorId,
      latLng,
      streetAddress,
      streetNumber,
      city,
      state,
      country,
      postalCode,
    ];
  }

  DoctorAddress copyWith({
    String? id,
    String? doctorId,
    LatLng? latLng,
    String? streetAddress,
    String? streetNumber,
    String? city,
    String? state,
    String? country,
    String? postalCode,
  }) {
    return DoctorAddress(
      id: id ?? this.id,
      doctorId: doctorId ?? this.doctorId,
      latLng: latLng ?? this.latLng,
      streetAddress: streetAddress ?? this.streetAddress,
      streetNumber: streetNumber ?? this.streetNumber,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      postalCode: postalCode ?? this.postalCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'doctorId': doctorId,
      'latLng': {'latitude': latLng.latitude, 'longitude': latLng.longitude},
      'streetAddress': streetAddress,
      'streetNumber': streetNumber,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
    };
  }

  factory DoctorAddress.fromMap(Map<String, dynamic> map) {
    return DoctorAddress(
      id: map['id'] as String,
      doctorId: map['doctorId'] as String,
      latLng: LatLng(map['latitude'], map['longitude']),
      streetAddress: map['streetAddress'] as String,
      streetNumber: map['streetNumber'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      postalCode: map['postalCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorAddress.fromJson(String source) =>
      DoctorAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  static const sampleDoctorAddresses = [
    DoctorAddress(
        id: '0',
        doctorId: '1',
        latLng: LatLng(0, 0),
        streetAddress: '1800 Fake Lane',
        streetNumber: 'Suite #42',
        city: 'Livermore',
        state: "California",
        country: "USA",
        postalCode: "96812")
  ];
}
