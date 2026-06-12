import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';
import '../theme/app_theme.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'es_CO', symbol: '\$', decimalDigits: 0);
    
    final name = product['name'] ?? 'Desconocido';
    final price = product['price'] ?? 0;
    final quantity = product['quantity'] ?? 0;
    final category = product['category'] ?? 'General';
    final sku = product['sku'] ?? 'N/A';
    
    String createdAtStr = 'Desconocido';
    if (product['created_at'] != null) {
      try {
        final date = DateTime.parse(product['created_at']);
        createdAtStr = DateFormat('dd/MM/yyyy HH:mm').format(date);
      } catch (_) {}
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Hero Banner
            Stack(
              children: [
                Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppTheme.primaryDark, AppTheme.primaryLight],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                // Decorative patterns
                Positioned(
                  right: -50,
                  top: -50,
                  child: Icon(Icons.inventory_2_rounded, size: 300, color: Colors.white.withOpacity(0.1)),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, AppTheme.background.withOpacity(1)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Hero(
                        tag: 'product_icon_${product['id']}',
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 10)),
                            ],
                          ),
                          child: const Icon(Icons.inventory_2_rounded, size: 100, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            // Content
            Transform.translate(
              offset: const Offset(0, -30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppTheme.accent.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppTheme.accent.withOpacity(0.3)),
                        ),
                        child: Text(
                          category.toUpperCase(),
                          style: const TextStyle(color: AppTheme.accent, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: -0.5),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 36, height: 1.1),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        'Ref: $sku',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                      ).animate().fadeIn(delay: 400.ms),
                    ),
                    const SizedBox(height: 40),
                    
                    // Glassmorphism Info Cards
                    _buildGlassInfoCard(
                      context, 
                      icon: Icons.sell_rounded, 
                      title: 'Precio Unitario', 
                      value: formatCurrency.format(price),
                      highlight: true,
                    ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.1),
                    const SizedBox(height: 16),
                    _buildGlassInfoCard(
                      context, 
                      icon: Icons.layers_rounded, 
                      title: 'Cantidad Disponible', 
                      value: '$quantity unidades',
                      color: quantity > 0 ? AppTheme.accent : Colors.redAccent,
                    ).animate().fadeIn(delay: 600.ms).slideX(begin: 0.1),
                    const SizedBox(height: 16),
                    _buildGlassInfoCard(
                      context, 
                      icon: Icons.calendar_month_rounded, 
                      title: 'Fecha de Ingreso', 
                      value: createdAtStr,
                    ).animate().fadeIn(delay: 700.ms).slideX(begin: 0.1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassInfoCard(BuildContext context, {
    required IconData icon, 
    required String title, 
    required String value,
    bool highlight = false,
    Color? color,
  }) {
    final iconColor = color ?? (highlight ? AppTheme.primaryLight : Colors.white);
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.surfaceHighlight.withOpacity(0.5),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14)),
                    const SizedBox(height: 6),
                    Text(
                      value, 
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: highlight ? 24 : 20,
                        color: highlight ? Colors.white : AppTheme.textPrimary,
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
  }
}
