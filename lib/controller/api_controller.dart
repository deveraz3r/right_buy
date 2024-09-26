import 'package:get/get.dart';
import '../API Services/api_services.dart';
import '../models/model.dart';

class CategoryController extends GetxController {
  var categoryList = <Category>[].obs;
  var brandsList = <Brands>[].obs;
  var isCategoryLoading = true.obs;
  var isBrandsLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchCategories();
    fetchBrands();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isCategoryLoading(true);
      errorMessage(''); // Clear previous error message
      var categories = await ApiService().fetchCategories();
      if (categories != null) {
        categoryList.assignAll(categories);
      }
    } catch (e) {
      errorMessage('Failed to load categories: $e');
      print('Error fetching categories: $e');
    } finally {
      isCategoryLoading(false);
    }
  }

  void fetchBrands() async {
    try {
      isBrandsLoading(true);
      errorMessage(''); // Clear previous error message
      var brands = await ApiService().fetchBrands();
      if (brands != null) {
        brandsList.assignAll(brands);
      }
    } catch (e) {
      errorMessage('Failed to load brands: $e');
      print('Error fetching brands: $e');
    } finally {
      isBrandsLoading(false);
    }
  }
}
