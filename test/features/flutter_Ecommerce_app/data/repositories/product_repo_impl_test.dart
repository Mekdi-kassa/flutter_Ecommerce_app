import 'package:ecommerce_app/core/plateform/network_info.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/datasources/prodouct_local_repo.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/datasources/product_remote_data.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/repositories/product_remote_data_impl.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/repositories/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements ProductRemoteData {}

class MockLocalDataSource extends Mock implements ProductLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ProductRepositoryImpl repo;
  MockLocalDataSource mocklocal;
  MockRemoteDataSource mockremote;
  MockNetworkInfo mocknetworkinfo;
  setUp(() {
    mockremote = MockRemoteDataSource();
    mocklocal = MockLocalDataSource();
    mocknetworkinfo = MockNetworkInfo();
    repo = ProductRepositoryImpl(
      remoteDataSource: mockremote,
      localDataSource : mocklocal,
      networkInfo :mocknetworkinfo,
    );
  });
}
