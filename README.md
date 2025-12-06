# 🎯 Smart Gap

**The smartest spacing widget for Flutter.** No more confusion between `width` and `height` in `SizedBox`. Just use `Gap(16)` everywhere! 🚀

Smart Gap automatically detects its parent widget's direction and applies the appropriate spacing. Works perfectly with `Row`, `Column`, `Flex`, `ListView`, `Wrap`, and more.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🎯 **Auto Direction Detection** | Automatically detects Row, Column, Flex, ListView, Wrap |
| 🚀 **Zero Configuration** | Just write `Gap(16)` - no need to think about direction |
| 🎨 **Predefined Sizes** | Use `Gaps.xs`, `Gaps.sm`, `Gaps.md`, `Gaps.lg`, `Gaps.xl` |
| ✍️ **Extension Syntax** | Quick syntax: `16.gap` instead of `Gap(16)` |
| 🐛 **Debug Mode** | Visualize gaps with colors for layout debugging |
| 📏 **Multiple Types** | Gap, Gap2D, DividerGap, FlexGap, SmartSpacer |
| 🎭 **Flexible Spacing** | Use FlexGap for Spacer-like behavior |
| 💪 **Type Safe** | Null-safe and fully tested |

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  smart_gap: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Quick Start

### Before (Old Way) 😩

```dart
Row(
  children: [
    Icon(Icons.star),
    SizedBox(width: 8),  // Have to remember "width"
    Text('Rating'),
    SizedBox(width: 16), // Horizontal spacing
    Icon(Icons.favorite),
  ],
)

Column(
  children: [
    Text('Title'),
    SizedBox(height: 16), // Have to remember "height"
    Text('Subtitle'),
    SizedBox(height: 8),  // Vertical spacing
    Button(),
  ],
)
```

### After (New Way) 🎉

```dart
Row(
  children: [
    Icon(Icons.star),
    Gap(8),   // Automatically horizontal! 🎯
    Text('Rating'),
    Gap(16),  // Still horizontal!
    Icon(Icons.favorite),
  ],
)

Column(
  children: [
    Text('Title'),
    Gap(16),  // Automatically vertical! 🎯
    Text('Subtitle'),
    Gap(8),   // Still vertical!
    Button(),
  ],
)
```

**Magic!** 🪄 No need to think about `width` vs `height`.

---

## 📚 Complete Usage Guide

### 1️⃣ Basic Gap

The core widget that auto-detects direction:

```dart
Row(
  children: [
    Text('Hello'),
    Gap(16),  // Auto horizontal
    Text('World'),
  ],
)

Column(
  children: [
    Text('Hello'),
    Gap(16),  // Auto vertical
    Text('World'),
  ],
)

ListView(
  scrollDirection: Axis.horizontal,
  children: [
    Card(),
    Gap(16),  // Auto horizontal (scroll direction)
    Card(),
  ],
)
```

---

### 2️⃣ Predefined Gaps

Use consistent spacing throughout your app:

```dart
Column(
  children: [
    Text('Title', style: heading),
    Gaps.xs,   // 4px gap
    Text('Subtitle'),
    Gaps.sm,   // 8px gap
    Text('Description'),
    Gaps.md,   // 16px gap (most common)
    Text('More content'),
    Gaps.lg,   // 24px gap
    Button('Action'),
    Gaps.xl,   // 32px gap
    Text('Footer'),
    Gaps.xxl,  // 48px gap
  ],
)
```

**Size Reference:**
- `Gaps.xs` → 4px (extra small)
- `Gaps.sm` → 8px (small)
- `Gaps.md` → 16px (medium, default)
- `Gaps.lg` → 24px (large)
- `Gaps.xl` → 32px (extra large)
- `Gaps.xxl` → 48px (2x extra large)

---

### 3️⃣ Extension Syntax

The fastest way to add gaps:

```dart
Row(
  children: [
    Icon(Icons.star),
    8.gap,   // Quick syntax! ⚡
    Text('4.5'),
    16.gap,
    Text('(123 reviews)'),
  ],
)

// Works with double too
Column(
  children: [
    Text('Price'),
    12.5.gap,
    Text('\$99.99'),
  ],
)
```

---

### 4️⃣ Debug Mode

Visualize gaps during development:

```dart
Row(
  children: [
    Text('A'),
    16.coloredGap(Colors.red.withOpacity(0.3)),  // See the gap!
    Text('B'),
    24.coloredGap(Colors.blue.withOpacity(0.3)),
    Text('C'),
  ],
)
```

Perfect for:
- Understanding layout issues
- Debugging spacing problems
- Teaching Flutter to beginners

---

### 5️⃣ Gap2D (For Wrap/Grid)

When you need spacing in both directions:

```dart
Wrap(
  children: [
    Chip(label: Text('Flutter')),
    Gap2D(horizontal: 8, vertical: 4),
    Chip(label: Text('Dart')),
    Gap2D(horizontal: 8, vertical: 4),
    Chip(label: Text('Firebase')),
  ],
)

// Or use uniform spacing
Wrap(
  children: [
    Chip(label: Text('Tag 1')),
    Gap2D.all(8),  // 8px both directions
    Chip(label: Text('Tag 2')),
  ],
)
```

---

### 6️⃣ DividerGap

Gap with a divider line:

```dart
Row(
  children: [
    Text('Section 1'),
    DividerGap(24),  // Vertical divider with 24px spacing
    Text('Section 2'),
    DividerGap(
      32,
      thickness: 2,
      color: Colors.grey,
    ),
    Text('Section 3'),
  ],
)

Column(
  children: [
    Text('Item 1'),
    DividerGap(16),  // Horizontal divider with 16px spacing
    Text('Item 2'),
  ],
)
```

---

