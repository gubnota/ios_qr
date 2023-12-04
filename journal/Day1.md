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
- [x] add programmatically 

- [x] For ItemCell create UICollectionViewCell instance with xib file already attached
- set Collection Reusable Name to `ItemCellName`

2023-12-04 22:27:21.798832+0300 uikit[713:111368] *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<uikit.ViewController2 0x129307050> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key UICollection.'
dragging an Outlet solved it.

2023-12-04 22:34:06.530839+0300 uikit[731:115830] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'could not dequeue a view of kind: UICollectionElementKindCell with identifier ItemCellName - must register a nib or a class for the identifier or connect a prototype cell in a storyboard'
`        grid.register(UINib(nibName: "ItemCellName", bundle: nil), forCellWithReuseIdentifier: "ItemCellName")
`
Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Could not load NIB in bundle: 'NSBundle </private/var/containers/Bundle/Application/F3F73BD4-FFEE-48BC-962D-AB6AF229C90E/uikit.app> (loaded)' with name 'ItemCellName''


solved:
        grid.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCellName")
