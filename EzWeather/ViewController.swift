//
//  ViewController.swift
//  EzWeather
//
//  Created by iOS Student on 12/28/16.
//  Copyright © 2016 tek4fun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var img_background: UIImageView!
    @IBOutlet weak var btn_temp: UIButton!
    @IBOutlet weak var lbl_location: UILabel!
    @IBOutlet weak var lbl_temptype: UILabel!
    @IBOutlet weak var lbl_quote: UILabel!
    
    var quotes = ["\"Since we cannot change reality, let us change the eyes which see reality.\"",
                  "\"Without a struggle, there can be no progress.\"",
                  "\"If you don't like something, change it. If you can't change it, change your attitude.\"","\"Life is short. Smile while you still have teeth.\""]
    var city = ["Courtneyfurt",
                "South Wilford",
                "East Rosendo"]
    
    var images = ["Blood","Moon","Sun"]
    
    var isCel:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func changeTempAction(_ sender: AnyObject) {
        isCel = !isCel
        
        var currentTemp = Double((btn_temp.titleLabel?.text)!)
        
        if isCel{
            currentTemp = (currentTemp! - 32) / 1.8
            btn_temp.setTitle(String(format: "%2.1f", currentTemp!), for: UIControlState())
            lbl_temptype.text = "C"
        } else{
            currentTemp = currentTemp! * 1.8 + 32
            btn_temp.setTitle(String(format: "%2.1f", currentTemp!), for: UIControlState())
            lbl_temptype.text = "F"
        }
    }
    
    @IBAction func changeCAndF(_ sender: AnyObject) {
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        lbl_location.text = city[cityIndex]
        let quoteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        lbl_quote.text = quotes[quoteIndex]
        let imageIndex = Int(arc4random_uniform(UInt32(images.count)))
        img_background.image = UIImage.init(named: images[imageIndex])
        getTemp()
    }
    
    func getTemp() -> Void {
        let temp = String(format: "%2.1f", randomTemp())
        btn_temp.setTitle(temp,for:UIControlState())
    }
    
    func randomTemp() -> Double {
        if isCel {
            return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
        }else{
            return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX) * 1.8 + 32
        }
    }
}

