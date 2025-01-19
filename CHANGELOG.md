## 0.0.1

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/),  
and this project adheres to [Semantic Versioning](https://semver.org/).

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

