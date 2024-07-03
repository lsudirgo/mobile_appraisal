import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_appraisal/data/datasources/master/list_master_datasource.dart';
import 'package:mobile_appraisal/data/datasources/profile/profile_update_datasource.dart';
import 'package:mobile_appraisal/data/models/request/profile/profile_update_request_model.dart';
import 'package:mobile_appraisal/data/models/response/master/list_dropdown_jabatan.dart';
import 'package:mobile_appraisal/presentation/master/bloc/listjabatan/listjabatan_bloc.dart';
import 'package:mobile_appraisal/presentation/profile/bloc/updateprofile/updateprofile_bloc.dart';
import 'package:mobile_appraisal/presentation/profile/pages/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/core.dart';

class ProfileUpdatePage extends StatefulWidget {
  final Map<String, String?> profileData;
  const ProfileUpdatePage({super.key, required this.profileData});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  late TextEditingController _nipUpdateTextController;
  late TextEditingController _nameUpdateTextController;
  bool _btndisableUpdateProfile = true;
  String? _selectedGender;
  String? _selectedLevelOption;
  List<ListjabatanDropdown> _dropdownItems = [];
  ListjabatanDropdown? _selectedJabatan;
  final List<String> _options = [
    'Staff',
    'Officer',
    'Supervisor',
    'Manager',
    'Head'
  ];

  final ListjabatanBloc _listmasterJabatanBloc =
      ListjabatanBloc(ListMasterRemoteDatasource());
  void _onClickgetlistjabatan() {
    _listmasterJabatanBloc.add(const ListjabatanEvent.listJabatan(1, 100, ''));
  }

  void _checkFormRequredUpdateProfile() {
    if (_selectedGender!.isNotEmpty &&
        _selectedLevelOption!.isNotEmpty &&
        _selectedJabatan!.id.isNotEmpty) {
      _btndisableUpdateProfile = false;
    }
  }

  final UpdateprofileBloc _updateprofileBloc =
      UpdateprofileBloc(ProfileUpdateRemoteDatasource());

  void _onClickUpdateProfile() {
    ProfileUpdate profileUpdate = ProfileUpdate(
      level: _selectedLevelOption,
      jabatanID: _selectedJabatan!.id,
      gender: _selectedGender,
    );
    _updateprofileBloc
        .add(UpdateprofileEvent.updateprofile(profileUpdate: profileUpdate));
  }

  @override
  void initState() {
    _onClickgetlistjabatan();
    _nipUpdateTextController =
        TextEditingController(text: widget.profileData['nip']);
    _nameUpdateTextController =
        TextEditingController(text: widget.profileData['name']);
    _selectedGender = widget.profileData['gender'];
    _selectedLevelOption = widget.profileData['level'] ?? 'Staff';
    // _selectedJabatan = widget.profileData['idbagian'];
    super.initState();
  }

