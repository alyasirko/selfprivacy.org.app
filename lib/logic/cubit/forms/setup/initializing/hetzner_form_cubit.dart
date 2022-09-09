import 'dart:async';

import 'package:cubit_form/cubit_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:selfprivacy/logic/api_maps/hetzner.dart';
import 'package:selfprivacy/logic/cubit/server_installation/server_installation_cubit.dart';
import 'package:selfprivacy/logic/cubit/forms/validations/validations.dart';

class HetznerFormCubit extends FormCubit {
  HetznerFormCubit(this.serverInstallationCubit) {
    final RegExp regExp = RegExp(r'\s+|[-!$%^&*()@+|~=`{}\[\]:<>?,.\/]');
    apiKey = FieldCubit(
      initalValue: '',
      validations: [
        RequiredStringValidation('validations.required'.tr()),
        ValidationModel<String>(
          regExp.hasMatch,
          'validations.key_format'.tr(),
        ),
        LengthStringNotEqualValidation(64)
      ],
    );

    super.addFields([apiKey]);
  }

  @override
  FutureOr<void> onSubmit() async {
    serverInstallationCubit.setHetznerKey(apiKey.state.value);
  }

  final ServerInstallationCubit serverInstallationCubit;

  late final FieldCubit<String> apiKey;

  @override
  FutureOr<bool> asyncValidation() async {
    late bool isKeyValid;
    final HetznerApi apiClient = HetznerApi(isWithToken: false);

    try {
      isKeyValid = await apiClient.isValid(apiKey.state.value);
    } catch (e) {
      addError(e);
    }

    if (!isKeyValid) {
      apiKey.setError('bad key');
      return false;
    }
    return true;
  }
}