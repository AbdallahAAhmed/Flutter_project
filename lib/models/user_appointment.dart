class UserAppointment {
  final String? doctorName;
  final String? image;
  final double? rate;
  final DateTime? appointmentTime;
  final DateTime? appointmentDate;
  final String? category;

  UserAppointment({
    this.doctorName,
    this.appointmentDate,
    this.appointmentTime,
    this.image,
    this.rate,
    this.category,
  });
}
