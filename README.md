# Bootstrap 🍃

[![Swift Version](https://img.shields.io/badge/Swift-5.7-brightgreen.svg)](http://swift.org)
[![Vapor Version](https://img.shields.io/badge/Vapor-4-30B6FC.svg)](http://vapor.codes)
[![Build Status](https://github.com/brokenhandsio/bootstrap/workflows/CI/badge.svg?branch=master)](https://github.com/brokenhandsio/bootstrap/actions)
[![codecov](https://codecov.io/gh/nodes-vapor/bootstrap/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/bootstrap)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/bootstrap/master/LICENSE)

This package wraps Bootstrap elements into convenient Leaf-Tags.


# Installation

Add `Bootstrap` to the package dependencies (in your `Package.swift` file):

```swift
.package(url: "https://github.com/nodes-vapor/bootstrap.git", from: "1.0.0-beta")
```

as well as to your target:

```swift
.product(name: "Bootstrap", package: "bootstrap")
```

## Getting started 🚀

First import Bootstrap and Leaf inside your `configure.swift`

```swift
import Bootstrap
import Leaf
```

### Adding the Leaf tags

In order to render the Bootstrap elements, you will need to add the Bootstrap Leaf tags:

```swift
app.leaf.useBootstrapTags()
```

## Supported tags

- [Alert](#alert)
- [Badge](#badge)
- [Button](#button)
- [Input](#input)
- [Textarea](#textarea)
- [Checkbox](#checkbox)
- [File Input](#file-input)

### Alert

```
#bsAlert(style? = primary, classes?, attributes?): 
    some alert text
#endbsAlert
```

### Badge

```
#bsBadge(type? = primary, classExtras?, attributes?): 
    badge text 
#endbsBadge
```

### Button

```
#bsButton(type? = primary, classExtras?, attributes?):  
    btn text
#endbsButton
```

### Input

```
#bsInput(type?, classExtras?, attributes?)
```

### Textarea

```
#bsTextArea(classExtras?, attributes?):
    some textarea text
#endbsTextArea
```

### Checkbox

```
#bsCheckbox(classExtras?, attributes?)
```

### File Input

```
#bsFileInput(classExtras?, attributes?)
```

