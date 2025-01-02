import 'dart:async';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_appraisal/core/assets/assets.gen.dart';
import 'package:mobile_appraisal/core/components/button_dialog.dart';
import 'package:mobile_appraisal/core/components/buttons.dart';
import 'package:mobile_appraisal/core/components/custom_paint.dart';
import 'package:mobile_appraisal/core/components/spaces.dart';
import 'package:mobile_appraisal/core/config.dart';
import 'package:mobile_appraisal/data/datasources/auth/auth_local_datasource.dart';
import 'package:mobile_appraisal/data/models/request/job/job_list_request_model.dart';
import 'package:mobile_appraisal/data/models/request/userdisposisi/disposisi_request_model.dart';
import 'package:mobile_appraisal/data/models/response/master/user_disposisi/list_dropdown_userdisposisi.dart';
import 'package:mobile_appraisal/presentation/job/bloc/disposisi_create/disposisi_create_bloc.dart';
import 'package:mobile_appraisal/presentation/job/bloc/job_list_progres/job_lis_progres_bloc.dart';
import 'package:mobile_appraisal/presentation/master/bloc/listuserdispo/list_user_disposisi_bloc.dart';
import 'package:skeletons/skeletons.dart';
import '../../../core/constants/colors.dart';

class DisposisiListPage extends StatefulWidget {
  const DisposisiListPage({super.key});

  @override
  State<DisposisiListPage> createState() => _DisposisiListPageState();
}

class _DisposisiListPageState extends State<DisposisiListPage> {
  final TextEditingController _querySearchDisposisilist =
      TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isTextNotEmpty = false;

  final ScrollController _scrollController = ScrollController();
  final int _page = 1;
  int _limit = 10;
  int? _countData = 0;
  bool _isLoading = true;
  Timer? _debounce;
  String _textcountpendinguserOTS = '';
  String _textUseridOTS = '';
  bool _isShowDetailOTS = false;
  String _textcountpendinguserONDESK = '';
  String _textUseridONDESK = '';
  bool _isShowDetailONDESK = false;
  bool _btndisableDisposisi = true;
  String? _resultTypeOrder = '';
  String? _appraisalID = '';

  late List<ListuserdisposisiDropdown> _dropdownDisposisiItems = [];
  ListuserdisposisiDropdown? _selectedDropdownDisposisi;
  ListuserdisposisiDropdown? _selectedDropdownOnDesk;

  void _checkFormRequredDisposisi(String? value) {
    if (value != null) {
      if (value != 'Review' &&
          _selectedDropdownOnDesk != null &&
          _selectedDropdownDisposisi != null) {
        _btndisableDisposisi = false;
      } else if (value == 'Review' && _selectedDropdownOnDesk != null) {
        _btndisableDisposisi = false;
      } else {
        _btndisableDisposisi = true;
      }
    }
  }

  Future<void> _onclickDiposisi(String appraisalID, String tipeID) async {
    final resultuserOTS =
        tipeID != 'Review' ? _selectedDropdownDisposisi!.id : null;

    DisposisiRequest disposisiBody = DisposisiRequest(
      appraisalID: appraisalID,
      tipeID: tipeID,
      userONDESKID: _selectedDropdownOnDesk!.id,
      userOTSID: resultuserOTS,
    );

    if (mounted) {
      context.read<DisposisiCreateBloc>().add(
          DisposisiCreateEvent.createDisposisi(
              disposisiCreateRequest: disposisiBody));
    }
  }

  void _clearSearchDisposisilist() {
    setState(() {
      _isTextNotEmpty = _querySearchDisposisilist.text.isNotEmpty;
    });
  }

  Future<void> _getListdataDisposisi(int? nextLimit) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final data = authData?.result?.detailData;

    final paramsJoblistdisposisirequest = JobListRequest(
        page: _page,
        limit: nextLimit ?? _limit,
        flagpetugas: 0,
        status: 1,
        uker: data?.konsolidasi ?? data?.fou ?? "",
        q: _querySearchDisposisilist.text);

