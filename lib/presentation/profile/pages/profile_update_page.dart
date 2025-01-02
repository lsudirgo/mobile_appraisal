import 'dart:convert';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_appraisal/data/models/request/profile/profile_update_request_model.dart';
import 'package:mobile_appraisal/data/models/response/master/list_dropdown_jabatan.dart';
import 'package:mobile_appraisal/presentation/master/bloc/listjabatan/listjabatan_bloc.dart';
import 'package:mobile_appraisal/presentation/profile/bloc/updateprofile/updateprofile_bloc.dart';
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
  late List<ListjabatanDropdown> _dropdownItems = [];
  ListjabatanDropdown? _selectedJabatan;
  final List<String> _options = [
    'Staff',
    'Officer',
    'Supervisor',
    'Manager',
    'Head'
  ];
  Map<String, dynamic> _updatedProfileData = {};

  void _checkFormRequredUpdateProfile() {
    if (_selectedGender != null && _selectedLevelOption != null) {
      _btndisableUpdateProfile = false;
    } else {
      _btndisableUpdateProfile = true;
    }
    // setState(() {});
  }

  void _onClickUpdateProfile() {
    ProfileUpdate profileUpdate = ProfileUpdate(
      level: _selectedLevelOption,
      jabatanID: _selectedJabatan!.id,
      gender: _selectedGender,
    );

    context
        .read<UpdateprofileBloc>()
        .add(UpdateprofileEvent.updateprofile(profileUpdate: profileUpdate));
    _updatedProfileData = {
      'gender': _selectedGender,
      'level': _selectedLevelOption,
      'bagian': _selectedJabatan!.name,
      'jabatan': _selectedJabatan!.id
    };
  }

  void _updatesharePrefrence(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataString = prefs.getString('auth_data');
    // print("auth_data: $userDataString");
    if (userDataString != null) {
      Map<String, dynamic> userData = jsonDecode(userDataString);

      if (userData['result'] != null) {
        Map<String, dynamic>? detailData = userData['result']['detailData'];

        detailData?['level'] = _selectedLevelOption;
        detailData?['gender'] = _selectedGender;
        detailData?['jabatan'] = _selectedJabatan!.id;

        detailData?['bagian'] = value.result.bagian;
        detailData?['bagiansingkat'] = value.result.bagians;

        String updatedUserDataString = jsonEncode(userData);

        // Simpan kembali data yang telah diubah ke SharedPreferences
        await prefs.setString('auth_data', updatedUserDataString);
      }
    }
  }

  @override
  void initState() {
    _nipUpdateTextController =
        TextEditingController(text: widget.profileData['nip']);
    _nameUpdateTextController =
        TextEditingController(text: widget.profileData['name']);
    _selectedGender = widget.profileData['gender'];
    _selectedLevelOption = widget.profileData['level'] ?? 'Staff';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context
            .read<ListjabatanBloc>()
            .add(const ListjabatanEvent.listJabatan(1, 100, ''));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _nipUpdateTextController.dispose();
    _nameUpdateTextController.dispose();

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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
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
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SpaceHeight(1),
                        BlocConsumer<ListjabatanBloc, ListjabatanState>(
                          listener: (context, state) {
                            state.maybeMap(
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
                                              error.error,
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
                              success: (result) {
                                _dropdownItems = result.result.data
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
                              },
                            );
                          },
                          builder: (context, state) {
                            return state.maybeMap(
                              loading: (_) {
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
                                return CustomDropdown<void>.search(
                                  hintText: 'Pilih Jabatan',
                                  items: null,
                                  excludeSelected: false,
                                  onChanged: (value) {},
                                );
                              },
                              success: (value) {
                                return CustomDropdown<
                                    ListjabatanDropdown>.search(
                                  hintText: 'Pilih Jabatan',
                                  items: _dropdownItems,
                                  initialItem: _selectedJabatan,
                                  key: ValueKey(_selectedJabatan?.id),
                                  onChanged: (v) {
                                    setState(() {
                                      _selectedJabatan = v;
                                    });
                                    _checkFormRequredUpdateProfile();
                                  },
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
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SpaceHeight(1),
                        RadioListTile<String>(
                          toggleable: true,
                          tileColor: AppColors.white,
                          value: 'Laki - laki',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedGender = value;
                              });
                            }
                            _checkFormRequredUpdateProfile();
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
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedGender = value;
                              });
                              _checkFormRequredUpdateProfile();
                            }
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
                            fontWeight: FontWeight.normal,
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
                          onChanged: (value) {
                            if (mounted) {
                              setState(() {
                                _selectedLevelOption = value;
                              });
                            }
                            _checkFormRequredUpdateProfile();
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
                          state.maybeMap(
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
                                          Assets.images.warning.path,
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
                                              errorState.error,
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
                              success: (succesState) {
                                final resultResponse = succesState.result;
                                _updatesharePrefrence(succesState.result);
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'Success',
                                    message: resultResponse.message,
                                    contentType: ContentType.success,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);

                                Navigator.pop(context, _updatedProfileData);
                              },
                              orElse: () {});
                        },
                        builder: (context, state) {
                          return state.maybeMap(
                            loading: (_) {
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
