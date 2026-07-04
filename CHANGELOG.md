# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/),  
and this project adheres to [Semantic Versioning](https://semver.org/).

## [2.0.0] - 2026-07-04
### Added
- **Optimised text wrapping**: new `optimisedText` parameter on `TextComponent`.
  When enabled, multi-line text wraps at a balanced width instead of leaving a
  short last line.
- New `width` parameter to provide a fixed width for optimised wrapping in
  places where `LayoutBuilder` cannot measure (e.g. inside `SliverFillRemaining`).
- New `OptimisedText`, `OptimisedRichText`, `OptimisedTextForWidth`, and
  `OptimisedRichTextForWidth` widgets powering the feature.
- `maxLength` parameter to limit text to a character count, with `showEllipsis`
  to control the trailing ellipsis.
- Widget tests covering optimised wrapping, fixed width, `textAlign` default,
  and `maxLength` truncation.

### Changed
- **BREAKING**: renamed the `optimalWrap` parameter to `optimisedText`, and the
  `optimal_wrapper` source folder / `OptimalWrap*` widgets to `optimised_text` /
  `Optimised*`.
- When `optimisedText` is enabled, `textAlign` defaults to `TextAlign.center`.
- Documented the optimised text wrapping and `maxLength` features in the README.

## [1.0.0] - YYYY-MM-DD
### Added
- Initial release of the `text_component` package.
- `TextComponent` widget to simplify text customization in Flutter projects.
- Support for various `Text` properties, including:
    - `color`, `fontSize`, `fontWeight`, `fontStyle`
    - `maxLines`, `overflow`, `textAlign`, `textDirection`
    - Styling options like `backgroundColor`, `shadows`, `decoration`, and more.
- `textScalar` support for responsive text scaling.
- Compatibility with Flutter's accessibility features (e.g., `semanticsLabel`, `locale`).
- Customizable text overflow behavior and rich text decoration.

## [1.0.1] - YYYY-MM-DD
### Added
- Unit tests for verifying `TextComponent` functionality.
- Example usage in the `example` directory for quick integration.

### Fixed
- Bug causing incorrect handling of `maxLines` when not specified.

## [1.1.0] - YYYY-MM-DD
### Added
- Additional `TextStyle` properties support:
    - `fontFamilyFallback`, `textHeightBehavior`, `leadingDistribution`
- New tests for `fontFamilyFallback` and `overflow` behavior.

### Changed
- Improved internal performance for faster widget rendering.
- Updated default `maxLines` behavior to show unlimited lines when not specified.

## [1.1.1] - YYYY-MM-DD
### Fixed
- Resolved edge case where `backgroundColor` did not render correctly.
- Fixed an issue with `decorationThickness` when combined with `shadows`.

---

## Notes for Contributors
- Follow [Semantic Versioning](https://semver.org/) for version updates.
- Update the changelog with every new release.

