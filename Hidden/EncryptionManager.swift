//
//  EncryptionManager.swift
//  Hidden
//
//  Created by Minh Tran on 9/4/16.
//  Copyright © 2016 Minh. All rights reserved.
//

import Foundation
import UIKit

class EncryptionManager {
    private var image: UIImage
    private var textToEncrypt: String?
    
    init(image: UIImage, textToEncrypt: String) {
        self.image = image
        self.textToEncrypt = textToEncrypt
    }
    init(image: UIImage) {
        self.image = image
    }
    
    func encrypt() -> Bool {
        
    }
    func getPixelArray() {
        if let image = myImageView.image {
    
            var pixelData = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage))
            var data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
            
            let height = Int(image.size.height)
            let width = Int(image.size.width)
            var zArry = [Int](count:3, repeatedValue: 0)
            var yArry = [[Int]](count:width, repeatedValue: zArry)
            var xArry = [[[Int]]](count:height, repeatedValue: yArry)
            
            for (var h = 0; h < height; h++) {
                for (var w = 0; w < width; w++) {
                    var pixelInfo: Int = ((Int(image.size.width) * Int(h)) + Int(w)) * 4
                    var rgb = 0
                    xArry[h][w][rgb] = Int(data[pixelInfo])
                    rgb++
                    xArry[h][w][rgb] = Int(data[pixelInfo+1])
                    rgb++
                    xArry[h][w][rgb] = Int(data[pixelInfo+2])
                }
            }
            println(xArry[20][20][1])
        }
    }
}