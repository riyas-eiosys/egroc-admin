// ApiEndPoints apiEndPoints = ApiEndPoints();

import 'api_endpoints.dart';
import 'api_utils.dart';

class ApiRepo {
  login({required String email, required String password}) async {
    try {
      final response = await ApiUtils().post(
          url: ApiEndPoints.login,
          data: {"emailAddress": email, "password": password});

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  getAllProducts() async {
    try {
      final response = await ApiUtils().get(
        url: ApiEndPoints.allProducts,
      );

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  getAllCategories() async {
    try {
      final response = await ApiUtils().get(
        url: ApiEndPoints.allCategories,
      );

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  getSubCategory({required String id}) async {
    try {
      final response = await ApiUtils().get(
          url: ApiEndPoints.allCategories, queryParameters: {"parentId": id});

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  addCategory({required Map<String, dynamic> data}) async {
    try {
      final response =
          await ApiUtils().post(url: ApiEndPoints.allCategories, data: data);
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  editCategory({required Map<String, dynamic> data, required int id}) async {
    try {
      final response = await ApiUtils()
          .patch(url: "${ApiEndPoints.allCategories}/$id", data: data);
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  addSubCategory({required Map<String, dynamic> data}) async {
    try {
      final response =
          await ApiUtils().post(url: ApiEndPoints.allCategories, data: data);
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  editSubCategory({required Map<String, dynamic> data, required int id}) async {
    try {
      final response = await ApiUtils()
          .patch(url: "${ApiEndPoints.allCategories}/$id", data: data);
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  editProduct({required Map<String, dynamic> data, required int id}) async {
    try {
      final response = await ApiUtils()
          .patch(url: "${ApiEndPoints.allProducts}/$id", data: data);
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  getOrders() async {
    try {
      final response = await ApiUtils().get(url: ApiEndPoints.orders);
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
