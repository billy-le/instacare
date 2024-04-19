import 'package:models/models.dart';

class DoctorRepository {
  const DoctorRepository(
      // inject the required dependencies
      );

  Future<List<DoctorCategory>> fetchDoctorCategories() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return DoctorCategory.values;
  }

  Future<List<Doctor>> fetchDoctors() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return Doctor.sampleDoctors;
  }

  Future<List<Doctor>> fetchDoctorsByCategories(String categoryName) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return Doctor.sampleDoctors
        .takeWhile((doctor) => doctor.category.name == categoryName)
        .toList();
  }

  Future<Doctor?> fetchDoctorById(String doctorId) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return Doctor.sampleDoctors.firstWhere((doc) => doc.id == doctorId);
  }
}
