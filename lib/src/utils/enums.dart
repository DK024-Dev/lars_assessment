// ignore_for_file: constant_identifier_names

enum ProviderStatus {
  idle,
  loading,
  success,
  error,
}

enum ApiCallType {
  GET,
  POST,
  DELETE,
  PUT,
  PATCH,
}

enum SocialLogin {
  google,
  facebook,
  apple,
  twitter,
  instagram,
  tikTok,
  none,
}

enum UserPurpose {
  buy,
  sell,
  swap,
  browse,
}

enum UserType {
  dealerAdmin,
  dealerSubUser,
  private,
}

enum CarServiceHistoryRecord {
  Partial,
  Full,
  None,
}

enum CarStatus {
  active,
  disabled,
  sold,
}

enum CarPostType {
  normal,
  premium,
}

enum CarCreateStatus {
  carWorth,
  additionalInformation,
  hpiAndMot,
  serviceHistory,
  conditionAndDamage,
  uploadPhotos,
  completed,
  //for front end
  stepperScreen,
  summaryScreen,
}

enum UserGender {
  male,
  female,
  ratherNotSay,
}

enum SubscriptionChangeStatus {
  active,
  approved,
  rejected,
  pending,
}

enum SubscriptionsType {
  subscription,
  payAsYouGo,
  freeTrial,
  unlimited,
}

enum SubscriptionPageName {
  initialPage,
  freeTrailPage,
}

enum OfferType {
  none,
  swap,
  cash,
  swapAndCash,
}

enum OfferStatus {
  waiting,
  accepted,
  rejected,
  negotiated,
  canceled,
}

enum MessageType {
  normal,
  offer,
}

enum CarDeletedBy {
  user,
  admin,
}

enum ProgressStatus {
  completed,
  cancel,
  loading,
  error,
}

enum AttachmentType {
  image,
  video,
  document,
}

enum Status {
  active,
  inactive,
}

enum ChatStatus {
  active,
  deleted,
  disappeared,
}

enum AnswerType {
  yesno,
  textbox,
  multichoice,
  yesnoText,
  multichoiceText,
}

enum YesNoAnswer {
  yes,
  no,
}

enum SurveyType {
  deletePost,
  deleteProfile,
  relogin,
}
