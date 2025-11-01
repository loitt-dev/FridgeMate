import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:domain/domain.dart';

/// Dashboard card showing recipe suggestions
///
/// Displays:
/// - Horizontal scrollable list of 2-3 suggested recipes
/// - Each recipe shows image, title, match %, time, servings
class RecipeSuggestionCard extends StatelessWidget {
  final List<Recipe> recipes;
  final Function(Recipe) onRecipeTap;

  const RecipeSuggestionCard({
    super.key,
    required this.recipes,
    required this.onRecipeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimen.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.cardRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimen.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: AppDimen.spacingL),

            // Recipe list or empty state
            recipes.isEmpty ? _buildEmptyState() : _buildRecipeList(),
          ],
        ),
      ),
    );
  }

  /// Build header with icon and title
  Widget _buildHeader() {
    return Row(
      children: const [
        Icon(
          Icons.restaurant_menu,
          color: AppColor.secondary,
          size: AppDimen.iconLarge,
        ),
        SizedBox(width: AppDimen.spacingS),
        Text(
          'Gợi ý món hôm nay',
          style: TextStyle(
            fontSize: AppFontSize.titleLarge,
            fontWeight: FontWeight.w600,
            color: AppColor.onSurface,
          ),
        ),
      ],
    );
  }

  /// Build horizontal scrollable recipe list
  Widget _buildRecipeList() {
    return SizedBox(
      height: AppDimen.recipeCardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppDimen.spacingM),
        itemBuilder: (context, index) {
          return _buildRecipeCard(recipes[index]);
        },
      ),
    );
  }

  /// Build a single recipe card
  Widget _buildRecipeCard(Recipe recipe) {
    // Calculate match percentage (mock for now)
    final matchPercentage = 85; // TODO: Calculate from available ingredients

    return SizedBox(
      width: AppDimen.recipeCardWidth,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimen.cardRadius),
          side: BorderSide(color: AppColor.outlineVariant, width: 1),
        ),
        child: InkWell(
          onTap: () => onRecipeTap(recipe),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe image
              _buildRecipeImage(recipe),

              // Recipe content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimen.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Match badge
                      _buildMatchBadge(matchPercentage),
                      const SizedBox(height: AppDimen.spacingXS),

                      // Recipe title
                      Text(
                        recipe.name,
                        style: const TextStyle(
                          fontSize: AppFontSize.titleSmall,
                          fontWeight: FontWeight.w600,
                          color: AppColor.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),

                      // Recipe metadata
                      _buildMetadata(recipe),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build recipe image
  Widget _buildRecipeImage(Recipe recipe) {
    return Stack(
      children: [
        Container(
          height: AppDimen.recipeImageHeight,
          width: double.infinity,
          color: AppColor.surfaceVariant,
          child: recipe.imageUrl != null
              ? Image.network(
                  recipe.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildImagePlaceholder(),
                )
              : _buildImagePlaceholder(),
        ),
      ],
    );
  }

  /// Build image placeholder
  Widget _buildImagePlaceholder() {
    return const Center(
      child: Icon(
        Icons.restaurant,
        size: AppDimen.iconXXXL,
        color: AppColor.onSurfaceVariant,
      ),
    );
  }

  /// Build match percentage badge
  Widget _buildMatchBadge(int percentage) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimen.paddingSmall,
        vertical: AppDimen.paddingXXS,
      ),
      decoration: BoxDecoration(
        color: AppColor.statusFreshBg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '$percentage% phù hợp',
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColor.statusFresh,
        ),
      ),
    );
  }

  /// Build recipe metadata (time and servings)
  Widget _buildMetadata(Recipe recipe) {
    final totalTime = recipe.prepTime + recipe.cookTime;

    return Row(
      children: [
        const Icon(
          Icons.access_time,
          size: 14,
          color: AppColor.onSurfaceVariant,
        ),
        const SizedBox(width: 4),
        Text(
          '$totalTime\'',
          style: const TextStyle(
            fontSize: AppFontSize.bodySmall,
            color: AppColor.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: AppDimen.spacingS),
        const Icon(Icons.people, size: 14, color: AppColor.onSurfaceVariant),
        const SizedBox(width: 4),
        Text(
          '${recipe.servings}',
          style: const TextStyle(
            fontSize: AppFontSize.bodySmall,
            color: AppColor.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  /// Build empty state when no recipes
  Widget _buildEmptyState() {
    return SizedBox(
      height: 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_outlined,
              size: AppDimen.iconXXL,
              color: AppColor.onSurfaceVariant,
            ),
            const SizedBox(height: AppDimen.spacingS),
            const Text(
              'Chưa có gợi ý món ăn',
              style: TextStyle(
                fontSize: AppFontSize.bodyMedium,
                color: AppColor.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
