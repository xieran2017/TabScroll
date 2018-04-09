# TabScroll
### Quick Start

```swift
class MyViewController: UIViewController {

    lazy var sc = TabScroll(frame: CGRect(x: 0, y: 0, width: 100, height: 40))

    override func viewDidLoad() {
        super.viewDidLoad()

        sc.font = UIFont.systemFont(ofSize: 16)
        sc.titles = ["1000","2000","3000","4000","5000","6000","7000"]
        self.view.addSubview(sc)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sc.selectedIndex = 0
    }
}
```
