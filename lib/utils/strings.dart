class KStrings {
  KStrings._();

  static const String appName = 'VISA';
  static const String token = 'token';
  static const String cacheBox = 'cache-box';
  static const String user = 'user';
  static const String applications = 'applications';

  //? Auth
  static const String loggedIn = 'Successfully logged in';
  static const String loggedOut = 'logged out';

  //? Sign In Screen
  static const String signIn = 'Sign In';
  static const String password = 'Password';
  static const String noAccount = 'Don\'t have an account?';
  static const String signUp = 'Sign Up';

  //? Sign Up Screen
  static const String applicationType = 'Application Type';
  static const String passwordNotMatched = 'Password doesn\'t match';
  static const String rePassword = 'Re-Password';
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String companyName = 'Company Name';
  static const String agentName = 'Agent Name';
  static const String agentAddress = 'Agent Address';
  static const String companyAddress = 'Company Address';

  //? Change Password Screen
  static const String currentPassword = 'Current Password';
  static const String newPassword = 'New Password';
  static const String reTypeNewPassword = 'Retype-New Password';

  //? Regex Experssions
  static const String phonePattern =
      r'^[0-9]{10}$'; //regex pattern for phone number

  static const String emailPattern =
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+'; //regex pattern for email

  static const String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$'; //regex pattern for password

  //? Homne Screen
  static const String whereFrom = 'Where I am From';
  static const String whereGoing = 'Where I am Going';
  static const String search = 'Search';
  static const String pleaseSelectErrorMessage = 'Pleasse Select Countries';
  static const String noVisaFound = 'No Visa Found!!';
  static const String visaCheckList = 'Visa Checklist';
  static const String fromCountry = 'From Country';
  static const String toCountry = 'To Country';

  //? Profile Screen
  static const String changePassword = 'Change Password';
  static const String logout = 'Logout';
  static const String customerProfile = 'Customer Profile';
  static const String name = 'Name';
  static const String username = 'Username';
  static const String email = 'Email';
  static const String phone = 'Phone';
  static const String gender = 'Gender';
  static const String male = 'Male';
  static const String female = 'Female';
  static const String updateProfile = 'Update Profile';
  static const String accountType = 'Account Type';
  static const String address = 'Address';

  //? Apply Visa
  static const String applyVisa = 'Apply Visa';
  static const String newApplication = 'New Application';
  static const String general = 'General';
  static const String company = 'Company';
  static const String agent = 'Agent';
  static const String application = 'Application';
  static const String termsAndCondition = 'Terms And Condition';
  static const String privacyPolicy = 'Privacy Policy';

  //? Application Info Screen
  static const String applicationInfo = 'Application Info';
  static const String passportNumber = 'Passport Number';
  static const String phoneNumber = 'Phone Number';
  static const String visaType = 'Visa Type';
  static const String visaCategory = 'Visa Category';
  static const String visaChecklist = 'Visa Checklist';
  static const String addDependent = 'Add Dependent';
  static const String save = 'Save';
  static const String hold = 'Hold';
  static const String dependent = 'Dependent';
  static const String dropdownValidator =
      'Please select visa type and Visa category';

  //? Dependent Information Screen
  static const String dependentInformation = 'Dependent Information';
  static const String saveApplication = 'Save Application';

  //? Check List Tile Screen
  static const String notFileSelected = 'No file selected';

  //? All Application Screen
  static const String allApplications = 'All Applications';
  static const String paid = 'Paid';
  static const String partial = 'Partial';
  static const String due = 'Due';
  static const String passport = 'Passport';

  //? Application View Screen
  static const String paymentStatus = 'Payment Status';
  static const String paidAmount = 'Paid Amount';
  static const String totalAmount = 'Total Amount';
  static const String dueAmount = 'Due Amount';
  static const String deleteApplication = 'Delete Application';
  static const String update = 'Update';
}