    if (mounted) {
      context.read<JobLisProgresBloc>().add(JobLisProgresEvent.getJobList(
          joblistrequest: paramsJoblistdisposisirequest));
    }
  }

  void _searchParam() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: AppConfig.debouce), () {
      _getListdataDisposisi(10);
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (_limit < _countData!) {
      _limit += 10;
      _getListdataDisposisi(_limit);
    }
  }

  Future<void> _loadlistuserReviewer() async {
    if (mounted) {
      context
          .read<ListUserDisposisiBloc>()
          .add(const ListUserDisposisiEvent.listUserDisposisi(1, 300, ''));
    }
  }

  @override
  void initState() {
    _querySearchDisposisilist.addListener(_clearSearchDisposisilist);

    _scrollController.addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _querySearchDisposisilist.dispose();
    _debounce?.cancel();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getListdataDisposisi(10);
    _loadlistuserReviewer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Untuk menghindari overlay keyboard
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // SliverAppBar dengan efek melengkung
          SliverAppBar(
            scrolledUnderElevation: 100,
            collapsedHeight: 150,
            expandedHeight: 200, // Atur tinggi AppBar sesuai keinginan
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            automaticallyImplyLeading: false, // Menonaktifkan icon back default
            flexibleSpace: ClipPath(
              clipper:
                  ClipPathClass(), // Custom clip untuk bagian bawah yang melengkung
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: AppColors.primary, // Warna latar belakang AppBar
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () =>
                                _isLoading ? false : Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_circle_left,
                              size: 40.0,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Disposisi List",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppSizeFont.xl,
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(20),
                      // TextField tetap berada di bawah app bar
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          focusNode: _focusNode,
                          autofocus: false,
                          controller: _querySearchDisposisilist,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              top: 2.0,
                              bottom: 2.0,
                            ),
                            filled: true,
                            hoverColor: AppColors.secondary,
                            fillColor: Colors.grey[100],
                            hintText: "Ketik No Aplikasi / Nama..",
                            suffixIcon: _isTextNotEmpty
                                ? InkWell(
                                    hoverColor: Colors.red,
                                    child: Icon(
                                      Icons.clear_rounded,
                                      color: Colors.grey[600],
                                    ),
                                    onTap: () async {
                                      _querySearchDisposisilist.clear();
                                      _getListdataDisposisi(10);
                                    },
                                  )
                                : null,
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: AppColors.primary,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: AppColors.primary,
                                width: 1.0,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: AppColors.primary,
                            ),
                          ),
                          onEditingComplete: () {
                            _getListdataDisposisi(10);
                          },
                          onChanged: (value) {
                            _searchParam();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floating: true, // AppBar menghilang saat scroll ke atas
            snap: true, // AppBar muncul kembali saat scroll ke bawah
            pinned: true, // AppBar tidak selalu tetap
          ),

          BlocConsumer<JobLisProgresBloc, JobLisProgresState>(
            listener: (context, state) {
              state.maybeWhen(
                  orElse: () {},
                  success: (result) {
                    setState(() {
                      _countData = result.countData;
                      _isLoading = false;
                    });
                  },
                  error: (message) {
                    setState(() {
                      _isLoading = false;
                    });

                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Error',
                        message: message,
                        contentType: ContentType.warning,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  });
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(blurRadius: 4, color: Colors.black12)
                              ],
                            ),
                            child: Row(
                              children: [
                                const SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                    width: 50,
                                    height: 50,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                          height: 16,
                                          width: double.infinity,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                          height: 16,
                                          width: 100,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 7,
                    ),
                  );
                },
                error: (error) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 8.0, right: 8.0),
                          child: Center(
                            // Memastikan isi berada di tengah
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.images.notFound.path,
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  );
                },
                loading: () {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(blurRadius: 4, color: Colors.black12)
                              ],
                            ),
                            child: Row(
                              children: [
                                const SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                    width: 50,
                                    height: 50,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                          height: 16,
                                          width: double.infinity,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      SkeletonLine(
                                        style: SkeletonLineStyle(
                                          height: 16,
                                          width: 100,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 7,
                    ),
                  );
                },
                success: (result) {
                  if (result.data.isNotEmpty) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final ammountData = result.data[index].orderAmount;

                          final parsedDate = result.data[index].orderDate;
                          final formattedDate =
                              DateFormat('dd-MM-yyyy HH:mm').format(parsedDate);
                          return InkWell(
                            onTap: () async {
                              _selectedDropdownDisposisi = null;
                              _selectedDropdownOnDesk = null;
                              _isShowDetailOTS = false;
                              _isShowDetailONDESK = false;
                              _resultTypeOrder = result.data[index].orderType;
                              _checkFormRequredDisposisi(_resultTypeOrder);
                              _appraisalID = result.data[index].orderId;
                              _loadlistuserReviewer();

                              return showBottomDialog(
                                enableDrag: true,
                                isDismissible: true,
                                context: context,
                                heightFactor: 0.95,
                                paddingTop: 6,
                                child: StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter setState) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.apps,
                                                size: 30,
                                                color: AppColors.primary,
                                              ),
                                              SpaceWidth(4),
                                              Text(
                                                'Disposisi Order',
                                                style: TextStyle(
                                                  fontSize: AppSizeFont.xl,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SpaceHeight(4),
                                        Card(
                                          shadowColor: AppColors.primary,
                                          color: AppColors.white,
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                left: 250,
                                                right: 0,
                                                top: 0,
                                                bottom: 0,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Opacity(
                                                    opacity: 0.30,
                                                    child: Image.asset(
                                                      Assets.images.bgCard.path,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .supervised_user_circle_rounded,
                                                          color: AppColors
                                                              .greydark,
                                                          size: AppSizeFont.md,
                                                        ),
                                                        const SpaceWidth(2),
                                                        Text(
                                                          result.data[index]
                                                              .orderName,
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                AppSizeFont.md,
                                                            color: AppColors
                                                                .greydark,
                                                          ),
                                                        ),
                                                        const SpaceWidth(4),
                                                        Text(
                                                          '- ${result.data[index].orderType}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                AppSizeFont.md,
                                                            color: AppColors
                                                                .greydark,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SpaceHeight(4),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .home_work_rounded,
                                                          color: AppColors
                                                              .greydark,
                                                          size: AppSizeFont.md,
                                                        ),
                                                        const SpaceWidth(2),
                                                        Text(
                                                          result.data[index]
                                                              .orderBranchName,
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                AppSizeFont.md,
                                                            color: AppColors
                                                                .greydark,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SpaceHeight(4),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .surround_sound_rounded,
                                                          color: AppColors
                                                              .greydark,
                                                          size: AppSizeFont.md,
                                                        ),
                                                        const SpaceWidth(2),
                                                        Text(
                                                          result.data[index]
                                                              .orderSource,
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                AppSizeFont.md,
                                                            color: AppColors
                                                                .greydark,
                                                          ),
                                                        ),
                                                        const SpaceWidth(4),
                                                        Text(
                                                          result.data[index]
                                                              .orderNo
                                                              .replaceAll(
                                                                  ' ', ''),
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                AppSizeFont.md,
                                                            color: AppColors
                                                                .greydark,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SpaceHeight(4),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .category_outlined,
                                                          color: AppColors
                                                              .greydark,
                                                          size: AppSizeFont.md,
                                                        ),
                                                        const SpaceWidth(2),
                                                        Text(
                                                          result
                                                              .data[index]
                                                              .orderjenisObjek
                                                              .detailName,
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                AppSizeFont.md,
                                                            color: AppColors
                                                                .greydark,
                                                          ),
                                                        ),
                                                        const SpaceWidth(4),
                                                        Expanded(
                                                          child: Text(
                                                            result.data[index]
                                                                        .orderType !=
                                                                    'Review'
                                                                ? ' - ${result.data[index].orderjenisObjek.detailAlamat}'
                                                                : '',
                                                            style:
                                                                const TextStyle(
                                                              fontSize:
                                                                  AppSizeFont
                                                                      .md,
                                                              color: AppColors
                                                                  .greydark,
                                                            ),
                                                            maxLines: 1,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              result.data[index].orderType !=
                                                  'Review',
                                          child: Column(
                                            children: [
                                              const SpaceHeight(12.0),
                                              Container(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius: _isShowDetailOTS
                                                      ? const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        )
                                                      : const BorderRadius.all(
                                                          Radius.circular(12.0),
                                                        ),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: AppColors.grey,
                                                      blurRadius: 1.0,
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      BlocConsumer<
                                                          ListUserDisposisiBloc,
                                                          ListUserDisposisiState>(
                                                        listener:
                                                            (context, state) {
                                                          state.maybeMap(
                                                            orElse: () {},
                                                            error: (error) {
                                                              final snackBar =
                                                                  SnackBar(
                                                                elevation: 0,
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                content:
                                                                    AwesomeSnackbarContent(
                                                                  title:
                                                                      'Error',
                                                                  message: error
                                                                      .error,
                                                                  contentType:
                                                                      ContentType
                                                                          .warning,
                                                                ),
                                                              );

                                                              ScaffoldMessenger
                                                                  .of(context)
                                                                ..hideCurrentSnackBar()
                                                                ..showSnackBar(
                                                                    snackBar);
                                                            },
                                                            success: (result) {
                                                              _dropdownDisposisiItems = result
                                                                  .result.data
                                                                  .map((datum) =>
                                                                      ListuserdisposisiDropdown(
                                                                        datum
                                                                            .userId,
                                                                        datum
                                                                            .userFullName,
                                                                        datum
                                                                            .userJabatan,
                                                                        datum
                                                                            .countuserPendingOTS,
                                                                        datum
                                                                            .countuserPendingDesk,
                                                                      ))
                                                                  .toList();
                                                            },
                                                          );
                                                        },
                                                        builder:
                                                            (context, state) {
                                                          return state.maybeMap(
                                                            success: (result) {
                                                              return CustomDropdown<
                                                                  ListuserdisposisiDropdown>.search(
                                                                hintText:
                                                                    'Pilih Petugas OTS',
                                                                decoration:
                                                                    const CustomDropdownDecoration(
                                                                  errorStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .redAccent,
                                                                  ),
                                                                  expandedSuffixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .arrow_drop_up,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  prefixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .search,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  expandedBorder:
                                                                      Border
                                                                          .fromBorderSide(
                                                                    BorderSide(
                                                                        color: AppColors
                                                                            .primary),
                                                                  ),
                                                                  headerStyle:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  expandedBorderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      12.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                items:
                                                                    _dropdownDisposisiItems,
                                                                initialItem:
                                                                    _selectedDropdownDisposisi,
                                                                key: ValueKey(
                                                                    _selectedDropdownDisposisi
                                                                        ?.id),
                                                                onChanged: (v) {
                                                                  setState(() {
                                                                    _selectedDropdownDisposisi =
                                                                        v;

                                                                    _textUseridOTS =
                                                                        v!.id;
                                                                    _textcountpendinguserOTS = v
                                                                        .countpendingots
                                                                        .toString();
                                                                    _isShowDetailOTS = _selectedDropdownDisposisi
                                                                            .toString()
                                                                            .isNotEmpty
                                                                        ? true
                                                                        : false;
                                                                  });

                                                                  _checkFormRequredDisposisi(
                                                                      _resultTypeOrder);
                                                                },
                                                              );
                                                            },
                                                            loading: (_) {
                                                              return CustomDropdown
                                                                  .search(
                                                                hintText:
                                                                    'Searching Petugas OTS...',
                                                                disabledDecoration:
                                                                    const CustomDropdownDisabledDecoration(
                                                                  suffixIcon: SizedBox(
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                                ),
                                                                items: null,
                                                                excludeSelected:
                                                                    false,
                                                                enabled: false,
                                                                onChanged:
                                                                    (value) {},
                                                              );
                                                            },
                                                            orElse: () {
                                                              // _loadlistuserReviewer();
                                                              return CustomDropdown<
                                                                  void>.search(
                                                                hintText:
                                                                    'Pilih Petugas OTS',
                                                                decoration:
                                                                    const CustomDropdownDecoration(
                                                                  errorStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .redAccent,
                                                                  ),
                                                                  expandedSuffixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .arrow_drop_up,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  prefixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .search,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  expandedBorder:
                                                                      Border
                                                                          .fromBorderSide(
                                                                    BorderSide(
                                                                        color: AppColors
                                                                            .primary),
                                                                  ),
                                                                  headerStyle:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  expandedBorderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      12.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                items: null,
                                                                excludeSelected:
                                                                    false,
                                                                onChanged:
                                                                    (value) {},
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // const SpaceHeight(3.0),
                                              Visibility(
                                                visible: _isShowDetailOTS,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: AppColors.hover,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors.grey,
                                                        blurRadius: 1.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14.0,
                                                            right: 14.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .account_circle_rounded,
                                                              color: AppColors
                                                                  .primary,
                                                              size: AppSizeFont
                                                                  .md,
                                                            ),
                                                            const SpaceWidth(2),
                                                            Text(
                                                              _textUseridOTS,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize:
                                                                    AppSizeFont
                                                                        .md,
                                                                color: AppColors
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          '$_textcountpendinguserOTS Pending',
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                AppSizeFont.md,
                                                            color: AppColors
                                                                .secondary,
                                                          ),
                                                          maxLines: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SpaceHeight(12.0),
                                        Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: Column(
                                            children: [
                                              const SpaceHeight(12.0),
                                              Container(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: AppColors.white,
                                                  borderRadius:
                                                      _isShowDetailONDESK
                                                          ? const BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      12.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      12.0),
                                                            )
                                                          : const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  12.0),
                                                            ),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: AppColors.grey,
                                                      blurRadius: 1.0,
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      BlocConsumer<
                                                          ListUserDisposisiBloc,
                                                          ListUserDisposisiState>(
                                                        listener:
                                                            (context, state) {
                                                          state.maybeMap(
                                                            orElse: () {},
                                                            error: (error) {
                                                              final snackBar =
                                                                  SnackBar(
                                                                elevation: 0,
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                content:
                                                                    AwesomeSnackbarContent(
                                                                  title:
                                                                      'Error',
                                                                  message: error
                                                                      .error,
                                                                  contentType:
                                                                      ContentType
                                                                          .warning,
                                                                ),
                                                              );

                                                              ScaffoldMessenger
                                                                  .of(context)
                                                                ..hideCurrentSnackBar()
                                                                ..showSnackBar(
                                                                    snackBar);
                                                            },
                                                            success: (result) {
                                                              _dropdownDisposisiItems = result
                                                                  .result.data
                                                                  .map((datum) =>
                                                                      ListuserdisposisiDropdown(
                                                                        datum
                                                                            .userId,
                                                                        datum
                                                                            .userFullName,
                                                                        datum
                                                                            .userJabatan,
                                                                        datum
                                                                            .countuserPendingOTS,
                                                                        datum
                                                                            .countuserPendingDesk,
                                                                      ))
                                                                  .toList();
                                                            },
                                                          );
                                                        },
                                                        builder:
                                                            (context, state) {
                                                          return state.maybeMap(
                                                            success: (result) {
                                                              return CustomDropdown<
                                                                  ListuserdisposisiDropdown>.search(
                                                                hintText:
                                                                    'Pilih Petugas On Desk',
                                                                decoration:
                                                                    const CustomDropdownDecoration(
                                                                  errorStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .redAccent,
                                                                  ),
                                                                  expandedSuffixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .arrow_drop_up,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  prefixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .search,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  expandedBorder:
                                                                      Border
                                                                          .fromBorderSide(
                                                                    BorderSide(
                                                                        color: AppColors
                                                                            .primary),
                                                                  ),
                                                                  headerStyle:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  expandedBorderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      12.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                items:
                                                                    _dropdownDisposisiItems,
                                                                initialItem:
                                                                    _selectedDropdownOnDesk,
                                                                key: ValueKey(
                                                                    _selectedDropdownOnDesk
                                                                        ?.id),
                                                                onChanged:
                                                                    (ondesk) {
                                                                  setState(() {
                                                                    _selectedDropdownOnDesk =
                                                                        ondesk;

                                                                    _textUseridONDESK =
                                                                        ondesk!
                                                                            .id;
                                                                    _textcountpendinguserONDESK = ondesk
                                                                        .countpendingdesk
                                                                        .toString();
                                                                    _isShowDetailONDESK = _selectedDropdownOnDesk
                                                                            .toString()
                                                                            .isNotEmpty
                                                                        ? true
                                                                        : false;
                                                                  });

                                                                  _checkFormRequredDisposisi(
                                                                      _resultTypeOrder);
                                                                },
                                                              );
                                                            },
                                                            loading: (_) {
                                                              return CustomDropdown
                                                                  .search(
                                                                hintText:
                                                                    'Searching Petugas On Desk...',
                                                                disabledDecoration:
                                                                    const CustomDropdownDisabledDecoration(
                                                                  suffixIcon: SizedBox(
                                                                      height:
                                                                          20,
                                                                      width: 20,
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                                ),
                                                                items: null,
                                                                excludeSelected:
                                                                    false,
                                                                enabled: false,
                                                                onChanged:
                                                                    (value) {},
                                                              );
                                                            },
                                                            orElse: () {
                                                              // _loadlistuserReviewer();
                                                              return CustomDropdown<
                                                                  void>.search(
                                                                hintText:
                                                                    'Pilih Petugas On Desk',
                                                                decoration:
                                                                    const CustomDropdownDecoration(
                                                                  errorStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .redAccent,
                                                                  ),
                                                                  expandedSuffixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .arrow_drop_up,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  prefixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .search,
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  expandedBorder:
                                                                      Border
                                                                          .fromBorderSide(
                                                                    BorderSide(
                                                                        color: AppColors
                                                                            .primary),
                                                                  ),
                                                                  headerStyle:
                                                                      TextStyle(
                                                                    color: AppColors
                                                                        .primary,
                                                                  ),
                                                                  expandedBorderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      12.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                items: null,
                                                                excludeSelected:
                                                                    false,
                                                                onChanged:
                                                                    (value) {},
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // const SpaceHeight(3.0),
                                              Visibility(
                                                visible: _isShowDetailONDESK,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 40,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: AppColors.hover,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors.grey,
                                                        blurRadius: 1.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 14.0,
                                                            right: 14.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .account_circle_rounded,
                                                              color: AppColors
                                                                  .primary,
                                                              size: AppSizeFont
                                                                  .md,
                                                            ),
                                                            const SpaceWidth(2),
                                                            Text(
                                                              _textUseridONDESK,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize:
                                                                    AppSizeFont
                                                                        .md,
                                                                color: AppColors
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          '$_textcountpendinguserONDESK Pending',
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                AppSizeFont.md,
                                                            color: AppColors
                                                                .secondary,
                                                          ),
                                                          maxLines: 1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: BlocConsumer<
                                              DisposisiCreateBloc,
                                              DisposisiCreateState>(
                                            listener: (context, state) {
                                              state.maybeWhen(
                                                orElse: () {},
                                                error: (error) {
                                                  Navigator.pop(context);
                                                  final snackBar = SnackBar(
                                                    elevation: 0,
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    content:
                                                        AwesomeSnackbarContent(
                                                      title: 'Error',
                                                      message: error,
                                                      contentType:
                                                          ContentType.warning,
                                                    ),
                                                  );

                                                  ScaffoldMessenger.of(context)
                                                    ..hideCurrentSnackBar()
                                                    ..showSnackBar(snackBar);
                                                },
                                                success: (result) {
                                                  Navigator.pop(context);
                                                  final snackBar = SnackBar(
                                                    elevation: 0,
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    content:
                                                        AwesomeSnackbarContent(
                                                      title: 'Success',
                                                      message: result.message,
                                                      contentType:
                                                          ContentType.success,
                                                    ),
                                                  );

                                                  ScaffoldMessenger.of(context)
                                                    ..hideCurrentSnackBar()
                                                    ..showSnackBar(snackBar);
                                                  _getListdataDisposisi(10);
                                                },
                                              );
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
                                                        child:
                                                            CircularProgressIndicator()),
                                                  );
                                                },
                                                orElse: () {
                                                  return Button.filled(
                                                    icon: const Icon(
                                                      Icons.send_rounded,
                                                      color: Colors.white,
                                                    ),
                                                    disabled:
                                                        _btndisableDisposisi,
                                                    color: AppColors.secondary,
                                                    onPressed: () async {
                                                      await _onclickDiposisi(
                                                          _appraisalID!,
                                                          _resultTypeOrder!);
                                                    },
                                                    label: 'Disposisi',
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: Colors.white,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    left: 300,
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Opacity(
                                        opacity: 0.15,
                                        child: Image.asset(
                                          Assets.images.bgCard.path,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Stack(
                                        children: [
                                          // Background image
                                          // Card content
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 6),
                                                decoration: BoxDecoration(
                                                  color: AppColors.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Text(
                                                  result
                                                      .data[index]
                                                      .orderjenisObjek
                                                      .detailName,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ),
                                              const SpaceHeight(4),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    result.data[index].orderName
                                                                .length >
                                                            60
                                                        ? '${result.data[index].orderName.substring(0, 60)}...'
                                                        : result.data[index]
                                                            .orderName,
                                                    style: const TextStyle(
                                                      fontSize: AppSizeFont.lg,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    result
                                                        .data[index].orderType,
                                                    style: const TextStyle(
                                                      fontSize: AppSizeFont.sm,
                                                      color: AppColors.greydark,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SpaceHeight(4),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .surround_sound_rounded,
                                                        color:
                                                            AppColors.greydark,
                                                        size: AppSizeFont.sm,
                                                      ),
                                                      const SpaceWidth(2),
                                                      Text(
                                                        result.data[index]
                                                            .orderSource,
                                                        style: const TextStyle(
                                                          fontSize:
                                                              AppSizeFont.sm,
                                                          color: AppColors
                                                              .greydark,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    result.data[index].orderNo
                                                        .replaceAll(' ', ''),
                                                    style: const TextStyle(
                                                      fontSize: AppSizeFont.sm,
                                                      color: AppColors.greydark,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      const Icon(
                                                        Icons.home_work_rounded,
                                                        color:
                                                            AppColors.greydark,
                                                        size: AppSizeFont.sm,
                                                      ),
                                                      const SpaceWidth(2),
                                                      Text(
                                                        result
                                                                    .data[index]
                                                                    .orderBranchName
                                                                    .length >
                                                                60
                                                            ? '${result.data[index].orderBranchName.substring(0, 60)}...'
                                                            : result.data[index]
                                                                .orderBranchName,
                                                        style: const TextStyle(
                                                          fontSize:
                                                              AppSizeFont.sm,
                                                          color: AppColors
                                                              .greydark,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    result.data[index]
                                                        .orderSegmen,
                                                    style: const TextStyle(
                                                      fontSize: AppSizeFont.sm,
                                                      color: AppColors.greydark,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SpaceHeight(4),
                                              const DashedLine(
                                                direction: Axis.horizontal,
                                                dashWidth: 5,
                                                dashHeight: 2,
                                                dashSpacing: 4,
                                                color: AppColors.greydark,
                                              ),
                                              const SpaceHeight(4),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.calendar_month,
                                                        color:
                                                            AppColors.greydark,
                                                        size: AppSizeFont.sm,
                                                      ),
                                                      const SpaceWidth(2),
                                                      Text(
                                                        formattedDate,
                                                        style: const TextStyle(
                                                          fontSize:
                                                              AppSizeFont.sm,
                                                          color: AppColors
                                                              .greydark,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'IDR ${NumberFormat('#,###').format(int.parse(ammountData))}',
                                                    style: const TextStyle(
                                                      fontSize: AppSizeFont.sm,
                                                      color: AppColors.greydark,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const Positioned(
                                            top: 0,
                                            right: 8,
                                            child: Icon(
                                              Icons.arrow_circle_right_rounded,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: result.data.length,
                      ),
                    );
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 50.0, left: 8.0, right: 8.0),
                            child: Center(
                              // Memastikan isi berada di tengah
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.images.notFound.path,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                  ),
                                  const SpaceHeight(0.2), // Jarak bawah
                                  const Text(
                                    'Disposisi tidak Tersedia',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: 1,
                      ),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20); // Memperbaiki posisi lengkungan
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 20); // Menyesuaikan lengkungan
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
