import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolex_boutique/services/auth_service.dart';

class AuthDrawerSection extends StatelessWidget {
  const AuthDrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final user = authService.user;

    return user == null
        ? Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: const Icon(Icons.login, color: Colors.white),
              title:
                  const Text("Sign In", style: TextStyle(color: Colors.white)),
              onTap: () => authService.signInWithGoogle(),
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
                  title: Text(user.displayName ?? 'No Name',
                      style: const TextStyle(color: Colors.white)),
                  subtitle: Text(user.email ?? '',
                      style: const TextStyle(color: Colors.white70)),
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: const Text("Logout",
                      style: TextStyle(color: Colors.white)),
                  onTap: () => authService.signOut(),
                ),
              ],
            ),
          );
  }
}
