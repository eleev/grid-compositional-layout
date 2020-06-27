# grid-compositional-layout [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

[![Platform](https://img.shields.io/badge/Platforms-iOS/iPadOS/macOS-yellow.svg)]()
[![PrimaryFramework](https://img.shields.io/badge/Framework-SwiftUI-red.svg)]()
[![Language](https://img.shields.io/badge/Language-Swift_5.3-orange.svg)]()
[![CustomLayouts](https://img.shields.io/badge/Custom_Demo_Layouts-9-green.svg)]()
[![DependencyManagement](https://img.shields.io/badge/Swift_PM-Supported-pink.svg)]()
[![License](https://img.shields.io/badge/License-MIT-blue.svg)]()

**Last Update: 27/June/2020.**

![](logo.jpg)

### If you like the project, please give it a star ⭐ It will show the creator your appreciation and help others to discover the repo.

# ✍️ About
🧲 `Grid Compositional Layout` is a `SwiftUI` view that lays out the supplied views in a grid. Easily configurable and lazily retained [`Swift 5.3`, `iOS 14.0+`, `iPadOS 14.0+`, `macOS 11.0(10.16)+`].

# 📚 Contents
Please wait while the `.gif` files are loading (there are `9` files, that weight around `43Mb`)...

|  |  |  |
:-------------------------:|:-------------------------:|:-------------------------:
![](Assets/01.gif) | ![](Assets/02.gif) | ![](Assets/03.gif)
![](Assets/04.gif) | ![](Assets/05.gif) | ![](Assets/06.gif)
![](Assets/07.gif) | ![](Assets/08.gif) | ![](Assets/09.gif)

# 📦 Installation
There are no dependencies as well as any package managers involved. The repo contains both: the Swift Package and a demo Xcode project. 

## Swift Package Manager
Please note that the package and demo project have the minimum deplyment target for `iOS/iPadOS 14.0+` and `macOS 11.0(10.16)+`.

### Xcode 11+

1. Open `MenuBar` → `File` → `Swift Packages` → `Add Package Dependency...`
2. Paste the package repository url `https://github.com/jVirus/extensions-kit` and hit `Next`.
3. Select the installment rules.

After specifying which version do you want to install, the package will be downloaded and attached to your project. 

### Package.swift
If you already have a `Package.swift` or you are building your own package simply add a new dependency:

```swift
dependencies: [
    .package(url: "https://github.com/jVirus/grid-compositional-layout/", from: "1.0.0")
]
```
## Manual
You can always use `copy-paste` the sources method 😄.

# ✈️ Usage and APIs
The `API` layer is thin and currently has a single compositional grid variant for vertical alignment. That means, under the hood the `LazyVGrid` is used to layout the supplied views. However, the future versions will support the `LazyHGrid` and their combination, which will allow to easly describe `orthogonal` compositional layouts, just as in `UIKit` with `UICollectionViewCompositionalLayout`. 

## Code
To create a layout you need to import the framework: 

```swift
import GridCompositionalLayout
```

Then, instantiate an instance of `GridCompositionalView` type:

```swift
var body: some View {
  GridCompositionalView(navigationTitle: "Your navigation title, if any",
                        items: 20,
                        columns: columns) { index -> AnyView in
      gridCellView(for: index)
  }
}
```

the `items` parameter describes the total number of views to be rendered by the view and `columns` is an input argument of type `[GridItem]`. It specifies how an item should be treated by the layout system. For example, if you specify the following:

```swift
let columns = [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 2),
              [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 6),
              [GridItem](repeating: GridItem(.flexible(), spacing: interItemSpacing), count: 4)              
```
And then pass it as an input parameter to `GridCompositionalView` instance, you will get a grid, where the first `row` contains, evenly positioned `two` elements, the second row contains evenly positioned `six` elements and the `third` row contains `four` elements. Then, if there is a `fifth` row, it will use the first grid item description e.g. evenly positioned `two` columns of items.

By combining and experimenting with differnet grid item configurations, you can customize the layout of the supplied views.

# ⚠️ Warning 
The assets used in this project were taken from the `Web`. Do not use them for commertial purposes and proprietary projects. They are used just for demostration only. 

# 👨‍💻 Author 
[Astemir Eleev](https://github.com/jVirus)

# 🔖 Licence 
The project is available under [MIT Licence](https://github.com/jVirus/grid-compositional-layout/blob/main/LICENSE)
