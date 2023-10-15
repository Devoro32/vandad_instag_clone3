//import 'package:vandad_insta_gram3/export.dart';

//constants
export 'package:vandad_insta_gram3/state/auth/constants/constants.dart';

//core
export 'package:flutter/material.dart';
//export 'package:flutter/foundation.dart';
export 'dart:convert';
export 'package:hooks_riverpod/hooks_riverpod.dart';

//facebook

//firebase

export 'package:firebase_core/firebase_core.dart';
export 'firebase_options.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:cloud_firestore/cloud_firestore.dart';

//screens
export 'package:vandad_insta_gram3/screens/sign_in.dart';
export 'package:vandad_insta_gram3/screens/sign_up.dart';
export 'package:vandad_insta_gram3/screens/home_screen.dart';

//state

export 'package:vandad_insta_gram3/state/auth/models/auth_result.dart';
export 'package:vandad_insta_gram3/state/posts/typdefs/user_id.dart';

//utils
export 'package:vandad_insta_gram3/utils/colors_utilis.dart';
export 'package:vandad_insta_gram3/utils/context_extension.dart';

//widgets
export 'package:vandad_insta_gram3/widgets/LogoWidget.dart';
export 'package:vandad_insta_gram3/widgets/text_widget.dart';
export 'package:vandad_insta_gram3/widgets/SignInOutButton.dart';
export 'package:vandad_insta_gram3/widgets/signUpRow.dart';

//services

export 'package:vandad_insta_gram3/abstract/x_base_firebase_service.dart';
export 'package:vandad_insta_gram3/abstract/x_base_firestore_services.dart';
export 'package:vandad_insta_gram3/state/auth/backend/x_firebase_auth.dart';
export 'package:vandad_insta_gram3/state/auth/backend/x_firestore_service.dart';

//X FILES- SCREENS
export 'package:vandad_insta_gram3/screens/x_screen/xhome_screen.dart';
export 'package:vandad_insta_gram3/screens/x_screen/xsign_in.dart';
export 'package:vandad_insta_gram3/screens/x_screen/xsign_up.dart';

//Provider
export 'package:vandad_insta_gram3/state/auth/provider/x_auth_pod.dart';
