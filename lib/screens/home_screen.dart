import 'package:flutter/material.dart';
import '../widgets/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _promoKey = GlobalKey();
  final GlobalKey _infoKey = GlobalKey();

  bool _isPromoWhite = true;
  bool _isInfoWhite = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateColors);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateColors());
  }

  void _updateColors() {
    bool changed = false;

    if (_promoKey.currentContext != null) {
      final RenderBox box =
          _promoKey.currentContext!.findRenderObject() as RenderBox;
      final y = box.localToGlobal(Offset.zero).dy;
      final shouldBeWhite = y < 480;
      if (_isPromoWhite != shouldBeWhite) {
        _isPromoWhite = shouldBeWhite;
        changed = true;
      }
    }

    if (_infoKey.currentContext != null) {
      final RenderBox box =
          _infoKey.currentContext!.findRenderObject() as RenderBox;
      final y = box.localToGlobal(Offset.zero).dy;
      final shouldBeWhite = y < 480;
      if (_isInfoWhite != shouldBeWhite) {
        _isInfoWhite = shouldBeWhite;
        changed = true;
      }
    }

    if (changed) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryOrange = Color(0xFFFF5A26);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 600,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryOrange,
                    primaryOrange,
                    primaryOrange.withOpacity(0.3),
                    primaryOrange.withOpacity(0.0),
                  ],
                  stops: const [0.0, 0.65, 0.9, 1.0],
                ),
              ),
            ),
          ),

          SafeArea(
            top: false,
            child: Column(
              children: [
                const HomeHeader(),

                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                'Pendapatan Hari Ini',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Rp0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _buildStatItem(
                                        Icons.sell_outlined,
                                        'Penjualan',
                                        '0',
                                      ),
                                      _buildStatItem(
                                        Icons.receipt_long_outlined,
                                        'Pengeluaran',
                                        '0',
                                      ),
                                      _buildStatItem(
                                        Icons.history_outlined,
                                        'Transaksi',
                                        '0',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: GridView.count(
                              padding: EdgeInsets.zero,
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5,
                              childAspectRatio: 0.95,
                              children: [
                                _buildGridItem(
                                  Icons.shopping_basket,
                                  'Layanan',
                                  Colors.orange.shade100,
                                  primaryOrange,
                                ),
                                _buildGridItem(
                                  Icons.person,
                                  'Pelanggan',
                                  Colors.orange.shade100,
                                  primaryOrange,
                                ),
                                _buildGridItem(
                                  Icons.people,
                                  'Karyawan',
                                  Colors.grey.shade200,
                                  Colors.grey.shade600,
                                ),
                                _buildGridItem(
                                  Icons.shopping_bag,
                                  'Pengeluaran',
                                  Colors.red.shade100,
                                  Colors.red.shade400,
                                ),
                                _buildGridItem(
                                  Icons.bar_chart,
                                  'Laporan',
                                  Colors.blue.shade100,
                                  Colors.blue.shade500,
                                ),
                                _buildGridItem(
                                  Icons.storefront,
                                  'Outlet',
                                  Colors.brown.shade100,
                                  Colors.brown.shade500,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // PROMO SECTION
                        Padding(
                          key: _promoKey,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: _isPromoWhite
                                      ? Colors.white.withOpacity(0.2)
                                      : primaryOrange.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Promo',
                                  style: TextStyle(
                                    color: _isPromoWhite
                                        ? Colors.white
                                        : primaryOrange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'Lihat Semua',
                                style: TextStyle(
                                  color: _isPromoWhite
                                      ? Colors.white
                                      : primaryOrange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/promo_banner.png',
                                height: 170,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      height: 170,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: primaryOrange.withOpacity(0.2),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Promo Banner',
                                          style: TextStyle(
                                            color: primaryOrange,
                                          ),
                                        ),
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        Padding(
                          key: _infoKey,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: _isInfoWhite
                                      ? Colors.white.withOpacity(0.2)
                                      : primaryOrange.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Informasi',
                                  style: TextStyle(
                                    color: _isInfoWhite
                                        ? Colors.white
                                        : primaryOrange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'Lihat Semua',
                                style: TextStyle(
                                  color: _isInfoWhite
                                      ? Colors.white
                                      : primaryOrange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/promo_banner.png',
                                height: 170,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      height: 170,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: primaryOrange.withOpacity(0.2),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Informasi Banner',
                                          style: TextStyle(
                                            color: primaryOrange,
                                          ),
                                        ),
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String title, String value) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white, size: 14),
            const SizedBox(width: 4),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(
    IconData icon,
    String title,
    Color bgColor,
    Color iconColor,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: iconColor, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
