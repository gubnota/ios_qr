# Recap
```swift
```

## Make animated stroke from svg

2023-12-05 14:29:31.956690+0300 uikit[3376:160838] Failed to set (frame.cornerRadius) user defined inspected property on (uikit.ItemCell): [<NSConcreteValue 0x28101fdc0> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key cornerRadius.

- [ ] https://web.archive.org/web/20210620182247/https://www.calayer.com/core-animation/2016/05/22/cashapelayer-in-depth.html
- [ ] https://web.archive.org/web/20210620183742/https://www.calayer.com/core-animation/2017/12/25/cashapelayer-in-depth-part-ii.html
- [ ] [convert svg to UIBezierPath](https://swiftvg.mike-engel.com)

```swift
let shape = UIBezierPath()shape.move(to: CGPoint(x: 244.5, y: 81.3))shape.addLine(to: CGPoint(x: 243.3, y: 81.3))shape.addLine(to: CGPoint(x: 160.2, y: 0.9))shape.addLine(to: CGPoint(x: 138.9, y: 13.8))shape.addCurve(to: CGPoint(x: 224.7, y: 81.3), controlPoint1: CGPoint(x: 172.8, y: 42.9), controlPoint2: CGPoint(x: 201.3, y: 64.5))shape.addLine(to: CGPoint(x: 120.3, y: 81.3))shape.addLine(to: CGPoint(x: 120.3, y: 100.5))shape.addLine(to: CGPoint(x: 152.4, y: 100.5))shape.addLine(to: CGPoint(x: 152.4, y: 174.3))shape.addCurve(to: CGPoint(x: 126.6, y: 180.6), controlPoint1: CGPoint(x: 147, y: 177.6), controlPoint2: CGPoint(x: 138.6, y: 180.6))shape.addCurve(to: CGPoint(x: 98.1, y: 173.1), controlPoint1: CGPoint(x: 114.6, y: 180.6), controlPoint2: CGPoint(x: 105.3, y: 177.3))shape.addCurve(to: CGPoint(x: 80.4, y: 163.5), controlPoint1: CGPoint(x: 92.7, y: 168.3), controlPoint2: CGPoint(x: 86.4, y: 165))shape.addLine(to: CGPoint(x: 80.4, y: 162.3))shape.addCurve(to: CGPoint(x: 101.7, y: 125.7), controlPoint1: CGPoint(x: 90, y: 157.5), controlPoint2: CGPoint(x: 101.7, y: 144.3))shape.addCurve(to: CGPoint(x: 53.4, y: 81), controlPoint1: CGPoint(x: 101.7, y: 100.8), controlPoint2: CGPoint(x: 83.7, y: 81))shape.addCurve(to: CGPoint(x: 10.8, y: 100.2), controlPoint1: CGPoint(x: 33.6, y: 81), controlPoint2: CGPoint(x: 18.9, y: 89.7))shape.addLine(to: CGPoint(x: 26.7, y: 114.6))shape.addCurve(to: CGPoint(x: 52.8, y: 101.4), controlPoint1: CGPoint(x: 31.8, y: 107.4), controlPoint2: CGPoint(x: 39.9, y: 101.4))shape.addCurve(to: CGPoint(x: 78.9, y: 127.2), controlPoint1: CGPoint(x: 69, y: 101.4), controlPoint2: CGPoint(x: 78.9, y: 111.6))shape.addCurve(to: CGPoint(x: 47.7, y: 156.3), controlPoint1: CGPoint(x: 78.9, y: 145.2), controlPoint2: CGPoint(x: 66.3, y: 156.3))shape.addLine(to: CGPoint(x: 38.4, y: 156.3))shape.addLine(to: CGPoint(x: 38.4, y: 176.4))shape.addLine(to: CGPoint(x: 54.6, y: 176.4))shape.addCurve(to: CGPoint(x: 87.6, y: 203.1), controlPoint1: CGPoint(x: 75.9, y: 176.4), controlPoint2: CGPoint(x: 87.6, y: 186.3))shape.addCurve(to: CGPoint(x: 54, y: 233.7), controlPoint1: CGPoint(x: 87.6, y: 219.9), controlPoint2: CGPoint(x: 76.5, y: 233.7))shape.addCurve(to: CGPoint(x: 15.6, y: 215.4), controlPoint1: CGPoint(x: 35.4, y: 233.7), controlPoint2: CGPoint(x: 22.8, y: 223.8))shape.addLine(to: CGPoint(x: 0, y: 231))shape.addCurve(to: CGPoint(x: 54, y: 253.8), controlPoint1: CGPoint(x: 9.6, y: 240.9), controlPoint2: CGPoint(x: 27.9, y: 253.8))shape.addCurve(to: CGPoint(x: 110.4, y: 202.8), controlPoint1: CGPoint(x: 88.8, y: 253.8), controlPoint2: CGPoint(x: 110.4, y: 231.3))shape.addCurve(to: CGPoint(x: 109.8, y: 195.3), controlPoint1: CGPoint(x: 110.4, y: 200.1), controlPoint2: CGPoint(x: 110.1, y: 197.7))shape.addCurve(to: CGPoint(x: 132.3, y: 200.1), controlPoint1: CGPoint(x: 116.1, y: 198.3), controlPoint2: CGPoint(x: 123.6, y: 200.1))shape.addCurve(to: CGPoint(x: 152.4, y: 195.9), controlPoint1: CGPoint(x: 141, y: 200.1), controlPoint2: CGPoint(x: 147.6, y: 198))shape.addLine(to: CGPoint(x: 152.4, y: 273.9))shape.addLine(to: CGPoint(x: 175.2, y: 273.9))shape.addLine(to: CGPoint(x: 175.2, y: 100.5))shape.addLine(to: CGPoint(x: 234.3, y: 100.5))shape.addLine(to: CGPoint(x: 234.3, y: 273.9))shape.addLine(to: CGPoint(x: 256.8, y: 273.9))shape.addCurve(to: CGPoint(x: 256.8, y: 209.93), controlPoint1: CGPoint(x: 256.8, y: 267.73), controlPoint2: CGPoint(x: 256.8, y: 246.4))shape.addCurve(to: CGPoint(x: 256.8, y: 100.5), controlPoint1: CGPoint(x: 256.8, y: 173.45), controlPoint2: CGPoint(x: 256.8, y: 136.98))shape.addLine(to: CGPoint(x: 293.1, y: 100.5))shape.addLine(to: CGPoint(x: 293.1, y: 81.3))shape.addLine(to: CGPoint(x: 258, y: 81.3))shape.addLine(to: CGPoint(x: 228.3, y: 0))shape.addLine(to: CGPoint(x: 203.1, y: 6))shape.addLine(to: CGPoint(x: 244.5, y: 81.3))shape.close()
```
- [Make stroke Animations](https://www.youtube.com/watch?v=kE9-6Jh1iB4)
- [part 2](https://www.youtube.com/watch?v=_md_WgRUrck)


# couldn't insert new Outlet connection
add VC at the end of a class
Thread 1: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value

```swift
guard let unwrappedValue = optionalValue else {
        // Handle the case where optionalValue is nil
        print("Optional value is nil")
        return
    }
    // Continue with unwrappedValue safely
    print("Unwrapped value: \(unwrappedValue)")
}
```

set User Interaction Enabled on UIView

why programmatically added UIView doesn't fill up all the space in the parent View?
newView.translatesAutoresizingMaskIntoConstraints = false