import 'package:easy_localization/easy_localization.dart';

class DiskSize {
  const DiskSize({final this.byte = 0});

  DiskSize.fromKibibyte(final double kibibyte)
      : this(byte: (kibibyte * 1024).round());
  DiskSize.fromMebibyte(final double mebibyte)
      : this(byte: (mebibyte * 1024 * 1024).round());
  DiskSize.fromGibibyte(final double gibibyte)
      : this(byte: (gibibyte * 1024 * 1024 * 1024).round());

  final int byte;

  double get kibibyte => byte / 1024.0;
  double get mebibyte => byte / 1024.0 / 1024.0;
  double get gibibyte => byte / 1024.0 / 1024.0 / 1024.0;

  DiskSize operator +(final DiskSize other) =>
      DiskSize(byte: byte + other.byte);
  DiskSize operator -(final DiskSize other) =>
      DiskSize(byte: byte - other.byte);
  DiskSize operator *(final double other) =>
      DiskSize(byte: (byte * other).round());

  @override
  String toString() {
    if (byte < 1024) {
      return '${byte.toStringAsFixed(0)} ${tr('bytes')}';
    } else if (byte < 1024 * 1024) {
      return 'providers.storage.kb'.tr(args: [kibibyte.toStringAsFixed(1)]);
    } else if (byte < 1024 * 1024 * 1024) {
      return 'providers.storage.mb'.tr(args: [mebibyte.toStringAsFixed(1)]);
    } else {
      return 'providers.storage.gb'.tr(args: [gibibyte.toStringAsFixed(1)]);
    }
  }
}
