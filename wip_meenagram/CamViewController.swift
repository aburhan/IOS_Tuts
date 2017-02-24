//
//  CamViewController.swift
//  wip_meenagram
//
//

import UIKit

class CamViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sharePhoto(_ sender: Any) {
    }
    @IBAction func cancelUpload(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func pickPhotoFromGallery(_ sender: Any) {
        getPhotoFromLibrary()
    }
    @IBAction func takePhotoAction(_ sender: Any) {
        takeNewPhoto()
    }
    func getPhotoFromLibrary(){
        picker.delegate = self
        picker.allowsEditing = false
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        
        present(picker, animated: true, completion: nil)
    }
    func takeNewPhoto(){
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        postImageView.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
