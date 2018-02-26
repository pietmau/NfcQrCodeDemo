//
//  TagViewController.swift
//  NfcQrCodeDemo
//
//  Created by Maurizio Pietrantuono on 23/02/2018.
//  Copyright © 2018 Maurizio Pietrantuono. All rights reserved.
//

import UIKit
import CoreNFC

class TagViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onButtonClick(_ sender: Any) {
        let session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session.begin()
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        if let message = messages.first, let record = message.records.first {
            setText(record)
        }
    }


    private func setText(_ payload: NFCNDEFPayload) {
        switch payload.typeNameFormat {
        case .nfcWellKnown:
            if let type = String(data: payload.type, encoding:.utf8) {
                label.text = "NFC Well Known type: " + type
            } else {
                label.text = "Invalid data"
            }
        case .absoluteURI:
            if let text = String(data: payload.payload, encoding:.utf8) {
                label.text = text
            } else {
                label.text = "Invalid data"
            }
        case .media:
            if let type = String(data: payload.type, encoding:.utf8) {
                label.text = "Media type: " + type
            } else {
                label.text = "Invalid data"
            }
        case .nfcExternal:
            label.text = "NFC External type"
        case .unknown:
            label.text = "Unknown type"
        case .unchanged:
            label.text = "Unchanged type"
        default:
            label.text = "Invalid data"
        }
    }
}
