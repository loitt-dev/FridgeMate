import 'package:flutter/material.dart';

/// Bottom Navigation Bar với animation đặc biệt
///
/// Component navigation bar hiển thị ở dưới cùng màn hình với:
/// - Icon circle ở giữa khi active
/// - Animation scale khi chuyển tab
/// - Hỗ trợ gradient và shadow
class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({
    super.key,
    required this.activeIndex,
    this.onTap,
    this.tabCurve = Curves.linearToEaseOut,
    this.iconCurve = Curves.bounceOut,
    this.tabDurationMillSec = 500,
    this.iconDurationMillSec = 300,
    required this.activeIcons,
    required this.inactiveIcons,
    this.circleWidth = 60,
    required this.color,
    this.height = 75,
    this.circleColor,
    this.padding = EdgeInsets.zero,
    this.cornerRadius = BorderRadius.zero,
    this.shadowColor = Colors.transparent,
    this.circleShadowColor = Colors.transparent,
    this.elevation = 0,
    this.gradient,
    this.circleGradient,
    this.levels,
    this.activeLevelsStyle,
    this.inactiveLevelsStyle,
  }) : assert(
         circleWidth <= height,
         "circleWidth phải nhỏ hơn hoặc bằng height",
       ),
       assert(activeIcons.length % 2 == 0, "activeIcons phải là số chẵn"),
       assert(inactiveIcons.length % 2 == 0, "inactiveIcons phải là số chẵn"),
       assert(
         activeIcons.length == inactiveIcons.length,
         "activeIcons và inactiveIcons phải có cùng số lượng!",
       ),
       assert(
         activeIcons.length > activeIndex,
         "activeIndex phải nhỏ hơn activeIcons.length",
       );

  /// Chiều cao của bottom bar (không tính padding phía dưới)
  final double height;

  /// Đường kính của circle icon ở giữa
  final double circleWidth;

  /// Màu nền của bottom bar
  ///
  /// Nếu có gradient thì màu này sẽ bị bỏ qua
  final Color color;

  /// Màu của circle icon khi active
  ///
  /// Nếu có circleGradient thì màu này sẽ bị bỏ qua
  /// Nếu null thì dùng color mặc định
  final Color? circleColor;

  /// Danh sách icon active (hiển thị khi tab được chọn)
  ///
  /// Icon phải nhỏ hơn đường kính circle
  /// Số lượng phải bằng inactiveIcons
  final List<Widget> activeIcons;

  /// Danh sách icon inactive (hiển thị khi tab không được chọn)
  ///
  /// Icon phải nhỏ hơn chiều cao bottom bar
  /// Số lượng phải bằng activeIcons
  final List<Widget> inactiveIcons;

  /// Padding xung quanh bottom bar
  final EdgeInsets padding;

  /// Bo góc của bottom bar
  ///
  /// Có thể chỉ định giá trị khác nhau cho từng góc
  final BorderRadius cornerRadius;

  /// Màu shadow của bottom bar
  final Color shadowColor;

  /// Màu shadow của circle icon khi active
  ///
  /// Nếu null thì dùng shadowColor mặc định
  final Color? circleShadowColor;

  /// Độ nổi của shadow
  final double elevation;

  /// Gradient nền của bottom bar
  ///
  /// Nếu có gradient thì color sẽ bị bỏ qua
  final Gradient? gradient;

  /// Gradient của circle icon khi active
  ///
  /// Nếu null thì có thể dùng gradient mặc định
  final Gradient? circleGradient;

  /// Chỉ số tab đang được chọn
  final int activeIndex;

  /// Curve cho animation di chuyển circle icon
  final Curve tabCurve;

  /// Curve cho animation scale icon khi active
  final Curve iconCurve;

  /// Thời gian animation di chuyển circle (milliseconds)
  final int tabDurationMillSec;

  /// Thời gian animation scale icon (milliseconds)
  final int iconDurationMillSec;

  /// Callback khi tap vào một tab
  ///
  /// Cần cập nhật state bằng cách set activeIndex mới
  final Function(int index)? onTap;

  /// Danh sách label hiển thị dưới mỗi icon
  final List<String>? levels;

  /// Style cho label khi tab đang active
  final TextStyle? activeLevelsStyle;

  /// Style cho label khi tab không active
  final TextStyle? inactiveLevelsStyle;

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

