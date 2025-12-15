# Assets Directory

This directory contains application assets organized by type:

## Structure

```
assets/
├── images/     # Image files (PNG, JPG, WebP, SVG)
├── icons/      # Icon files (SVG, PNG)
├── fonts/      # Custom font files (TTF, OTF)
└── .gitkeep    # Placeholder files
```

## Usage

### Images

Place your image assets in the `images/` folder. Access them using:

```dart
Image.asset('assets/images/your_image.png')
```

### Icons

Place icon assets in the `icons/` folder. For SVG icons, consider using `flutter_svg`:

```dart
SvgPicture.asset('assets/icons/your_icon.svg')
```

### Fonts

1. Place font files in the `fonts/` folder
2. Register fonts in `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: YourFont
      fonts:
        - asset: assets/fonts/YourFont-Regular.ttf
        - asset: assets/fonts/YourFont-Bold.ttf
          weight: 700
```

## Image Resolution Variants

For resolution-aware images, use the following structure:

```
assets/images/
├── my_image.png      # 1x (mdpi)
├── 2.0x/
│   └── my_image.png  # 2x (xhdpi)
└── 3.0x/
    └── my_image.png  # 3x (xxhdpi)
```

Flutter will automatically select the appropriate resolution.
