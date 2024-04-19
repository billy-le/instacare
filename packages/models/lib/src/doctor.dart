import 'package:equatable/equatable.dart';
import 'package:models/models.dart';

class Doctor extends Equatable {
  final String id;
  final String name;
  final String bio;
  final String profileImageUrl;
  final DoctorCategory category;
  final DoctorAddress address;
  final List<DoctorPackage> packages;
  final List<DoctorWorkingHours> workingHours;
  final double rating;
  final int reviewCount;
  final int patientCount;

  const Doctor({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImageUrl,
    required this.category,
    required this.address,
    required this.packages,
    required this.workingHours,
    this.rating = 0,
    this.reviewCount = 0,
    this.patientCount = 0,
  });

  Doctor copyWith({
    String? id,
    String? name,
    String? bio,
    String? profileImageUrl,
    DoctorCategory? category,
    DoctorAddress? address,
    List<DoctorPackage>? packages,
    List<DoctorWorkingHours>? workingHours,
    double? rating,
    int? reviewCount,
    int? patientCount,
  }) {
    return Doctor(
      id: id ?? this.id,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      category: category ?? this.category,
      address: address ?? this.address,
      packages: packages ?? this.packages,
      workingHours: workingHours ?? this.workingHours,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      patientCount: patientCount ?? this.patientCount,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      bio,
      profileImageUrl,
      category,
      address,
      packages,
      workingHours,
      rating,
      reviewCount,
      patientCount,
    ];
  }

  static final sampleDoctors = [
    Doctor(
        id: '0',
        name: "Dr. Boss",
        bio: 'A magical cardiologist based in California',
        profileImageUrl:
            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
        category: DoctorCategory.cardiology,
        address: DoctorAddress.sampleDoctorAddresses[0],
        packages: DoctorPackage.samplePackages,
        workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
        rating: 4.2,
        reviewCount: 182,
        patientCount: 1000),
    Doctor(
        id: '1',
        name: "Dr. Teeth",
        bio: 'Dentist',
        profileImageUrl:
            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
        category: DoctorCategory.dentist,
        address: DoctorAddress.sampleDoctorAddresses[0],
        packages: DoctorPackage.samplePackages,
        workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
        rating: 4.6,
        reviewCount: 77,
        patientCount: 32)
  ];
}
