import 'package:bus_online/components/full_width_button.dart';
import 'package:bus_online/components/heading_with_back_button.dart';
import 'package:bus_online/components/sks_ticket_view.dart';
import 'package:bus_online/controllers/danh_sach_ve_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DanhSachDangKi extends StatelessWidget {
  final DanhSachVeController controller = Get.put(DanhSachVeController());
  DanhSachDangKi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: HeadingWithBackButton(
                title: 'Danh sách vé',
                backTo: "/home",
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Obx(
                  () =>
                      controller.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : (controller.listOfDonTra.isEmpty
                              ? Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 82,
                                      child: Image.asset(
                                        'assets/images/empty.png',
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Không có vé nào, mời bạn đặt vé mới',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              )
                              : RefreshIndicator(
                                onRefresh: () {
                                  return controller.reload();
                                },
                                child: ListView.separated(
                                  separatorBuilder:
                                      (BuildContext context, index) =>
                                          const SizedBox(height: 16),
                                  itemCount: controller.listOfDonTra.length,
                                  itemBuilder: (_, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                          '/chi-tiet',
                                          arguments: index,
                                        );
                                      },
                                      child: SKSTicketView(
                                        backgroundPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 24,
                                              horizontal: 0,
                                            ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 0,
                                              horizontal: 10,
                                            ),
                                        drawTriangle: false,
                                        drawArc: true,
                                        child: SizedBox(
                                          width: 250,
                                          height: 120,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 174,
                                                height: 120,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .listOfDonTra[index]
                                                          .tenTramDi,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Color(
                                                          0xffff5723,
                                                        ),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons.arrow_downward,
                                                    ),
                                                    Text(
                                                      controller
                                                          .listOfDonTra[index]
                                                          .tenTramDen,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Color(
                                                          0xffff5723,
                                                        ),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 75,
                                                height: 120,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Text('SL'),
                                                    Text(
                                                      controller
                                                          .listOfDonTra[index]
                                                          .soLuong,
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: FullWidthButton(
                onPressed: () {
                  Get.toNamed('/dang-ki-chuyen');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 27, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'Đặt vé mới',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
