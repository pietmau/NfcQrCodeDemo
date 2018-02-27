//
//  CameraViewController.swift
//  NfcQrCodeDemo
//
//  Created by Maurizio Pietrantuono on 27/02/2018.
//  Copyright © 2018 Maurizio Pietrantuono. All rights reserved.
//

import AVFoundation
import UIKit
import QRCodeReader

class CameraViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var previewView: QRCodeReaderView! {
        didSet {
            previewView.setupComponents(showCancelButton: false, showSwitchCameraButton: false, showTorchButton: false, showOverlayView: true, reader: reader)
        }
    }

    lazy var reader: QRCodeReader = QRCodeReader()

    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            $0.showTorchButton = true

            $0.reader.stopScanningWhenCodeIsFound = false
        }

        return QRCodeReaderViewController(builder: builder)
    }()

    @IBAction func scanInPreviewAction(_ sender: Any) {
        reader.didFindCode = { result in
            self.label.text = result.value
        }
        reader.startScanning()
    }
}
