//
//  ImagePicker.swift
//  MeetUp
//
//  Created by Orlando Moraes Martins on 07/01/23.
//

import PhotosUI
import SwiftUI

struct imagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: imagePicker
        
        init( _ parent: imagePicker ){
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self){
                provider.loadObject(ofClass: UIImage.self){ image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
