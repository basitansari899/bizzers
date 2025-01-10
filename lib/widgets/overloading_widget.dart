import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XLoadingOverlay extends StatelessWidget {
  const XLoadingOverlay({
    required this.loading,
    required this.child,
    super.key,
  });

  final RxBool loading;
  final Widget child;

  bool get isLoading => loading.value;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isLoading,
      child: Stack(
        children: [
          child,
          Obx(() => isLoading ? _buildLoading() : Container()),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      color: Colors.black38.withValues(alpha: 0.48),
      child: Center(
        child: Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Center(
            child: SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
              ),
            ),
          ),
        ),
      ),
    );
  }
}
