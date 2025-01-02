import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_appraisal/core/constants/colors.dart';
import 'package:mobile_appraisal/core/utils/clip.dart';
import 'package:mobile_appraisal/data/models/request/job/job_list_request_model.dart';
import 'package:mobile_appraisal/presentation/job/bloc/job_list_progres/job_lis_progres_bloc.dart';

import '../../../data/datasources/auth/auth_local_datasource.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  int currentIndex = 0;
  String? _roleApproval;
  String? _unitkerja;
  bool _isLoadingOrder = true;

  //get local storage
  Future<void> getRoleApp() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final data = authData?.result?.detailData;
    if (data != null) {
      setState(() {
        _roleApproval = data.otorisator;
        _unitkerja = data.konsolidasi;
        _isLoadingOrder = false; // Data is loaded
      });
    }
  }

  void _getJobListProgress(
      int resultflagpetugas, int resultstatus, String? unitkerja) {
    JobListRequest joblist = JobListRequest(
        page: 1,
        limit: 10,
        flagpetugas: resultflagpetugas,
        status: resultstatus,
        q: unitkerja);

    context
        .read<JobLisProgresBloc>()
        .add(JobLisProgresEvent.getJobList(joblistrequest: joblist));
  }

  void handleTabChange(int newselectedIndex) async {
    currentIndex = newselectedIndex;
    setState(() {
      if (currentIndex == 0) {
        _roleApproval == 'T'
            ? _getJobListProgress(1, 2, null)
            : _getJobListProgress(0, 1, _unitkerja);
      } else if (currentIndex == 1) {
        _roleApproval == 'T'
            ? _getJobListProgress(2, 2, null)
            : _getJobListProgress(3, 3, null);
      } else if (currentIndex == 2) {
        _roleApproval == 'T'
            ? _getJobListProgress(3, 3, null)
            : _getJobListProgress(0, 5, _unitkerja);
      }
    });
  }

  Future<void> initialize() async {
    await getRoleApp();
    if (_roleApproval == 'T') {
      _getJobListProgress(1, 2, null);
    } else {
      _getJobListProgress(0, 1, _unitkerja);
    }
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    getRoleApp();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingOrder) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ); // Show a loading indicator while data is being fetched
    }
    bool isApprovalRoleYes = _roleApproval == "Y";
    int tabLength = 3;

    List<Tab> tabs = [];
    List<Widget> tabViews = [];

    if (isApprovalRoleYes) {
      tabs.add(
          const Tab(icon: Icon(Icons.assignment_ind_sharp), text: "Disposisi"));
      tabs.add(const Tab(icon: Icon(Icons.reviews_rounded), text: "Reviewer"));
      tabs.add(const Tab(icon: Icon(Icons.approval_rounded), text: "Approval"));
      tabs.remove(const Tab(icon: Icon(Icons.directions_car), text: "OTS"));
      tabs.remove(
          const Tab(icon: Icon(Icons.monitor_rounded), text: "On Desk"));
      tabViews.add(
        const Center(child: Column(children: [Expanded(child: Text("Tab 3"))])),
      );
      tabViews.add(
        const Center(child: Column(children: [Expanded(child: Text("Tab 4"))])),
      );
      tabViews.add(
        const Center(child: Column(children: [Expanded(child: Text("Tab 5"))])),
      );
      tabViews.remove(
        const Center(
            child: Column(children: [Expanded(child: Text("Tab 1ss"))])),
      );
      tabViews.remove(
        const Center(child: Column(children: [Expanded(child: Text("Tab 2"))])),
      );
    } else {
      tabs.remove(
          const Tab(icon: Icon(Icons.assignment_ind_sharp), text: "Disposisi"));

      tabs.remove(
          const Tab(icon: Icon(Icons.approval_rounded), text: "Approval"));
      tabs.add(const Tab(icon: Icon(Icons.directions_car), text: "OTS"));
      tabs.add(const Tab(icon: Icon(Icons.monitor_rounded), text: "On Desk"));
      tabs.add(const Tab(icon: Icon(Icons.reviews_rounded), text: "Reviewer"));
      tabViews.remove(
        const Center(child: Column(children: [Expanded(child: Text("Tab 4"))])),
      );
      tabViews.remove(
        const Center(child: Column(children: [Expanded(child: Text("Tab 5"))])),
      );
      tabViews.add(
        const Center(child: Column(children: [Expanded(child: ListViewQ())])),
      );
      tabViews.add(
        const Center(child: Column(children: [Expanded(child: Text("Tab 2"))])),
      );
      tabViews.add(
        const Center(child: Column(children: [Expanded(child: Text("Tab 3"))])),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 110,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ClipPathClassAppBar(),
          child: Container(
            alignment: Alignment.topCenter,
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Daftar Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        // onTap: () => navigatorPushAnimation(
                        //     ListJobSearchView(
                        //       stage: controller.currentIndex,
                        //       nameStage: controller.nameStage,
                        //     ),
                        //     1),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.search_rounded,
                            size: 24.0,
                            color: Colors.white,
                          ),
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
          padding: const EdgeInsets.all(4),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 0.9,
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: DefaultTabController(
            length: tabLength,
            animationDuration: const Duration(seconds: 1),
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  splashColor: AppColors.primary,
                  radius: 100,
                  onTap: (index) => handleTabChange(index),
                  backgroundColor: AppColors.secondary,
                  unselectedBackgroundColor: Colors.grey[200],
                  unselectedLabelStyle: const TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedBorderColor: AppColors.background,
                  labelSpacing: 4,
                  height: 50,
                  contentPadding: const EdgeInsets.only(left: 14, right: 14),
                  tabs: tabs,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      color: AppColors.background,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(children: tabViews),
                    ),
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

class ListViewQ extends StatefulWidget {
  const ListViewQ({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ListViewQState();
  }
}

class _ListViewQState extends State<ListViewQ> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobLisProgresBloc, JobLisProgresState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loading: () {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Card(
                  child: ListTile(
                    title: SkeletonLoader(),
                  ),
                );
              },
            );
          },
          success: (resultSuccess) {
            final data = resultSuccess.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return const Card(
                  child: ListTile(
                    title: Text('2233'),
                  ),
                );
              },
            );
          },
          error: (error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/no_data.png'),
                  const SizedBox(height: 8),
                  Text(error),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: double.infinity,
      color: Colors.grey[300],
    );
  }
}
