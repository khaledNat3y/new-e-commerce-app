abstract class ApiEndpoints {
  static const apiBaseUrl = "https://fakestoreapi.com/";
  static const getAllProductsEndPoint = "products";
  static const authLoginEndPoint = "auth/login";
  static const getCategoriesEndPoint = "products/categories";
  static const getAllCartsEndPoint = "carts";
  static const registerEndPoint = "users";
  static const categoryProducts = "products/category";
  static const getAllProductsFromRouteApi = "https://ecommerce.routemisr.com/api/v1/products";
  static const addToCartEndPoint = "${routeBaseUrl}api/v1/cart";
  static const routeBaseUrl = "https://ecommerce.routemisr.com/";
  static const getLoggedInUserCartRouteEndPoint = "${routeBaseUrl}api/v1/cart";
  static const deleteAllInCartRouteEndPoint = "${routeBaseUrl}api/v1/cart";
  static const getCategoriesRouteEndPoint = "${routeBaseUrl}api/v1/categories";
  static const loginRouteEndPoint = "${routeBaseUrl}api/v1/auth/signin";
  static const registerRouteEndPoint = "${routeBaseUrl}api/v1/auth/signup";
}