import 'package:flutter/material.dart';
import 'package:mobile_appraisal/core/components/components.dart';
import 'package:mobile_appraisal/core/constants/colors.dart';
import 'package:mobile_appraisal/core/utils/clip.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  TextEditingController querySearch = TextEditingController();

  bool isTextNotEmpty = false;
  clearSearch() {
    setState(() {
      isTextNotEmpty = querySearch.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    querySearch.addListener(clearSearch);
  }

  @override
  void dispose() {
    querySearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 180,
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
                        "Pesan",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: AppSizeFont.lg,
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeight(15),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      autofocus: false,
                      controller: querySearch,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          top: 2.0,
                          bottom: 2.0,
                        ),
                        filled: true,
                        hoverColor: AppColors.secondary,
                        fillColor: Colors.grey[100],
                        // labelText: "Searhcing..",
                        hintText: "Cari Isi Pesan..",
                        suffixIcon: isTextNotEmpty
                            ? InkWell(
                                hoverColor: Colors.red,
                                child: Icon(
                                  Icons.clear_rounded,
                                  color: Colors.grey[600],
                                ),
                                onTap: () {
                                  querySearch.clear();
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
                      onChanged: (value) async {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
