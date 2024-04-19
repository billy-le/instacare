import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:models/models.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({
    super.key,
    required this.doctor,
    this.showAbout = true,
    this.showMoreInfo = true,
  });

  final Doctor doctor;
  final bool showAbout;
  final bool showMoreInfo;

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final moreInformation = [
      {
        'icon': Icons.account_circle_outlined,
        'label': "Patients",
        'value': widget.doctor.patientCount,
      },
      {
        'icon': Icons.star_border,
        'label': "Experience",
        'value':
            "${widget.doctor.yearsOfExperience} ${widget.doctor.yearsOfExperience < 2 ? 'year' : 'years'}",
      },
      {
        'icon': Icons.favorite_border,
        'label': "Rating",
        'value': widget.doctor.rating,
      },
      {
        'icon': Icons.numbers,
        'label': "Reviews",
        'value': widget.doctor.reviewCount,
      }
    ];

    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: colorScheme.background,
                backgroundImage: NetworkImage(widget.doctor.profileImageUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctor.name,
                      style: textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.doctor.category.name,
                      style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onBackground.withOpacity(0.5)),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: colorScheme.secondary, size: 16),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${widget.doctor.address.city}, ${widget.doctor.address.state}",
                          style: textTheme.bodySmall!.copyWith(
                            color: colorScheme.onBackground.withOpacity(0.5),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(
            height: 32,
            color: colorScheme.surfaceVariant,
          ),
          ...widget.showAbout
              ? [
                  Text(
                    'About',
                    style: textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.doctor.bio,
                    maxLines: showAll ? null : 3,
                    style: textTheme.bodyMedium!.copyWith(
                      color: colorScheme.onBackground.withOpacity(0.5),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () {
                      setState(() {
                        showAll = !showAll;
                      });
                    },
                    child: Text(
                      showAll ? 'Show less' : "Show all",
                    ),
                  )
                ]
              : [],
          const SizedBox(height: 12),
          ...widget.showMoreInfo
              ? [
                  Row(
                    children: moreInformation
                        .map((info) => Expanded(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: colorScheme.primary,
                                    foregroundColor: colorScheme.onPrimary,
                                    child: Icon(info['icon'] as IconData),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(info['value'].toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodyLarge!.copyWith(
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    info['label'] as String,
                                    style: textTheme.bodySmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ]
              : [],
        ],
      ),
    );
  }
}
