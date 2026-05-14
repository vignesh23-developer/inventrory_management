import 'package:get/get.dart';

import '../models/customer_bills.dart';
import '../models/inventory_data.dart';

class DashboardController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<AnalyticsData> analytics = <AnalyticsData>[].obs;
  final RxList<ChartData> monthlyRevenue = <ChartData>[].obs;
  final RxList<ChartData> categoryShare = <ChartData>[].obs;
  final RxInt selectedChartPeriod = 0.obs; // 0=6M 1=1Y

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 800));
    analytics.assignAll(DummyData.adminAnalytics);
    monthlyRevenue.assignAll(DummyData.monthlyRevenue);
    categoryShare.assignAll(DummyData.categoryShare);
    isLoading.value = false;
  }

  void refresh() => _loadData();

  void changePeriod(int index) => selectedChartPeriod.value = index;
}