/// State class quản lý animation và UI của navigation bar
class _AppNavigationBarState extends State<AppNavigationBar>
    with TickerProviderStateMixin {
  // Controller cho animation scale icon
  late AnimationController _iconAnimationController;

  // Animation value từ 0.0 đến 1.0
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    // Khởi tạo animation controller với thời gian từ widget
    _iconAnimationController = AnimationController(
      duration: Duration(milliseconds: widget.iconDurationMillSec),
      vsync: this,
    );

    // Tạo animation với curve được chỉ định
    _iconAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _iconAnimationController,
        curve: widget.iconCurve,
      ),
    );

    // Chạy animation ngay khi khởi tạo
    _iconAnimationController.forward();
  }

  @override
  void didUpdateWidget(AppNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Nếu activeIndex thay đổi, reset và chạy lại animation
    if (oldWidget.activeIndex != widget.activeIndex) {
      _iconAnimationController.reset();
      _iconAnimationController.forward();
    }
  }

  @override
  void dispose() {
    // Giải phóng animation controller
    _iconAnimationController.dispose();
    super.dispose();
  }

  /// Tính toán vị trí percentage của item trong navigation bar
  ///
  /// Ví dụ: item thứ 2 trong 4 items sẽ có position = 0.375
  double getPosition(int i) {
    int itemCnt = widget.activeIcons.length;
    return i / itemCnt + (1 / itemCnt) / 2;
  }

  @override
  Widget build(BuildContext context) {
    // Tạo danh sách inactive icons và insert một SizedBox ở giữa
    // để tạo khoảng trống cho circle icon
    final newInactiveIcons = <Widget>[...widget.inactiveIcons]
      ..insert(widget.activeIcons.length ~/ 2, const SizedBox.shrink());

    return Container(
      margin: widget.padding,
      width: double.infinity,
      height: widget.height,
      child: Stack(
        children: [
          // Vẽ nền navigation bar và circle icon
          _buildNavigationBarBackground(),

          // Hiển thị các icon và label
          _buildNavigationItems(newInactiveIcons),
        ],
      ),
    );
  }

  /// Vẽ nền navigation bar với CustomPaint
  Widget _buildNavigationBarBackground() {
    return CustomPaint(
      painter: _AppNavigationBarPainter(
        iconWidth: widget.circleWidth,
        color: widget.color,
        circleColor: widget.circleColor ?? widget.color,
        xOffsetPercent: 0.5, // Circle luôn ở giữa (50%)
        boxRadius: widget.cornerRadius,
        shadowColor: widget.shadowColor,
        circleShadowColor: widget.circleShadowColor ?? widget.shadowColor,
        elevation: widget.elevation,
        gradient: widget.gradient,
        circleGradient: widget.circleGradient ?? widget.gradient,
      ),
      child: SizedBox(height: widget.height, width: double.infinity),
    );
  }

  /// Xây dựng các navigation item (icon và label)
  Widget _buildNavigationItems(List<Widget> inactiveIcons) {
    return Row(
      children: inactiveIcons.map((iconWidget) {
        final int currentIndex = _calculateCurrentIndex(
          iconWidget,
          inactiveIcons,
        );
        final bool isActive = widget.activeIndex == currentIndex;

        return Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => widget.onTap?.call(currentIndex),
            child: Column(
              mainAxisAlignment:
                  widget.levels != null && currentIndex < widget.levels!.length
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.center,
              children: [
                // Hiển thị icon với animation nếu active
                _buildIcon(iconWidget, currentIndex, isActive),

                // Hiển thị label nếu có
                if (widget.levels != null &&
                    currentIndex < widget.levels!.length)
                  _buildLabel(currentIndex, isActive),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  /// Tính toán chỉ số thật của icon trong danh sách
  ///
  /// Vì có insert SizedBox ở giữa nên cần điều chỉnh index
  int _calculateCurrentIndex(Widget iconWidget, List<Widget> iconList) {
    int index = iconList.indexOf(iconWidget);
    if (index > widget.inactiveIcons.length ~/ 2) {
      index--;
    }
    return index;
  }

  /// Xây dựng icon với animation scale khi active
  Widget _buildIcon(Widget inactiveIcon, int index, bool isActive) {
    return AnimatedBuilder(
      animation: _iconAnimation,
      builder: (context, child) {
        if (isActive) {
          // Animation scale từ 0.8 lên 1.0 và fade in
          return Transform.scale(
            scale: 0.8 + (_iconAnimation.value * 0.2),
            child: Opacity(
              opacity: _iconAnimation.value,
              child: widget.activeIcons[index],
            ),
          );
        }
        return inactiveIcon;
      },
    );
  }

  /// Xây dựng label dưới icon
  Widget _buildLabel(int index, bool isActive) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Text(
        widget.levels![index],
        style: isActive ? widget.activeLevelsStyle : widget.inactiveLevelsStyle,
      ),
    );
  }
}

/// CustomPainter để vẽ navigation bar với circle icon ở giữa
///
/// Vẽ background với bo góc và một cung lõm ở giữa để chứa circle icon
class _AppNavigationBarPainter extends CustomPainter {
  _AppNavigationBarPainter({
    required this.iconWidth,
    required this.color,
    required this.circleColor,
    required this.xOffsetPercent,
    required this.boxRadius,
    required this.shadowColor,
    required this.circleShadowColor,
    required this.elevation,
    this.gradient,
    this.circleGradient,
  });

  final Color color;
  final Color circleColor;
  final double iconWidth;
  final double xOffsetPercent;
  final BorderRadius boxRadius;
  final Color shadowColor;
  final Color circleShadowColor;
  final double elevation;
  final Gradient? gradient;
  final Gradient? circleGradient;

  /// Tính bán kính lớn của cung lõm
  static double getR(double circleWidth) {
    return circleWidth / 2 * 1.2;
  }

  /// Tính bán kính nhỏ cho bo góc
  static double getMiniRadius(double circleWidth) {
    return getR(circleWidth) * 0.3;
  }

  /// Chuyển đổi radius sang sigma cho blur effect
  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Tạo Paint objects cho background và circle
    final Paint backgroundPaint = _createBackgroundPaint(size);
    final Paint? circlePaint = _createCirclePaint();

    // Tính toán các giá trị cần thiết
    final double w = size.width;
    final double h = size.height;
    final double r = getR(iconWidth);
    final double miniRadius = getMiniRadius(iconWidth);
    final double x = xOffsetPercent * w;
    final double firstX = x - r;
    final double secondX = x + r;

    // Vẽ path cho background navigation bar
    final Path backgroundPath = _createBackgroundPath(
      w,
      h,
      firstX,
      secondX,
      miniRadius,
      r,
    );

    // Vẽ shadow trước (layer dưới)
    _drawShadow(canvas, backgroundPath, x, miniRadius);

    // Vẽ background
    canvas.drawPath(backgroundPath, backgroundPaint);

    // Vẽ circle icon
    _drawCircle(canvas, x, miniRadius, circlePaint ?? backgroundPaint);
  }

  /// Tạo Paint cho background với gradient hoặc màu
  Paint _createBackgroundPaint(Size size) {
    final Paint paint = Paint();
    paint.color = color;

    if (gradient != null) {
      final Rect shaderRect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: 180.0,
      );
      paint.shader = gradient!.createShader(shaderRect);
    }

    return paint;
  }

  /// Tạo Paint riêng cho circle icon nếu cần
  Paint? _createCirclePaint() {
    if (color != circleColor || circleGradient != null) {
      final Paint paint = Paint();
      paint.color = circleColor;
      return paint;
    }
    return null;
  }

  /// Tạo Path cho background với cung lõm ở giữa
  Path _createBackgroundPath(
    double w,
    double h,
    double firstX,
    double secondX,
    double miniRadius,
    double r,
  ) {
    final Path path = Path();

    // Bo góc trên bên trái
    path.moveTo(0, 0 + boxRadius.topLeft.y);
    path.quadraticBezierTo(0, 0, boxRadius.topLeft.x, 0);

    // Đường thẳng đến đầu cung lõm
    path.lineTo(firstX - miniRadius, 0);
    path.quadraticBezierTo(firstX, 0, firstX, miniRadius);

    // Vẽ cung lõm (cung cung) ở giữa
    path.arcToPoint(
      Offset(secondX, miniRadius),
      radius: Radius.circular(r),
      clockwise: false,
    );

    path.quadraticBezierTo(secondX, 0, secondX + miniRadius, 0);

    // Bo góc trên bên phải
    path.lineTo(w - boxRadius.topRight.x, 0);
    path.quadraticBezierTo(w, 0, w, boxRadius.topRight.y);

    // Bo góc dưới bên phải
    path.lineTo(w, h - boxRadius.bottomRight.y);
    path.quadraticBezierTo(w, h, w - boxRadius.bottomRight.x, h);

    // Bo góc dưới bên trái
    path.lineTo(boxRadius.bottomLeft.x, h);
    path.quadraticBezierTo(0, h, 0, h - boxRadius.bottomLeft.y);

    path.close();
    return path;
  }

  /// Vẽ shadow cho background và circle
  void _drawShadow(
    Canvas canvas,
    Path backgroundPath,
    double x,
    double miniRadius,
  ) {
    // Shadow cho background path
    canvas.drawPath(
      backgroundPath,
      Paint()
        ..color = shadowColor
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          convertRadiusToSigma(elevation),
        ),
    );

    // Shadow cho circle
    canvas.drawCircle(
      Offset(x, miniRadius),
      iconWidth / 2,
      Paint()
        ..color = circleShadowColor
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          convertRadiusToSigma(elevation),
        ),
    );
  }

  /// Vẽ circle icon với gradient nếu có
  void _drawCircle(Canvas canvas, double x, double miniRadius, Paint paint) {
    // Áp dụng gradient cho circle nếu có
    if (circleGradient != null) {
      final Rect shaderRect = Rect.fromCircle(
        center: Offset(x, miniRadius),
        radius: iconWidth / 2,
      );
      paint.shader = circleGradient!.createShader(shaderRect);
    }

    canvas.drawCircle(Offset(x, miniRadius), iconWidth / 2, paint);
  }

  @override
  bool shouldRepaint(_AppNavigationBarPainter oldDelegate) =>
      oldDelegate != this;
}

/// Custom FAB location cho navigation bar
///
/// Định vị FAB ở giữa và canh chỉnh với bottom bar
class AppNavigationBarFabLocation extends StandardFabLocation
    with FabCenterOffsetX, FabDockedOffsetY {
  const AppNavigationBarFabLocation();

  @override
  String toString() => 'CustomCenterDockedFabLocation';

  @override
  double getOffsetY(
    ScaffoldPrelayoutGeometry scaffoldGeometry,
    double adjustment,
  ) {
    // Offset thêm 10px để canh chỉnh với bottom bar
    return super.getOffsetY(scaffoldGeometry, adjustment) + 10;
  }
}
