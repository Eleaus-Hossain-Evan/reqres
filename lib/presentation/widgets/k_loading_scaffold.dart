import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KLoadingScaffold extends HookConsumerWidget {
  const KLoadingScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    required this.loading,
  }) : super(key: key);

  final AppBar? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool loading;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: loading ? null : appBar,
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : body,
      bottomNavigationBar: loading ? null : bottomNavigationBar,
      floatingActionButton: loading ? null : floatingActionButton,
    );
  }
}
