import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instacare/state/home/home_bloc.dart';
import 'package:instacare/widgets/avatars/circle_avatar_with_text_label.dart';
import 'package:instacare/widgets/cards/appointment_preview_card.dart';
import 'package:instacare/widgets/list_tiles/doctor_list_tile.dart';
import 'package:instacare/widgets/main_nav_bar.dart';
import 'package:instacare/widgets/section_title.dart';
import 'package:models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Welcome", style: textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text('Billy L',
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: colorScheme.secondary,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text("New York", style: textTheme.bodySmall),
                const SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.expand_more,
                  color: colorScheme.secondary,
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_outlined)),
          const SizedBox(
            width: 8,
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search for doctors...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: colorScheme.onSurfaceVariant,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: colorScheme.background,
                      ))),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.error) {
            return const Center(
              child: Text("Error loading data"),
            );
          }
          if (state.status == HomeStatus.loading ||
              state.status == HomeStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                _DoctorCategories(),
                SizedBox(height: 24),
                _MySchedule(),
                SizedBox(height: 24),
                _NearbyDoctors(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const MainNavBar(),
    );
  }
}

class _DoctorCategories extends StatelessWidget {
  const _DoctorCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: "Categories",
              action: 'See all',
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: state.doctorCategories
                  .take(5)
                  .map((category) => Expanded(
                        child: CircleAvatarWithTextLabel(
                            icon: category.icon, label: category.name),
                      ))
                  .toList(),
            )
          ],
        );
      },
    );
  }
}

class _MySchedule extends StatelessWidget {
  const _MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: "My Schedule",
              action: 'See all',
              onPressed: () {},
            ),
            AppointmentPreviewCard(
                appointment: state.myAppointments.firstOrNull),
          ],
        );
      },
    );
  }
}

class _NearbyDoctors extends StatelessWidget {
  const _NearbyDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: "Nearby Doctors",
              action: 'See all',
              onPressed: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  Divider(height: 24, color: colorScheme.surfaceTint),
              itemCount: state.nearbyDoctors.length,
              itemBuilder: (context, index) {
                final doctor = state.nearbyDoctors[index];
                return DoctorListTile(doctor: doctor);
              },
            ),
          ],
        );
      },
    );
  }
}
