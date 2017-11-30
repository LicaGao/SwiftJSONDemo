//
//  ViewController.swift
//  SwiftJSONDemo
//
//  Created by 高鑫 on 2017/11/30.
//  Copyright © 2017年 高鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textField.returnKeyType = .done
        let background = gradientColors()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, at: 0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text != "" {
            getData(word: textField.text!)
        } else {
            let alertController = UIAlertController(title: "请输入单词", message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "好的", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
        return true
    }
    
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
    
    func getData(word: String) {
        let path = "https://api.shanbay.com/bdc/search/?word=\(word)"
        let url = NSURL(string: path)
        let request = URLRequest(url: url! as URL)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                do {
                    let json = try JSON(data: data!)
                    let cn_definition = json["data"]["cn_definition"]["defn"].string!
                    DispatchQueue.main.async {
                        self.updateUI(cn: cn_definition)
                    }
                } catch {
                    print(error)
                }
            } else {
                print(error ?? "")
            }
        }
        task.resume()
    }
    
    func updateUI(cn: String) {
        self.label.text = cn
    }

}

