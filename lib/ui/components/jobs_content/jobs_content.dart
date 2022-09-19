import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selfprivacy/config/brand_theme.dart';
import 'package:selfprivacy/config/get_it_config.dart';
import 'package:selfprivacy/logic/cubit/client_jobs/client_jobs_cubit.dart';
import 'package:selfprivacy/logic/cubit/server_installation/server_installation_cubit.dart';
import 'package:selfprivacy/logic/cubit/server_jobs/server_jobs_cubit.dart';
import 'package:selfprivacy/logic/models/json/server_job.dart';
import 'package:selfprivacy/ui/components/action_button/action_button.dart';
import 'package:selfprivacy/ui/components/brand_alert/brand_alert.dart';
import 'package:selfprivacy/ui/components/brand_button/brand_button.dart';
import 'package:selfprivacy/ui/components/brand_cards/brand_cards.dart';
import 'package:selfprivacy/ui/components/brand_loader/brand_loader.dart';
import 'package:selfprivacy/ui/components/brand_text/brand_text.dart';
import 'package:selfprivacy/ui/components/jobs_content/server_job_card.dart';

class JobsContent extends StatelessWidget {
  const JobsContent({final super.key});

  @override
  Widget build(final BuildContext context) {
    final List<ServerJob> serverJobs =
        context.watch<ServerJobsCubit>().state.serverJobList;

    return BlocBuilder<JobsCubit, JobsState>(
      builder: (final context, final state) {
        late List<Widget> widgets;
        final ServerInstallationState installationState =
            context.read<ServerInstallationCubit>().state;
        if (state is JobsStateEmpty) {
          widgets = [
            const SizedBox(height: 80),
            Center(child: BrandText.body1('jobs.empty'.tr())),
          ];

          if (installationState is ServerInstallationFinished) {
            widgets = [
              ...widgets,
              const SizedBox(height: 80),
              BrandButton.rised(
                onPressed: () => context.read<JobsCubit>().upgradeServer(),
                text: 'jobs.upgradeServer'.tr(),
              ),
              const SizedBox(height: 10),
              BrandButton.text(
                onPressed: () {
                  final NavigationService nav = getIt<NavigationService>();
                  nav.showPopUpDialog(
                    BrandAlert(
                      title: 'jobs.rebootServer'.tr(),
                      contentText: 'modals.3'.tr(),
                      actions: [
                        ActionButton(
                          text: 'basis.cancel'.tr(),
                        ),
                        ActionButton(
                          onPressed: () =>
                              {context.read<JobsCubit>().rebootServer()},
                          text: 'modals.9'.tr(),
                        )
                      ],
                    ),
                  );
                },
                title: 'jobs.rebootServer'.tr(),
              ),
            ];
          }
        } else if (state is JobsStateLoading) {
          widgets = [
            const SizedBox(height: 80),
            BrandLoader.horizontal(),
          ];
        } else if (state is JobsStateWithJobs) {
          widgets = [
            ...state.clientJobList
                .map(
                  (final j) => Row(
                    children: [
                      Expanded(
                        child: BrandCards.small(
                          child: Text(j.title),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.errorContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () =>
                            context.read<JobsCubit>().removeJob(j.id),
                        child: Text(
                          'basis.remove'.tr(),
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            const SizedBox(height: 20),
            BrandButton.rised(
              onPressed: () => context.read<JobsCubit>().applyAll(),
              text: 'jobs.start'.tr(),
            ),
          ];
        }
        return ListView(
          padding: paddingH15V0,
          children: [
            const SizedBox(height: 15),
            Center(
              child: BrandText.h2(
                'jobs.title'.tr(),
              ),
            ),
            const SizedBox(height: 20),
            ...widgets,
            const SizedBox(height: 8),
            const Divider(height: 0),
            const SizedBox(height: 8),
            if (serverJobs.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'jobs.server_jobs'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ...serverJobs.map(
              (final job) => Dismissible(
                key: ValueKey(job.uid),
                direction: job.status == JobStatusEnum.finished ||
                        job.status == JobStatusEnum.error
                    ? DismissDirection.horizontal
                    : DismissDirection.none,
                child: ServerJobCard(
                  serverJob: job,
                ),
                onDismissed: (final direction) {
                  context.read<ServerJobsCubit>().removeServerJob(job.uid);
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
