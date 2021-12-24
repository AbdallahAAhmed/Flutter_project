const String urlLogin = 'auth/login';
const String urlRegister = 'auth/register';
const String CATEGORIES = 'categories';
const String TopRateDoctors = 'doctors?sort=rate&size=5';
const String allDoctors = 'doctors?sort=rate&size=16';
const String PROFILE = 'users/profile';
const String USER_APPOINTMENT = 'appointments';

String getDoctorsByCategoryIdApi(String id)
{
  return 'doctors?categoryId=$id';
}