//
//  ViewController.swift
//  NfcQrCodeDemo
//
//  Created by Maurizio Pietrantuono on 22/02/2018.
//  Copyright © 2018 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

class BuzzbikeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func onQrCodeUrlRetireved(_ url: URL) {
        selectedIndex = 1
        if let last = url.pathComponents.last{
            if last == "red"{
                return
            }
            if last == "blue"{
                return
            }

        }
    }
}

