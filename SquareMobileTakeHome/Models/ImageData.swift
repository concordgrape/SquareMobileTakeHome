//
//  ImageData.swift
//  SquareMobileTakeHome
//
//  Created by Sky Roth on 2022-11-09.
//

import Foundation
import UIKit

//  Download an image from a URL
func downloadImage(from url: URL) -> UIImage {
    if let data = try? Data(contentsOf: url) {
        return UIImage(data: data)!
    }
    return UIImage()
}
