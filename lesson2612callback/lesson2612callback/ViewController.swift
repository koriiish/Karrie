//
//  ViewController.swift
//  lesson2612callback
//
//  Created by Карина Дьячина on 26.12.23.
//

import UIKit

class ViewController: UIViewController {

    let downloadImage = DownloadImage()
    let qrCode = GenerateQRCode()
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       // setImage(for: imageView)
        
//        delayedExecution(delay: 3.0) {
//        self.setImage(for: self.imageView)
//                }
        qrCode.generateQRCodeWithCompletion(qrString: "hello olivka and karrie") { qrImage in
                    self.imageView.image = qrImage
                }
    }


}
func delayedExecution(delay: TimeInterval, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {//дедлайн от сейчас + делай (промежуток времени)
            completion()
        }
    }

extension ViewController {
    func setImage(for imageView: UIImageView) {
        if let imageURL = URL(string: "https://source.unsplash.com/random/800x600") {
            downloadImage.loadImageFromURL(url: imageURL) { image in
                DispatchQueue.main.async { [self] in //многопоточность
                    if let loadedImage = image {
                        self.imageView.image = loadedImage
                        self.imageView.contentMode = .scaleAspectFit
                        self.imageView.alpha = 0.0
                        UIView.animate(withDuration: 0.5, animations: {
                        self.imageView.alpha = 1.0
                        self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                        }, completion: { finished in
                        if finished {
                        print("Анимация завершена")
                        }
                    })
                    } else {
                        print("Не удалось загрузить изображение")
                    }
                }
            }
        }
    }
}
