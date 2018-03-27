# TabScroll
### Quick Start

```swift
class MyViewController: UIViewController {

    lazy var sc = TabScroll(frame: CGRect(x: 0, y: 0, width: 100, height: 40))

    override func viewDidLoad() {
        super.viewDidLoad()

        sc.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(sc)
    }

}
```
