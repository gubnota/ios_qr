- [x] Make sure to embed Entry point's View into Navigation Controller
- [x] Nib file Owner's Outlet -> View, drag into the only View of that file.
- [x] set Nib File Owner Class to ViewController2
- [x] add into didLoad method of ViewController2 the following code:
```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the view from the xib file
        if let view = Bundle.main.loadNibNamed("View2", owner: self, options: nil)?.first as? UIView {
            self.view = view
        }
```