  @override
  void dispose() {
    _nipUpdateTextController = TextEditingController();
    _nameUpdateTextController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ClipPathClassAppBar(),
          child: Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_circle_left,
                          size: 40.0,
                          color: AppColors.white,
                          opticalSize: 200,
                        ),
                      ),
                      const Text(
                        "Update Profile",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: AppSizeFont.lg,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => _listmasterJabatanBloc,
          ),
          BlocProvider(
            create: (context) => _updateprofileBloc,
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: _nipUpdateTextController,
                          label: '',
                          showLabel: false,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.account_circle_rounded,
                            ),
                          ),
                          readOnly: true,
                        ),
                        const SpaceHeight(3),
                        CustomTextField(
                          controller: _nameUpdateTextController,
                          label: '',
                          showLabel: false,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person_rounded,
                            ),
                          ),
                          readOnly: true,
                        ),
                        const SpaceHeight(15),
                        const Text(
                          "Jabatan",
                          style: TextStyle(
                            fontSize: AppSizeFont.lg,
                            color: AppColors.greydark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SpaceHeight(1),
                        BlocConsumer<ListjabatanBloc, ListjabatanState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              error: (error) {
                                showBottomDialog(
                                  context: context,
                                  heightFactor: 0.3,
                                  paddingTop: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Image.asset(
                                          AppConfig.imgEmptyDataNull.toString(),
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SpaceHeight(4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.info_outline_rounded,
                                            size: 50,
                                            color: AppColors.red,
                                          ),
                                          const SpaceWidth(8),
                                          Expanded(
                                            child: Text(
                                              error,
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                fontSize: AppSizeFont.md,
                                                color: AppColors.greydark,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              orElse: () {},
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                              success: (result) {
                                _dropdownItems = result.data
                                    .map((datum) => ListjabatanDropdown(
                                          datum.jabatanId,
                                          datum.jabatanFullName,
                                        ))
                                    .toList();

                                if (_dropdownItems.isNotEmpty) {
                                  if (widget.profileData
                                          .containsKey('idbagian') &&
                                      widget.profileData['idbagian'] != null) {
                                    _selectedJabatan =
                                        _dropdownItems.firstWhere(
                                      (item) =>
                                          item.id ==
                                          widget.profileData['idbagian'],
                                      orElse: () => const ListjabatanDropdown(
                                          'J0000000032',
                                          'Collateral Valuation Staf'),
                                    );
                                  }
                                  _selectedJabatan ??
                                      const ListjabatanDropdown('J0000000032',
                                          'Collateral Valuation Staf');
                                }

                                return CustomDropdown<
                                    ListjabatanDropdown>.search(
                                  excludeSelected: false,
                                  hintText: 'Pilih Jabatan',
                                  items: _dropdownItems,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedJabatan = value;
                                    });
                                    _checkFormRequredUpdateProfile();
                                  },
                                  initialItem: _selectedJabatan,
                                );
                              },
                              loading: () {
                                return CustomDropdown.search(
                                  hintText: 'Searching Jabatan...',
                                  disabledDecoration:
                                      const CustomDropdownDisabledDecoration(
                                    suffixIcon: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator()),
                                  ),
                                  items: null,
                                  excludeSelected: false,
                                  enabled: false,
                                  onChanged: (value) {},
                                );
                              },
                              orElse: () {
                                return CustomDropdown<
                                    ListjabatanDropdown>.search(
                                  hintText: 'Pilih Jabatan',
                                  items: null,
                                  excludeSelected: false,
                                  onChanged: (value) {},
                                );
                              },
                            );
                          },
                        ),
                        const SpaceHeight(10),
                        const Text(
                          "Jenis kelamin",
                          style: TextStyle(
                            fontSize: AppSizeFont.lg,
                            color: AppColors.greydark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SpaceHeight(1),
                        RadioListTile<String>(
                          toggleable: true,
                          tileColor: AppColors.white,
                          value: 'Laki - laki',
                          groupValue: _selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedGender = value;
                              _checkFormRequredUpdateProfile();
                            });
                          },
                          title: const Text(
                            "Laki - laki",
                            style: TextStyle(
                              fontSize: AppSizeFont.lg,
                              color: AppColors.greydark,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        RadioListTile<String>(
                          tileColor: AppColors.white,
                          toggleable: true,
                          value: 'Wanita',
                          groupValue: _selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedGender = value;
                              _checkFormRequredUpdateProfile();
                            });
                          },
                          title: const Text(
                            "Wanita",
                            style: TextStyle(
                              fontSize: AppSizeFont.lg,
                              color: AppColors.greydark,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SpaceHeight(10),
                        const Text(
                          "Level",
                          style: TextStyle(
                            fontSize: AppSizeFont.lg,
                            color: AppColors.greydark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SpaceHeight(2),
                        CustomDropdown<String>(
                          decoration: const CustomDropdownDecoration(
                            listItemDecoration: ListItemDecoration(
                              selectedColor: AppColors.hover,
                              splashColor: AppColors.hover,
                            ),
                          ),
                          items: _options,
                          initialItem: _selectedLevelOption,
                          onChanged: (String? value) {
                            setState(
                              () {
                                _selectedLevelOption = value;
                                _checkFormRequredUpdateProfile();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocConsumer<UpdateprofileBloc, UpdateprofileState>(
                        listener: (context, state) {
                          state.maybeWhen(
                              error: (errorState) {
                                showBottomDialog(
                                  context: context,
                                  heightFactor: 0.3,
                                  paddingTop: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Image.asset(
                                          AppConfig.imgEmptyDataNull.toString(),
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SpaceHeight(4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.info_outline_rounded,
                                            size: 50,
                                            color: AppColors.red,
                                          ),
                                          const SpaceWidth(8),
                                          Expanded(
                                            child: Text(
                                              errorState,
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                fontSize: AppSizeFont.md,
                                                color: AppColors.greydark,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              success: (succesState) async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                String? userDataString =
                                    prefs.getString('auth_data');
                                if (userDataString != null) {
                                  Map<String, dynamic> userData =
                                      jsonDecode(userDataString);

                                  if (userData['result'] != null) {
                                    Map<String, dynamic>? detailData =
                                        userData['result']['detailData'];
                                    detailData?['level'] = _selectedLevelOption;

                                    userData['result']['detailData'] =
                                        detailData;
                                    String updatedUserDataString =
                                        jsonEncode(userData);
                                    // Simpan kembali data yang telah diubah ke SharedPreferences
                                    prefs.setString(
                                        'detailData', updatedUserDataString);
                                  }
                                  print(userDataString);
                                }

                                final resultResponse = succesState.message;
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'Success',
                                    message: resultResponse,
                                    contentType: ContentType.success,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfilePage()),
                                );
                              },
                              orElse: () {});
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () {
                              return Button.filled(
                                onPressed: () {
                                  null;
                                },
                                label: '',
                                disabled: true,
                                suffixIcon: const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator()),
                              );
                            },
                            orElse: () {
                              return Button.filled(
                                icon: const Icon(
                                  Icons.edit_square,
                                  color: AppColors.white,
                                ),
                                disabled: _btndisableUpdateProfile,
                                onPressed: () {
                                  _onClickUpdateProfile();
                                },
                                label: 'Update',
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
