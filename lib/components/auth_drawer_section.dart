import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/services/auth_service.dart';

class AuthDrawerSection extends StatefulWidget {
  const AuthDrawerSection({super.key});

  @override
  State<AuthDrawerSection> createState() => _AuthDrawerSectionState();
}

class _AuthDrawerSectionState extends State<AuthDrawerSection> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final user = authService.user;

    return user == null
        ? Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: _isLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  )
                : ListTile(
                    leading: const Icon(Icons.login, color: Colors.white),
                    title: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await authService.signInWithGoogle();
                      setState(() {
                        _isLoading = false;
                      });
                    },
                  ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.photoURL ?? ''),
                  ),
                  title: Text(
                    user.displayName ?? 'No Name',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    user.email ?? '',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => authService.signOut(),
                ),
              ],
            ),
          );
  }
}
