//
// import 'package:get_it/get_it.dart';
// import 'package:haute_boutique/features/categories/ui/cubit/categories_cubit.dart';
// import 'package:haute_boutique/features/chocolates/ui/cubit/chocolates_cubit.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:haute_boutique/core/network/api_service.dart';
// import 'package:haute_boutique/features/auth/login/ui/cubit/auth_cubit.dart';
// import 'package:haute_boutique/features/auth/sign_up/ui/cubit/sign_up_cubit.dart';
// import 'package:haute_boutique/features/auth/otp/ui/cubit/otp_cubit.dart';
// import 'package:haute_boutique/features/home/ui/cubit/home_cubit.dart';
// import '../../features/auth/login/data/repo/auth_repository.dart';
// import '../../features/auth/login/data/repo/auth_repository_impl.dart';
// import '../../features/cart/ui/cubit/cart_screen_cubit.dart';
// import '../../features/flowers/ui/cubit/flowers_cubit.dart';
// import '../../features/home/data/repo/home_repository.dart';
// import '../../features/home/data/repo/home_repository_impl.dart';
// import '../../features/my_account/data/repo/account_repository.dart';
// import '../../features/my_account/data/repo/account_repository_impl.dart';
// import '../../features/my_account/ui/cubit/my_account_cubit.dart';
// import '../../features/my_orders/data/repo/orders_repository.dart';
// import '../../features/my_orders/data/repo/orders_repository_impl.dart';
// import '../../features/my_orders/ui/cubit/my_orders_cubit.dart';
// import '../../features/new_in/ui/cubit/new_in_cubit.dart';
// import '../../features/occasions/data/repo/occasion_repository.dart';
// import '../../features/occasions/data/repo/occasion_repository_impl.dart';
// import '../../features/occasions/ui/cubit/occasion_cubit.dart';
// import '../../features/occasions/ui/cubit/occasion_products_cubit.dart';
// import '../../features/product/data/repo/products_repository.dart';
// import '../../features/product/data/repo/products_repository_impl.dart';
// import '../../features/product/ui/cubit/products_cubit.dart';
// import '../../features/product_details/data/repo/cart_repository.dart';
// import '../../features/product_details/data/repo/cart_repository_impl.dart';
// import '../../features/product_details/ui/cubit/cart_cubit.dart';
// import '../../features/product_details/ui/cubit/product_details_cubit.dart';
// import '../../features/wishlist/data/repo/wishlist_repository.dart';
// import '../../features/wishlist/data/repo/wishlist_repository_impl.dart';
// import '../../features/wishlist/ui/cubit/wishlist_cubit.dart';
// import '../../features/wishlist/ui/cubit/wishlist_screen_cubit.dart';
// import '../network/auth_local_data_source.dart';
//
// final sl = GetIt.instance;
//
// Future<void> initServiceLocator() async {
//
//   final prefs = await SharedPreferences.getInstance();
//   sl.registerLazySingleton<SharedPreferences>(() => prefs);
//   sl.registerLazySingleton<OccasionRepository>(
//         () => OccasionRepositoryImpl(sl<ApiService>()),
//   );
//   sl.registerLazySingleton<OrdersRepository>(
//         () => OrdersRepositoryImpl(sl<ApiService>()),
//   );
//   sl.registerLazySingleton<CartRepository>(
//         () => CartRepositoryImpl(sl<ApiService>()),
//   );
//
//   sl.registerFactory<CartCubit>(
//         () => CartCubit(sl<CartRepository>()),
//   );
//   sl.registerFactory<CartScreenCubit>(
//         () => CartScreenCubit(sl<CartRepository>()),
//   );
//   sl.registerFactory<MyOrdersCubit>(
//         () => MyOrdersCubit(sl<OrdersRepository>()),
//   );
//   sl.registerLazySingleton<WishlistRepository>(
//         () => WishlistRepositoryImpl(sl<ApiService>()),
//   );
//
//   sl.registerFactory<WishlistCubit>(
//         () => WishlistCubit(sl<WishlistRepository>()),
//   );
//   sl.registerFactory<WishlistScreenCubit>(
//         () => WishlistScreenCubit(sl<WishlistRepository>()),
//   );
//   sl.registerFactory<FlowersCubit>(() => FlowersCubit(sl()));
//   sl.registerFactory<ChocolatesCubit>(() => ChocolatesCubit(sl()));
//   sl.registerFactory<CategoriesCubit>(
//         () => CategoriesCubit(sl<ProductsRepository>()),
//   );
//   sl.registerLazySingleton<AccountRepository>(
//         () => AccountRepositoryImpl(sl<ApiService>()),
//   );
//
//   sl.registerFactory<MyAccountCubit>(
//         () => MyAccountCubit(sl<AccountRepository>()),
//   );
//   sl.registerFactory<ProductDetailsCubit>(
//         () => ProductDetailsCubit(sl<ProductsRepository>()),
//   );
//   sl.registerFactory<OccasionCubit>(
//         () => OccasionCubit(sl<OccasionRepository>()),
//   );
//   sl.registerFactory<OccasionProductsCubit>(
//         () => OccasionProductsCubit(sl<OccasionRepository>()),
//   );
//
//   sl.registerFactory<NewInCubit>(
//         () => NewInCubit(sl<ProductsRepository>()),
//   );
//   sl.registerLazySingleton<ApiService>(() => ApiService());
//
//
//   sl.registerLazySingleton<AuthLocalDataSource>(
//         () => AuthLocalDataSourceImpl(sl<SharedPreferences>()),
//   );
//
//
//   sl.registerLazySingleton<AuthRepository>(
//         () => AuthRepositoryImpl(
//       sl<ApiService>(),
//       sl<AuthLocalDataSource>(),
//     ),
//   );
//
//   sl.registerFactory<AuthCubit>(() => AuthCubit(sl<AuthRepository>()));
//   sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl<AuthRepository>()));
//   sl.registerFactory<OtpCubit>(() => OtpCubit(sl<AuthRepository>()));
//
//
//   sl.registerLazySingleton<HomeRepository>(
//         () => HomeRepositoryImpl(sl<ApiService>()),
//   );
//   sl.registerFactory<HomeCubit>(() => HomeCubit(sl<HomeRepository>()));
//   sl.registerLazySingleton<ProductsRepository>(
//         () => ProductsRepositoryImpl(sl<ApiService>()),
//   );
//   sl.registerFactory<ProductsCubit>(
//         () => ProductsCubit(sl<ProductsRepository>()),
//   );
//
//   final token = sl<AuthLocalDataSource>().getToken();
//   if (token != null && token.isNotEmpty) {
//     sl<ApiService>().setAuthToken(token);
//   }
// }