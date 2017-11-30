# SwiftJSONDemo
### 11月30日练习
* 使用第三方库：[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)进行JSON解析，接口来自[扇贝单词](https://www.shanbay.com/help/developer/api_v1/)
* 主要目的还是，练习JSON，所以一些会导致程序崩溃的情况都没有做处理 比如搜索栏的单词必须正确不能有空格（好吧我承认其实是因为想偷懒了。。。）
* 使用CAGradientLayer做了一个渐变的背景色，颜色提取自iPhone一张内置壁纸😜：
```
    func gradientColors() -> CAGradientLayer {
        
        let topColor = UIColor(named: "topColor")!
        let bottomColor = UIColor(named: "bottomColor")!
        let gradientColors = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [NSNumber] = [0.0, 1.0]
        let gradientLayer = CAGradientLayer()

        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        return gradientLayer
    }
```
