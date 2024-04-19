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
  final int yearsOfExperience;

  const Doctor({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImageUrl,
    required this.category,
    required this.address,
    required this.packages,
    required this.workingHours,
    required this.yearsOfExperience,
    this.rating = 0,
    this.reviewCount = 0,
    this.patientCount = 0,
  });

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
      yearsOfExperience,
    ];
  }

  static final sampleDoctors = [
    Doctor(
      id: '1',
      name: "Dr. Heart",
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc pharetra libero vel lacus ullamcorper posuere. Aenean commodo ultricies porttitor. Cras euismod urna et ipsum vulputate hendrerit varius vitae ligula. Integer turpis tellus, sollicitudin volutpat posuere ac, iaculis vel nulla. Sed ornare ante eget tellus bibendum pellentesque. Praesent luctus rhoncus sapien. Praesent porttitor, ante a consequat commodo, felis mi hendrerit sem, id porta nisi sapien a elit. Nunc fringilla urna nec nisl fermentum commodo. Donec at felis sapien. Aliquam laoreet pellentesque metus, sit amet accumsan eros euismod ut. Sed enim felis, malesuada non massa non, hendrerit tristique tortor. Integer et vestibulum est. Donec arcu nisl, elementum et justo nec, faucibus molestie lorem. Nulla facilisi. Etiam mollis, purus a volutpat fringilla, diam erat tempor orci, a posuere augue elit id ex. Pellentesque eu sodales risus.',
      profileImageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
      category: DoctorCategory.cardiology,
      address: DoctorAddress.sampleDoctorAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.2,
      reviewCount: 182,
      patientCount: 1000,
      yearsOfExperience: 4,
    ),
    Doctor(
      id: '2',
      name: "Dr. Teeth",
      bio:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc pharetra libero vel lacus ullamcorper posuere. Aenean commodo ultricies porttitor. Cras euismod urna et ipsum vulputate hendrerit varius vitae ligula. Integer turpis tellus, sollicitudin volutpat posuere ac, iaculis vel nulla. Sed ornare ante eget tellus bibendum pellentesque. Praesent luctus rhoncus sapien. Praesent porttitor, ante a consequat commodo, felis mi hendrerit sem, id porta nisi sapien a elit. Nunc fringilla urna nec nisl fermentum commodo. Donec at felis sapien. Aliquam laoreet pellentesque metus, sit amet accumsan eros euismod ut. Sed enim felis, malesuada non massa non, hendrerit tristique tortor. Integer et vestibulum est. Donec arcu nisl, elementum et justo nec, faucibus molestie lorem. Nulla facilisi. Etiam mollis, purus a volutpat fringilla, diam erat tempor orci, a posuere augue elit id ex. Pellentesque eu sodales risus.',
      profileImageUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
      category: DoctorCategory.dentist,
      address: DoctorAddress.sampleDoctorAddresses[0],
      packages: DoctorPackage.samplePackages,
      workingHours: DoctorWorkingHours.sampleDoctorWorkingHours,
      rating: 4.6,
      reviewCount: 77,
      patientCount: 32,
      yearsOfExperience: 1,
    )
  ];
}
