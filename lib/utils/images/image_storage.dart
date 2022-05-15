class ImageStorage {
  static _Illustrations illustrations = _Illustrations();
  static _Icons icons = _Icons();
  static _LottieAnimations lottieAnimations = _LottieAnimations();
}

class _Illustrations {
  final String login = 'assets/illustrations/sign-in.png';
  final String forgotPassword = 'assets/illustrations/forgot-password.png';

  // final String forgotPassword = 'assets/illustrations/Forgot password.gif';d
  final String payment = 'assets/illustrations/payment.png';
  final String referAndEarn = 'assets/illustrations/refer&earn.png';

  // final String referAndEarn = 'assets/illustrations/Live collaboration.gif';
  final String chat = 'assets/illustrations/chat.png';
}

class _LottieAnimations {
  final String successful = 'assets/lottie/payment_successful.json';
  final String error = 'assets/lottie/error.json';
  final String notFound = 'assets/lottie/not-found.json';

}

class _Icons {
  final String home = 'assets/icons/home.png';
  final String homeActive = 'assets/icons/home-active.png';

  final String event = 'assets/icons/event.png';
  final String eventActive = 'assets/icons/event-active.png';

  final String fees = 'assets/icons/credit-card.png';
  final String feesActive = 'assets/icons/credit-card-active.png';

  final String chat = 'assets/icons/message.png';
  final String chatActive = 'assets/icons/message-active.png';

  final String settings = 'assets/icons/settings.png';
  final String settingsActive = 'assets/icons/settings-active.png';

  final String transactionArrows = 'assets/icons/transaction-arrows.png';
}
