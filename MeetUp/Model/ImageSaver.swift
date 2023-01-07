//
//  ImageSaver.swift
//  MeetUp
//
//  Created by Orlando Moraes Martins on 07/01/23.
//

import UIKit

class ImageSaver: NSObject {
    var successHandleer: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveComplete), nil)
    }
    
    @objc func saveComplete(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        print("Save Finished!")
        if let error = error {
            errorHandler?(error)
        } else {
            successHandleer?()
        }
    }
}
