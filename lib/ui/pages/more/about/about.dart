import 'package:flutter/material.dart';
import 'package:selfprivacy/config/brand_theme.dart';
import 'package:selfprivacy/ui/components/brand_header/brand_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:selfprivacy/ui/components/brand_md/brand_md.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({final super.key});

  @override
  Widget build(final BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: BrandHeader(
              title: 'more.about_project'.tr(),
              hasBackButton: true,
            ),
          ),
          body: ListView(
            padding: paddingH15V0,
            children: const [
              BrandMarkdown(
                fileName: 'about',
              ),
            ],
          ),
        ),
      );
}
