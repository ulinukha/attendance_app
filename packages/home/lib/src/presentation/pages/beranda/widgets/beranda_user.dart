part of '../beranda_page.dart';

class BerandaUser extends StatelessWidget {
  const BerandaUser({super.key});

  @override
  Widget build(BuildContext context) {
    final company =
        context.select((BerandaCubit cubit) => cubit.state.company);
    final string = context.intl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Company : ${company.title ?? ''}",
          style: DsBoldText.header5,
        ).marginOnly(bottom: 4),
        Expanded(
          child: Stack(
            children: [
              BlocSelector<BerandaCubit, BerandaState, List<Attendance>>(
                selector: (state) => state.attendances, 
                builder: (context, state) => ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) => _buildListAttendance(company, state[index]),)
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: BaseInkWell(
                  onTap: () => context.read<BerandaCubit>().addAtendance(context, string),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: DsColors.dsPrimary,
                      shape: BoxShape.circle
                    ),
                    width: 64,
                    height: 64,
                    child: const Center(
                      child: Icon(
                        Icons.post_add_rounded,
                        weight: 32,
                        color: DsColors.dsWhite,
                      ),
                    ),
                  ).marginAll(16),
                ),
                
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildListAttendance(Company company, Attendance attendance) {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: DsColors.neutral.shade300,
            borderRadius: BorderRadius.circular(12)
          ),
          child: const ImageNetwork("https://cdn-icons-png.flaticon.com/512/8893/8893666.png",
            boxFit: BoxFit.cover,
          ),
        ).marginOnly(right: 7),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(attendance.name ?? '',
              style: DsBoldText.header5,
            ).marginOnly(bottom: 3),
            Text("Distance ${haversine(
              attendance.latitude ?? 0, 
              attendance.longitude ?? 0, 
              company.latitude ?? 0,
              company.longitude ?? 0).toStringAsFixed(2)} meter",
              style: DsMediumText.body1,
            ).marginOnly(bottom: 3),
            Text(DateFormat('MMM d yyyy, HH:mm').format(
              DateTime.parse(attendance.time ?? '')),
              style: DsMediumText.body1,
            ),
          ],
        )
      ],
    ).marginOnly(bottom: 12);
  }
}