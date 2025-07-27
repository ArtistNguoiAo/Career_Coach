import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitHubOAuthService {
  static const String _clientId = 'Ov23liApq2x05eyOFZP0';
  static const String _clientSecret = '03579f01ddab0de6d5222cd7a53a3362f8ad6b6d';
  static const String _redirectUri = 'careercoach://auth/github/callback';

  static Future<String?> signInWithGitHub(BuildContext context) async {
    try {
      final result = await Navigator.of(
        context,
      ).push<String>(MaterialPageRoute(builder: (context) => _GitHubOAuthWebView()));

      if (result != null && result.isNotEmpty) {
        return result;
      }
      return null;
    } catch (error) {
      return null;
    }
  }

  static Future<String?> getIdToken(BuildContext context) async {
    return await signInWithGitHub(context);
  }
}

class _GitHubOAuthWebView extends StatefulWidget {
  @override
  _GitHubOAuthWebViewState createState() => _GitHubOAuthWebViewState();
}

class _GitHubOAuthWebViewState extends State<_GitHubOAuthWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            _handleUrl(url);
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      );

    // Build GitHub OAuth URL
    final authUrl = Uri.https('github.com', '/login/oauth/authorize', {
      'client_id': GitHubOAuthService._clientId,
      'redirect_uri': GitHubOAuthService._redirectUri,
      'scope': 'user:email read:user',
      'state': DateTime.now().millisecondsSinceEpoch.toString(),
    });

    _controller.loadRequest(authUrl);
  }

  void _handleUrl(String url) {

    if (url.startsWith(GitHubOAuthService._redirectUri)) {
      final uri = Uri.parse(url);
      final code = uri.queryParameters['code'];
      final error = uri.queryParameters['error'];

      if (error != null) {
        Navigator.of(context).pop(null);
        return;
      }

      if (code != null) {
        _exchangeCodeForToken(code);
        return;
      }
    }
  }

  Future<void> _exchangeCodeForToken(String code) async {
    try {
      // Exchange authorization code for access token
      final dio = Dio();
      final response = await dio.post(
        'https://github.com/login/oauth/access_token',
        data: {
          'client_id': GitHubOAuthService._clientId,
          'client_secret': GitHubOAuthService._clientSecret,
          'code': code,
        },
        options: Options(
          headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final accessToken = data['access_token'];

        if (accessToken != null) {
          Navigator.of(context).pop(accessToken);
          return;
        }
      }

      Navigator.of(context).pop(null);
    } catch (e) {
      Navigator.of(context).pop(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Login'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
