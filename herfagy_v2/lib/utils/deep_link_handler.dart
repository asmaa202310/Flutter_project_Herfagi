import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:herfagy_v2/views/forget_password/update_password_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeepLinkHandler extends StatefulWidget {
  const DeepLinkHandler({super.key});

  @override
  State<DeepLinkHandler> createState() => _DeepLinkHandlerState();
}

class _DeepLinkHandlerState extends State<DeepLinkHandler> {
  late final AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  bool _handledInitialLink = false;

  @override
  void initState() {
    super.initState();
    _initDeepLinks();
  }

  Future<void> _initDeepLinks() async {
    _appLinks = AppLinks();

    final initialLink = await _appLinks.getInitialLink();
    if (!_handledInitialLink && initialLink != null) {
      _handledInitialLink = true;
      _handleDeepLink(initialLink);
    }

    _linkSubscription = _appLinks.uriLinkStream.listen(
      _handleDeepLink,
      onError: (err) => debugPrint("Deep link error: $err"),
    );
  }

  Future<void> _handleDeepLink(Uri uri) async {
    final prefs = await SharedPreferences.getInstance();

    if (uri.host == "reset-callback") {
      final handled = prefs.getBool('handled_reset_link') ?? false;
      if (handled) return;
      await prefs.setBool('handled_reset_link', true);
      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const UpdatePasswordView()),
      );
    }
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
