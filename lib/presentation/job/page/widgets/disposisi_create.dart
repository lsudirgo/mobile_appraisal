// import 'package:animated_custom_dropdown/custom_dropdown.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_appraisal/core/components/button_dialog.dart';
// import 'package:mobile_appraisal/core/components/buttons.dart';
// import 'package:mobile_appraisal/core/components/spaces.dart';
// import 'package:mobile_appraisal/core/constants/colors.dart';

// class DisposisiCreate extends StatelessWidget {
  // final Map<String, String?> diposisiData;
  // const DisposisiCreate({super.key, required this.diposisiData});

  // @override
  // Widget build(BuildContext context) {
    
  // }

  // return showBottomDialog(
  //   enableDrag: true,
  //   isDismissible: true,
  //   context: context,
  //   heightFactor: 0.7,
  //   paddingTop: 6,
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       const Padding(
  //         padding: EdgeInsets.all(4.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Icon(
  //               Icons.apps,
  //               size: 30,
  //               color: AppColors.primary,
  //             ),
  //             SpaceWidth(4),
  //             Text(
  //               'Disposisi Order',
  //               style: TextStyle(
  //                 fontSize: AppSizeFont.xl,
  //                 color: AppColors.primary,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SpaceHeight(4),
  //       Card(
  //         shadowColor: AppColors.primary,
  //         color: AppColors.white,
  //         elevation: 3,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //         child: Stack(
  //           children: [
  //             Positioned.fill(
  //               left: 250,
  //               right: 0,
  //               top: 0,
  //               bottom: 0,
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(12),
  //                 child: Opacity(
  //                   opacity: 0.30,
  //                   child: Image.asset(
  //                     Assets.images.bgCard.path,
  //                     width: MediaQuery.of(context).size.width,
  //                     height: MediaQuery.of(context).size.height,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       const Icon(
  //                         Icons.supervised_user_circle_rounded,
  //                         color: AppColors.greydark,
  //                         size: AppSizeFont.md,
  //                       ),
  //                       const SpaceWidth(2),
  //                       Text(
  //                         result.data[index].orderName,
  //                         style: const TextStyle(
  //                           fontSize: AppSizeFont.md,
  //                           color: AppColors.greydark,
  //                         ),
  //                       ),
  //                       const SpaceWidth(4),
  //                       Text(
  //                         '- ${result.data[index].orderType}',
  //                         style: const TextStyle(
  //                           fontSize: AppSizeFont.md,
  //                           color: AppColors.greydark,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   const SpaceHeight(4),
  //                   Row(
  //                     children: [
  //                       const Icon(
  //                         Icons.home_work_rounded,
  //                         color: AppColors.greydark,
  //                         size: AppSizeFont.md,
  //                       ),
  //                       const SpaceWidth(2),
  //                       Text(
  //                         result.data[index].orderBranchName,
  //                         style: const TextStyle(
  //                           fontSize: AppSizeFont.md,
  //                           color: AppColors.greydark,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   const SpaceHeight(4),
  //                   Row(
  //                     children: [
  //                       const Icon(
  //                         Icons.surround_sound_rounded,
  //                         color: AppColors.greydark,
  //                         size: AppSizeFont.md,
  //                       ),
  //                       const SpaceWidth(2),
  //                       Text(
  //                         result.data[index].orderSource,
  //                         style: const TextStyle(
  //                           fontSize: AppSizeFont.md,
  //                           color: AppColors.greydark,
  //                         ),
  //                       ),
  //                       const SpaceWidth(4),
  //                       Text(
  //                         result.data[index].orderNo.replaceAll(' ', ''),
  //                         style: const TextStyle(
  //                           fontSize: AppSizeFont.md,
  //                           color: AppColors.greydark,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   const SpaceHeight(4),
  //                   Row(
  //                     children: [
  //                       const Icon(
  //                         Icons.category_outlined,
  //                         color: AppColors.greydark,
  //                         size: AppSizeFont.md,
  //                       ),
  //                       const SpaceWidth(2),
  //                       Text(
  //                         result.data[index].orderjenisObjek.detailName,
  //                         style: const TextStyle(
  //                           fontSize: AppSizeFont.md,
  //                           color: AppColors.greydark,
  //                         ),
  //                       ),
  //                       const SpaceWidth(4),
  //                       Expanded(
  //                         child: Text(
  //                           result.data[index].orderType != 'Review'
  //                               ? ' - ${result.data[index].orderjenisObjek.detailAlamat}'
  //                               : '',
  //                           style: const TextStyle(
  //                             fontSize: AppSizeFont.md,
  //                             color: AppColors.greydark,
  //                           ),
  //                           maxLines: 1,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Visibility(
  //         visible: result.data[index].orderType != 'Review',
  //         child: Column(
  //           children: [
  //             const SpaceHeight(12.0),
  //             Container(
  //               height: 60,
  //               width: MediaQuery.of(context).size.width,
  //               decoration: const BoxDecoration(
  //                 color: AppColors.white,
  //                 borderRadius: BorderRadius.all(
  //                   Radius.circular(
  //                     12.0,
  //                   ),
  //                 ),
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: AppColors.grey,
  //                     blurRadius: 1.0,
  //                   ),
  //                 ],
  //               ),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     BlocConsumer<ListUserDisposisiBloc,
  //                         ListUserDisposisiState>(
  //                       listener: (context, state) {
  //                         state.maybeWhen(
  //                           orElse: () {},
  //                           error: (error) {
  //                             final snackBar = SnackBar(
  //                               elevation: 0,
  //                               behavior: SnackBarBehavior.floating,
  //                               backgroundColor: Colors.transparent,
  //                               content: AwesomeSnackbarContent(
  //                                 title: 'Error',
  //                                 message: error,
  //                                 contentType: ContentType.warning,
  //                               ),
  //                             );

  //                             ScaffoldMessenger.of(context)
  //                               ..hideCurrentSnackBar()
  //                               ..showSnackBar(snackBar);
  //                           },
  //                           success: (result) {
  //                             _dropdownDisposisiItems = result.data
  //                                 .map((datum) => ListuserdisposisiDropdown(
  //                                       datum.userId,
  //                                       datum.userFullName,
  //                                       datum.userUnitKerjaId,
  //                                       datum.countuserPending,
  //                                     ))
  //                                 .toList();
  //                           },
  //                         );
  //                       },
  //                       builder: (context, state) {
  //                         return state.maybeWhen(
  //                           success: (result) {
  //                             return CustomDropdown<
  //                                 ListuserdisposisiDropdown>.search(
  //                               hintText: 'Pilih Petugas OTS',
  //                               decoration: const CustomDropdownDecoration(
  //                                 errorStyle: TextStyle(
  //                                   color: Colors.redAccent,
  //                                 ),
  //                                 expandedSuffixIcon: Icon(
  //                                   Icons.arrow_drop_up,
  //                                   color: AppColors.primary,
  //                                 ),
  //                                 prefixIcon: Icon(
  //                                   Icons.search,
  //                                   color: AppColors.primary,
  //                                 ),
  //                                 expandedBorder: Border.fromBorderSide(
  //                                   BorderSide(color: AppColors.primary),
  //                                 ),
  //                                 headerStyle: TextStyle(
  //                                   color: AppColors.primary,
  //                                 ),
  //                                 expandedBorderRadius: BorderRadius.all(
  //                                   Radius.circular(
  //                                     12.0,
  //                                   ),
  //                                 ),
  //                               ),
  //                               items: _dropdownDisposisiItems,
  //                               initialItem: _selectedDropdownDisposisi,
  //                               key: ValueKey(_selectedDropdownDisposisi?.id),
  //                               onChanged: (v) {
  //                                 setState(() {
  //                                   _selectedDropdownDisposisi = v;
  //                                 });
  //                                 // _checkFormRequredUpdateProfile();
  //                               },
  //                             );
  //                           },
  //                           loading: () {
  //                             return CustomDropdown.search(
  //                               hintText: 'Searching User Reviewer...',
  //                               disabledDecoration:
  //                                   const CustomDropdownDisabledDecoration(
  //                                 suffixIcon: SizedBox(
  //                                     height: 20,
  //                                     width: 20,
  //                                     child: CircularProgressIndicator()),
  //                               ),
  //                               items: null,
  //                               excludeSelected: false,
  //                               enabled: false,
  //                               onChanged: (value) {},
  //                             );
  //                           },
  //                           orElse: () {
  //                             return CustomDropdown<void>.search(
  //                               hintText: 'Pilih Petugas OTS',
  //                               decoration: const CustomDropdownDecoration(
  //                                 errorStyle: TextStyle(
  //                                   color: Colors.redAccent,
  //                                 ),
  //                                 expandedSuffixIcon: Icon(
  //                                   Icons.arrow_drop_up,
  //                                   color: AppColors.primary,
  //                                 ),
  //                                 prefixIcon: Icon(
  //                                   Icons.search,
  //                                   color: AppColors.primary,
  //                                 ),
  //                                 expandedBorder: Border.fromBorderSide(
  //                                   BorderSide(color: AppColors.primary),
  //                                 ),
  //                                 headerStyle: TextStyle(
  //                                   color: AppColors.primary,
  //                                 ),
  //                                 expandedBorderRadius: BorderRadius.all(
  //                                   Radius.circular(
  //                                     12.0,
  //                                   ),
  //                                 ),
  //                               ),
  //                               items: null,
  //                               excludeSelected: false,
  //                               onChanged: (value) {},
  //                             );
  //                           },
  //                         );
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SpaceHeight(12.0),
  //       Container(
  //         height: 60,
  //         width: MediaQuery.of(context).size.width,
  //         decoration: const BoxDecoration(
  //           color: AppColors.white,
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(
  //               12.0,
  //             ),
  //           ),
  //           boxShadow: [
  //             BoxShadow(
  //               color: AppColors.grey,
  //               blurRadius: 1.0,
  //             ),
  //           ],
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               CustomDropdown<void>.search(
  //                 hintText: 'Pilih Petugas On Desk',
  //                 decoration: const CustomDropdownDecoration(
  //                   errorStyle: TextStyle(
  //                     color: Colors.redAccent,
  //                   ),
  //                   expandedSuffixIcon: Icon(
  //                     Icons.arrow_drop_up,
  //                     color: AppColors.primary,
  //                   ),
  //                   prefixIcon: Icon(
  //                     Icons.search,
  //                     color: AppColors.primary,
  //                   ),
  //                   expandedBorder: Border.fromBorderSide(
  //                     BorderSide(color: AppColors.primary),
  //                   ),
  //                   headerStyle: TextStyle(
  //                     color: AppColors.primary,
  //                   ),
  //                   expandedBorderRadius: BorderRadius.all(
  //                     Radius.circular(
  //                       12.0,
  //                     ),
  //                   ),
  //                 ),
  //                 items: null,
  //                 excludeSelected: false,
  //                 onChanged: (value) {},
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       const Spacer(),
  //       Padding(
  //         padding: const EdgeInsets.all(12.0),
  //         child: Button.filled(
  //           color: AppColors.secondary,
  //           onPressed: () {},
  //           label: 'Disposisi',
  //         ),
  //       )
  //     ],
  //   ),
  // );
// }
