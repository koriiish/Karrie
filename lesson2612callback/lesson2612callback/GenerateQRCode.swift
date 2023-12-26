//
//  GenerateQRCode.swift
//  lesson2612callback
//
//  Created by Карина Дьячина on 26.12.23.
//

import UIKit

class GenerateQRCode {
    func generateQRCodeWithCompletion(qrString: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            if let data = qrString.data(using: String.Encoding.ascii) {
                let filter = CIFilter(name: "CIQRCodeGenerator")
                filter?.setValue(data, forKey: "inputMessage")
                
                if let ciImage = filter?.outputImage {
                    let scaleX = 200 / ciImage.extent.size.width
                    let scaleY = 200 / ciImage.extent.size.height
                    let transformedImage = ciImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
                    
                    let qrImage = UIImage(ciImage: transformedImage)
                    DispatchQueue.main.async {
                        completion(qrImage)
                    }
                }
            }
        }
    }
}
