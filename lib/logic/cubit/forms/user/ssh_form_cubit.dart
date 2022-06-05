// ignore_for_file: always_specify_types

import 'dart:async';

import 'package:cubit_form/cubit_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:selfprivacy/logic/cubit/jobs/jobs_cubit.dart';
import 'package:selfprivacy/logic/models/job.dart';
import 'package:selfprivacy/logic/models/hive/user.dart';

class SshFormCubit extends FormCubit {
  SshFormCubit({
    required this.jobsCubit,
    required this.user,
  }) {
    final RegExp keyRegExp = RegExp(
        r'^(ssh-rsa AAAAB3NzaC1yc2|ssh-ed25519 AAAAC3NzaC1lZDI1NTE5)[0-9A-Za-z+/]+[=]{0,3}( .*)?$',);

    key = FieldCubit(
      initalValue: '',
      validations: [
        ValidationModel(
          (final String newKey) => user.sshKeys.any((final String key) => key == newKey),
          'validations.key_already_exists'.tr(),
        ),
        RequiredStringValidation('validations.required'.tr()),
        ValidationModel<String>((final String s) {
          print(s);
          print(keyRegExp.hasMatch(s));
          return !keyRegExp.hasMatch(s);
        }, 'validations.invalid_format'.tr(),),
      ],
    );

    super.addFields([key]);
  }

  @override
  FutureOr<void> onSubmit() {
    print(key.state.isValid);
    jobsCubit.addJob(CreateSSHKeyJob(user: user, publicKey: key.state.value));
  }

  late FieldCubit<String> key;

  final JobsCubit jobsCubit;
  final User user;
}
