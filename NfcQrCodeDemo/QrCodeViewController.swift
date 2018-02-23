//
//  QrCodeViewController.swift
//  NfcQrCodeDemo
//
//  Created by Maurizio Pietrantuono on 23/02/2018.
//  Copyright © 2018 Maurizio Pietrantuono. All rights reserved.
//

import UIKit

class QrCodeViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    class func onQrCodeUrlRetireved(_ url: URL) {

    }

    func onQrCodeUrlRetireved(_ url: URL) {
        if let last = url.pathComponents.last {
            if last == "red" {
                label.text = "THIS IS A RED LINK"
                label.textColor = UIColor.red
            }
            if last == "blue" {
                label.text = "THIS IS A BLU LINK"
                label.textColor = UIColor.blue
            }
        }
    }
}
