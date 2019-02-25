//
//  Helpers.swift
//  PruebaMovies
//
//  Created by Rodrigo Astorga on 2/25/19.
//  Copyright © 2019 rastorga. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(url: URL) {
        debugPrint("Cargar imagen: ", url)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
