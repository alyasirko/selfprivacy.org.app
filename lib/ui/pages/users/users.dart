import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:selfprivacy/config/brand_colors.dart';
import 'package:selfprivacy/config/brand_theme.dart';
import 'package:selfprivacy/logic/cubit/app_config/app_config_cubit.dart';
import 'package:selfprivacy/logic/cubit/forms/user/user_form_cubit.dart';
import 'package:selfprivacy/logic/cubit/users/users_cubit.dart';
import 'package:selfprivacy/logic/models/user.dart';
import 'package:selfprivacy/ui/components/brand_button/brand_button.dart';
import 'package:selfprivacy/ui/components/brand_divider/brand_divider.dart';
import 'package:selfprivacy/ui/components/brand_header/brand_header.dart';
import 'package:selfprivacy/ui/components/brand_icons/brand_icons.dart';
import 'package:selfprivacy/ui/components/brand_modal_sheet/brand_modal_sheet.dart';
import 'package:selfprivacy/ui/components/brand_text/brand_text.dart';
import 'package:selfprivacy/ui/components/not_ready_card/not_ready_card.dart';

part 'fab.dart';
part 'new_user.dart';
part 'user_details.dart';
part 'user.dart';
part 'empty.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersCubit = context.watch<UsersCubit>();
    var isReady = context.watch<AppConfigCubit>().state.isFullyInitilized;
    final users = usersCubit.state.users;
    final isEmpty = usersCubit.state.isEmpty;

    Widget child;

    if (!isReady) {
      child = isNotReady();
    } else {
      child = isEmpty
          ? Container(
              alignment: Alignment.center,
              child: _NoUsers(
                text: 'Добавьте первого пользователя',
              ),
            )
          : ListView(
              children: [
                ...users.map((user) => _User(user: user)),
              ],
            );
    }

    return Scaffold(
      appBar: PreferredSize(
        child: BrandHeader(title: 'Пользователи'),
        preferredSize: Size.fromHeight(52),
      ),
      floatingActionButton: isReady ? _Fab() : null,
      body: child,
    );
  }

  Widget isNotReady() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: NotReadyCard(),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: _NoUsers(
                text:
                    'Подключите сервер, домен и DNS в разеде Провайдеры, чтобы добавить первого пользователя',
              ),
            ),
          ),
        )
      ],
    );
  }
}
