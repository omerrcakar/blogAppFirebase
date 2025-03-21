//
//  UploadView.swift
//  blogFirebase
//
//  Created by ÖMER  on 19.03.2025.
//

import UIKit

class UploadView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func photoButton(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "Fotoğraf Kaynağını Seç", message: nil, preferredStyle: .actionSheet)

        actionSheet.addAction(UIAlertAction(title: "Galeriden Seç", style: .default, handler: { _ in
            self.openImagePicker(sourceType: .photoLibrary)
        }))

        actionSheet.addAction(UIAlertAction(title: "Kamerayı Aç", style: .default, handler: { _ in
            self.openImagePicker(sourceType: .camera)
        }))

        actionSheet.addAction(UIAlertAction(title: "İptal", style: .cancel, handler: nil))

        present(actionSheet, animated: true)
    }

    func openImagePicker(sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = sourceType
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true)
        }
    }

    // Seçilen veya çekilen fotoğrafı ImageView içine yerleştirme
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {
            imageView.image = selectedImage
        } else if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        picker.dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

