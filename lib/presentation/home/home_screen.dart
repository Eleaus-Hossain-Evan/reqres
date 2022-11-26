import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres/application/home/home_provider.dart';
import 'package:reqres/presentation/details/deatils_screen.dart';
import 'package:reqres/presentation/widgets/k_inkwell.dart';
import 'package:reqres/utils/text_theme_style_x.dart';
import 'package:reqres/utils/ui_constant.dart';

import '../../application/global.dart';

class HomeScreen extends HookConsumerWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    ref.listen(homeProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        showLoading();
      } else {
        closeLoading();
      }
    });

    useEffect(() {
      Future.microtask(() => ref.read(homeProvider.notifier).getData());

      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GridView.builder(
        padding: padding16,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
        ),
        itemCount: state.users.length,
        itemBuilder: (context, index) {
          return KInkWell(
            onTap: () => context
                .push('${DetailScreen.routeName}/${state.users[index].id}'),
            child: GridTile(
              footer: Container(
                padding: padding8,
                decoration: BoxDecoration(
                  color: context.color.primary.withOpacity(0.8),
                ),
                child: Text(
                  '${state.users[index].first_name} ${state.users[index].last_name}',
                  style: TextStyle(
                    color: context.color.onPrimary,
                  ),
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: state.users[index].avatar,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
