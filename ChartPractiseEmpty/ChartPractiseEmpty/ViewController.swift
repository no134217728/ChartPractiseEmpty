//
//  ViewController.swift
//  ChartPractiseEmpty
//
//  Created by Gelbhaubenkakadu on 2019/7/28.
//  Copyright © 2019 SwiftJam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var candles: [CandleItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = Bundle.main.url(forResource: "PreviousCandles", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                print("Candles' source error")
                return
        }
        
        do {
            let json = try JSONDecoder().decode(CandlesModel.self, from: data)
            candles = json.candleItems
        } catch {
            print("candles decode fail")
        }
    }
}

