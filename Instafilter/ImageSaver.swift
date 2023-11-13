//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Tal talspektor on 12/11/2023.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?

    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, cintextInfo: UnsafeRawPointer) {
        if let error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
