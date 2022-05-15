import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Constants {
  //Controllers

  //Date formats
  static final dateFormat = DateFormat("hh:mm a dd-MMM-yyyy");
  static final onlyDateFormat = DateFormat("dd-MMM-yyyy");
  static final onlyTimeFormat = DateFormat("hh:mm a");

  //Strings
  static const currencySymbol = '₹';

  //Login screen texts
  static const loginSubTitle = 'Sign in to get started';
  static const loginTitle = 'Login';
  static const loginButtonText = 'Login';

  // Forgot password screen texts
  static const forgotPasswordTitle = 'Forgot Password ?';
  static const forgotPasswordSubTitle =
      'Enter your email and we will send you a link to reset your password.';
  static const forgotPasswordButtonText = 'Forgot Password';

  // Referral code screen texts
  static const referralCodeTitle = 'Have a referral code ?';
  static const referralCodeSubTitle =
      'If You have sign up referral code you need to enter it here.';
  static const referralCodeButtonText = 'Redeem';

  // Refer & Earn screen texts
  static const referAndEarnTitle = 'Refer & Earn';
  static const referAndEarnSubTitle =
      'Share this code with a friend and you both could be eligible for 1000 points with of bonus under our referral program';
  static const shareCodeButton = 'Share Code';

  // Chat texts
  static const chatTitle = 'Chat';
  static const chatSubTitle = 'Select chat mode to start messaging';
  static const groupChatButtonText = 'Group Chat';
  static const chatWithAdminButtonText = 'Chat with Admin';

  //Pay fees button text
  static const payFeesButtonText = 'Pay';

  //Payment successful texts
  static const paymentSuccessfulTitle = 'Payment Successful';
  static const paymentSuccessfulSubTitle =
      'Hooray! Your payment process has been completed.';
  static const transactionDetailsButtonText = 'Transaction Details';

  //Padding
  static final EdgeInsets scaffoldPaddingWithoutSafeArea =
      EdgeInsets.symmetric(vertical: 28.w, horizontal: 34.w);

  static EdgeInsetsGeometry scaffoldPadding(context) =>
      EdgeInsets.symmetric(vertical: 28.w, horizontal: 34.w)
          .add(EdgeInsets.only(top: MediaQuery.of(context).padding.top));
}
