import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:selfprivacy/logic/common_enum/common_enum.dart';
import 'package:selfprivacy/logic/cubit/client_jobs/client_jobs_cubit.dart';
import 'package:selfprivacy/logic/cubit/services/services_cubit.dart';
import 'package:selfprivacy/logic/models/job.dart';
import 'package:selfprivacy/logic/models/service.dart';
import 'package:selfprivacy/ui/components/brand_cards/brand_cards.dart';
import 'package:selfprivacy/ui/components/brand_hero_screen/brand_hero_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({required this.serviceId, final super.key});

  final String serviceId;

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(final BuildContext context) {
    final Service? service =
        context.watch<ServicesCubit>().state.getServiceById(widget.serviceId);

    if (service == null) {
      return const BrandHeroScreen(
        hasBackButton: true,
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      );
    }

    final bool serviceDisabled = service.status == ServiceStatus.inactive ||
        service.status == ServiceStatus.off;

    return BrandHeroScreen(
      hasBackButton: true,
      children: [
        Container(
          alignment: Alignment.center,
          child: SvgPicture.string(
            service.svgIcon,
            width: 48.0,
            height: 48.0,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          service.displayName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        const SizedBox(height: 16),
        ServiceStatusCard(status: service.status),
        const SizedBox(height: 16),
        if (service.url != null)
          ListTile(
            iconColor: Theme.of(context).colorScheme.onBackground,
            onTap: () => _launchURL(service.url),
            leading: const Icon(Icons.open_in_browser),
            title: Text(
              'Open in browser',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              service.url!.replaceAll('https://', ''),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        ListTile(
          iconColor: Theme.of(context).colorScheme.onBackground,
          onTap: () => {
            context.read<ServicesCubit>().restart(service.id),
          },
          leading: const Icon(Icons.restart_alt_outlined),
          title: Text(
            'services.service_page.restart'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ListTile(
          iconColor: Theme.of(context).colorScheme.onBackground,
          onTap: () => {
            context.read<JobsCubit>().createOrRemoveServiceToggleJob(
                  ServiceToggleJob(
                    type: _idToLegacyType(service.id),
                    needToTurnOn: serviceDisabled,
                  ),
                ),
          },
          leading: const Icon(Icons.power_settings_new),
          title: Text(
            serviceDisabled
                ? 'services.service_page.enable'.tr()
                : 'services.service_page.disable'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        if (service.isMovable)
          ListTile(
            iconColor: Theme.of(context).colorScheme.onBackground,
            onTap: () => {},
            leading: const Icon(Icons.drive_file_move_outlined),
            title: Text(
              'services.service_page.move'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
      ],
    );
  }

// TODO: Get rid as soon as possible
  ServiceTypes _idToLegacyType(final String serviceId) {
    switch (serviceId) {
      case 'mailserver':
        return ServiceTypes.mailserver;
      case 'jitsi':
        return ServiceTypes.jitsi;
      case 'bitwarden':
        return ServiceTypes.bitwarden;
      case 'nextcloud':
        return ServiceTypes.nextcloud;
      case 'pleroma':
        return ServiceTypes.pleroma;
      case 'gitea':
        return ServiceTypes.gitea;
      case 'ocserv':
        return ServiceTypes.ocserv;
      default:
        throw Exception('wrong state');
    }
  }
}

class ServiceStatusCard extends StatelessWidget {
  const ServiceStatusCard({
    required this.status,
    final super.key,
  });
  final ServiceStatus status;

  @override
  Widget build(final BuildContext context) {
    switch (status) {
      case ServiceStatus.active:
        return BrandCards.filled(
          child: const ListTile(
            leading: Icon(
              Icons.check_circle_outline,
              size: 24,
            ),
            title: Text('Up and running'),
          ),
        );
      case ServiceStatus.inactive:
        return BrandCards.filled(
          child: const ListTile(
            leading: Icon(
              Icons.stop_circle_outlined,
              size: 24,
            ),
            title: Text('Stopped'),
          ),
          tertiary: true,
        );
      case ServiceStatus.failed:
        return BrandCards.filled(
          child: const ListTile(
            leading: Icon(
              Icons.error_outline,
              size: 24,
            ),
            title: Text('Failed to start'),
          ),
          error: true,
        );
      case ServiceStatus.off:
        return BrandCards.filled(
          child: const ListTile(
            leading: Icon(
              Icons.power_settings_new,
              size: 24,
            ),
            title: Text('Disabled'),
          ),
          tertiary: true,
        );
      case ServiceStatus.activating:
        return BrandCards.filled(
          child: const ListTile(
            leading: Icon(
              Icons.restart_alt_outlined,
              size: 24,
            ),
            title: Text('Activating'),
          ),
          tertiary: true,
        );
      case ServiceStatus.deactivating:
        return BrandCards.filled(
          child: const ListTile(
            leading: Icon(
              Icons.restart_alt_outlined,
              size: 24,
            ),
            title: Text('Deactivating'),
          ),
          tertiary: true,
        );
      case ServiceStatus.reloading:
        return BrandCards.filled(
          child: const ListTile(
            leading: Icon(
              Icons.restart_alt_outlined,
              size: 24,
            ),
            title: Text('Restarting'),
          ),
          tertiary: true,
        );
    }
  }
}

void _launchURL(final url) async {
  try {
    final Uri uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } catch (e) {
    print(e);
  }
}