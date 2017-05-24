//
//  PhotoViewController.swift
//  TabBar
//
//  Created by Иосиф Дзеранов on 24/05/2017.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var storage : StorageManager!
    let imagePicker =   UIImagePickerController()
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
   
    //MARK: - Actions
    @IBAction func downloadButton(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)

    }
    
    @IBAction func UploadButton(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        let data = ImageHelper.imageJPEGToData(image: image)
        storage.UploadFile(data: dataç)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storage  = StorageManager()
        imagePicker.delegate = self
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
