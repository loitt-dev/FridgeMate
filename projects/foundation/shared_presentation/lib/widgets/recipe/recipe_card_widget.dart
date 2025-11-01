import 'package:flutter/material.dart';

/// Recipe card widget để hiển thị thông tin công thức
///
/// Cung cấp:
/// - Recipe image
/// - Title và description
/// - Cooking time và difficulty
/// - Rating và reviews
/// - Action buttons
class RecipeCardWidget extends StatelessWidget {
  final String title;
  final String? description;
  final String? imageUrl;
  final Widget? image;
  final Duration? cookingTime;
  final RecipeDifficulty? difficulty;
  final double? rating;
  final int? reviewCount;
  final List<String>? tags;
  final List<String>? ingredients;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final VoidCallback? onShare;
  final bool isFavorite;
  final bool isBookmarked;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final BorderRadius? borderRadius;
  final RecipeCardStyle style;

  const RecipeCardWidget({
    super.key,
    required this.title,
    this.description,
    this.imageUrl,
    this.image,
    this.cookingTime,
    this.difficulty,
    this.rating,
    this.reviewCount,
    this.tags,
    this.ingredients,
    this.onTap,
    this.onFavorite,
    this.onShare,
    this.isFavorite = false,
    this.isBookmarked = false,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.elevation,
    this.borderRadius,
    this.style = RecipeCardStyle.standard,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case RecipeCardStyle.standard:
        return _buildStandardCard(context);
      case RecipeCardStyle.compact:
        return _buildCompactCard(context);
      case RecipeCardStyle.detailed:
        return _buildDetailedCard(context);
    }
  }

  Widget _buildStandardCard(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: elevation,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(context),
            Padding(
              padding: padding ?? const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  if (description != null) ...[
                    const SizedBox(height: 8),
                    _buildDescription(context),
                  ],
                  const SizedBox(height: 12),
                  _buildMetadata(context),
                  if (tags != null && tags!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _buildTags(context),
                  ],
                  const SizedBox(height: 12),
                  _buildActions(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactCard(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: elevation,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(12),
          child: Row(
            children: [
              _buildCompactImage(context),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCompactHeader(context),
                    if (cookingTime != null || difficulty != null) ...[
                      const SizedBox(height: 4),
                      _buildCompactMetadata(context),
                    ],
                  ],
                ),
              ),
              if (onFavorite != null) ...[
                const SizedBox(width: 8),
                IconButton(
                  onPressed: onFavorite,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailedCard(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: elevation,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(context),
            Padding(
              padding: padding ?? const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  if (description != null) ...[
                    const SizedBox(height: 8),
                    _buildDescription(context),
                  ],
                  const SizedBox(height: 12),
                  _buildMetadata(context),
                  if (rating != null) ...[
                    const SizedBox(height: 8),
                    _buildRating(context),
                  ],
                  if (tags != null && tags!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _buildTags(context),
                  ],
                  if (ingredients != null && ingredients!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _buildIngredients(context),
                  ],
                  const SizedBox(height: 12),
                  _buildActions(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final imageWidget =
        image ??
        (imageUrl != null
            ? Image.network(
                imageUrl!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildImagePlaceholder(),
              )
            : _buildImagePlaceholder());

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: borderRadius?.topLeft ?? const Radius.circular(12),
        topRight: borderRadius?.topRight ?? const Radius.circular(12),
      ),
      child: imageWidget,
    );
  }

  Widget _buildCompactImage(BuildContext context) {
    final imageWidget =
        image ??
        (imageUrl != null
            ? Image.network(
                imageUrl!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildCompactImagePlaceholder(),
              )
            : _buildCompactImagePlaceholder());

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: imageWidget,
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.grey.shade300,
      child: const Icon(Icons.restaurant, size: 64, color: Colors.grey),
    );
  }

  Widget _buildCompactImagePlaceholder() {
    return Container(
      width: 80,
      height: 80,
      color: Colors.grey.shade300,
      child: const Icon(Icons.restaurant, size: 32, color: Colors.grey),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (isBookmarked)
          const Icon(Icons.bookmark, color: Colors.blue, size: 20),
      ],
    );
  }

  Widget _buildCompactHeader(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      description!,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMetadata(BuildContext context) {
    return Row(
      children: [
        if (cookingTime != null) ...[
          Icon(
            Icons.schedule,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            _formatDuration(cookingTime!),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        if (cookingTime != null && difficulty != null) ...[
          const SizedBox(width: 16),
        ],
        if (difficulty != null) ...[
          Icon(
            Icons.trending_up,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            _getDifficultyText(difficulty!),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCompactMetadata(BuildContext context) {
    return Row(
      children: [
        if (cookingTime != null) ...[
          Icon(
            Icons.schedule,
            size: 14,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            _formatDuration(cookingTime!),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        if (cookingTime != null && difficulty != null) ...[
          const SizedBox(width: 12),
        ],
        if (difficulty != null) ...[
          Icon(
            Icons.trending_up,
            size: 14,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            _getDifficultyText(difficulty!),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildRating(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 16, color: Colors.amber),
        const SizedBox(width: 4),
        Text(
          rating!.toStringAsFixed(1),
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        if (reviewCount != null) ...[
          const SizedBox(width: 4),
          Text(
            '($reviewCount)',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTags(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: tags!
          .map(
            (tag) => Chip(
              label: Text(tag, style: Theme.of(context).textTheme.bodySmall),
              backgroundColor: Theme.of(
                context,
              ).colorScheme.surfaceContainerHighest,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          )
          .toList(),
    );
  }

  Widget _buildIngredients(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nguyên liệu (${ingredients!.length})',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          ingredients!.take(3).join(', ') +
              (ingredients!.length > 3 ? '...' : ''),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (onShare != null)
          IconButton(onPressed: onShare, icon: const Icon(Icons.share)),
        if (onFavorite != null)
          IconButton(
            onPressed: onFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
          ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else {
      return '${duration.inMinutes}m';
    }
  }

  String _getDifficultyText(RecipeDifficulty difficulty) {
    switch (difficulty) {
      case RecipeDifficulty.easy:
        return 'Dễ';
      case RecipeDifficulty.medium:
        return 'Trung bình';
      case RecipeDifficulty.hard:
        return 'Khó';
    }
  }
}

/// Enums
enum RecipeDifficulty { easy, medium, hard }

enum RecipeCardStyle { standard, compact, detailed }
