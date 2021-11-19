class Doctor {
  final int? id;
  final String? name;
  final String? image;
  final String? department;
  final double? price;
  final double? rate;
  final String hospitalName;
  final String description;
  final double? experienceYears;
  final int? patientsCount;
  Doctor({
    this.id,
    required this.name,
    required this.image,
    required this.department,
    required this.price,
    required this.rate,
    this.hospitalName = '',
    this.description = '',
    this.experienceYears,
    this.patientsCount,
  });
}