### 7️⃣ FlexGap (Spacer Alternative)

Takes remaining space, like `Spacer`:

```dart
Row(
  children: [
    Text('Start'),
    FlexGap(),  // Takes all remaining space
    Text('End'),
  ],
)

// With flex ratio
Row(
  children: [
    Text('Left'),
    FlexGap(flex: 1),
    Text('Center'),
    FlexGap(flex: 2),  // Takes 2x space
    Text('Right'),
  ],
)
```

---

### 8️⃣ SmartSpacer

Flexible space with minimum size:

```dart
Row(
  children: [
    Text('Start'),
    SmartSpacer(minSize: 16),  // At least 16px, expands if space available
    Text('End'),
  ],
)
```

---

## 🎨 Real-World Examples

### Example 1: User Profile Card

```dart
Container(
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(user.avatar),
          ),
          Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: TextStyle(fontWeight: FontWeight.bold)),
                Gap(4),
                Text(user.email, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          FlexGap(),
          Icon(Icons.more_vert),
        ],
      ),
      Gaps.md,
      Text(user.bio),
      Gaps.lg,
      Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Follow'),
            ),
          ),
          Gap(12),
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Message'),
            ),
          ),
        ],
      ),
    ],
  ),
)
```

---

### Example 2: Product Card

```dart
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(product.image),
        ),
        Gaps.md,
        Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Gap(4),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 16),
            Gap(4),
            Text('${product.rating}'),
            Gap(8),
            Text('(${product.reviews} reviews)', style: TextStyle(color: Colors.grey)),
          ],
        ),
        Gaps.sm,
        Row(
          children: [
            Text('\$${product.price}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            FlexGap(),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
              label: Text('Add to Cart'),
            ),
          ],
        ),
      ],
    ),
  ),
)
```

---

### Example 3: Settings List

```dart
ListView(
  children: [
    ListTile(title: Text('Account'), leading: Icon(Icons.person)),
    DividerGap(1, color: Colors.grey[300]),
    ListTile(title: Text('Notifications'), leading: Icon(Icons.notifications)),
    DividerGap(1, color: Colors.grey[300]),
    ListTile(title: Text('Privacy'), leading: Icon(Icons.lock)),
    Gaps.lg,
    Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Save Changes'),
          ),
          Gaps.sm,
          TextButton(
            onPressed: () {},
            child: Text('Cancel'),
          ),
        ],
      ),
    ),
  ],
)
```

---

### Example 4: Responsive Layout

```dart
LayoutBuilder(
  builder: (context, constraints) {
    final isSmall = constraints.maxWidth < 600;
    
    return Column(
      children: [
        Text('Header'),
        isSmall ? Gaps.sm : Gaps.lg,  // Responsive spacing!
        if (isSmall)
          Column(
            children: [
              Widget1(),
              Gaps.md,
              Widget2(),
            ],
          )
        else
          Row(
            children: [
              Expanded(child: Widget1()),
              Gap(24),
              Expanded(child: Widget2()),
            ],
          ),
      ],
    );
  },
)
```

---

## 🎯 Best Practices

### ✅ DO

```dart
// Use predefined sizes for consistency
Column(
  children: [
    Text('Title'),
    Gaps.md,  // Consistent spacing
    Text('Content'),
  ],
)

// Use extension syntax for quick gaps
Row(
  children: [Text('A'), 8.gap, Text('B')],
)

// Use debug mode during development
16.coloredGap(Colors.red.withOpacity(0.3))
```

### ❌ DON'T

```dart
// Don't use random values
Column(
  children: [
    Text('Title'),
    Gap(17.3),  // ❌ Use Gaps.md or 16.gap
    Text('Content'),
  ],
)

// Don't mix with SizedBox (choose one approach)
Row(
  children: [
    Text('A'),
    SizedBox(width: 16),  // ❌ Use Gap(16)
    Text('B'),
    Gap(16),  // ✅
    Text('C'),
  ],
)
```

---

## 📊 Comparison

| Feature | SizedBox | Spacer | **Smart Gap** |
|---------|----------|--------|---------------|
| Auto-detect direction | ❌ | ❌ | ✅ |
| Fixed size | ✅ | ❌ | ✅ |
| Flexible size | ❌ | ✅ | ✅ (FlexGap) |
| Predefined sizes | ❌ | ❌ | ✅ |
| Extension syntax | ❌ | ❌ | ✅ |
| Debug mode | ❌ | ❌ | ✅ |
| Divider support | ❌ | ❌ | ✅ |
| 2D spacing | ❌ | ❌ | ✅ |

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

```bash
# Clone the repo
git clone https://github.com/your-username/smart_gap.git
cd smart_gap

# Get dependencies
flutter pub get

# Run tests
flutter test

# Run example
cd example
flutter run
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 💖 Support

If you find this package helpful, please:
- ⭐ Star the repo on [GitHub](https://github.com/your-username/smart_gap)
- 👍 Like on [pub.dev](https://pub.dev/packages/smart_gap)
- 📢 Share with other Flutter developers
- 🐛 Report issues
- 💡 Suggest features

---

## 🙏 Acknowledgments

Created with ❤️ by [Your Name](https://github.com/your-username)

Inspired by the Flutter community's need for simpler spacing solutions.

---

## 📚 More Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [API Reference](https://pub.dev/documentation/smart_gap/latest/)
- [Example App](https://github.com/your-username/smart_gap/tree/main/example)
- [Issue Tracker](https://github.com/your-username/smart_gap/issues)

---

<div align="center">

**Made with 💙 for the Flutter community**

[Report Bug](https://github.com/your-username/smart_gap/issues) · [Request Feature](https://github.com/your-username/smart_gap/issues) · [Documentation](https://pub.dev/documentation/smart_gap/)

</div>