//
//  URLImage.swift
//  lesson2612callback
//
//  Created by Карина Дьячина on 26.12.23.
//

import UIKit

class DownloadImage {
    func loadImageFromURL(url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil
            else{
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }.resume() // завершение работы с сетью
    }
}
