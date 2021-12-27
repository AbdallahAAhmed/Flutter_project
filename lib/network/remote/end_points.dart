const String urlLogin = 'auth/login';
const String urlRegister = 'auth/register';
const String CATEGORIES = 'categories';
const String TopRateDoctors = 'doctors?sort=rate&size=5';
const String allDoctors = 'doctors?sort=rate&size=16';
const String PROFILE = 'users/profile';
const String USER_APPOINTMENT = 'appointments';
const String CREATE_APPOINTMENT = 'appointments';


String getDoctorsByCategoryIdApi(String id)
{
  return 'doctors?categoryId=$id';
}

String doctorsDetailsUrl(String id) {
  return 'doctors/$id';
}

String searchUrl(String key)
{
  return 'doctors?name=$key';
}

String deleteUserAppointmentsUrl(String id) 
{
  return 'appointments/$id';
}