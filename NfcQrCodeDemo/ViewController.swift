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
        (self.viewControllers![1] as? QrCodeViewController)?.onQrCodeUrlRetireved(url)
    }
}

