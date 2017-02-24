//
//  CamViewController.swift
//  wip_meenagram
//
//

import UIKit
import Firebase

class CamViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//UI Button Actions
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
    //end of UI Button Actions
    //get a photo from our devices library
    func getPhotoFromLibrary(){
        picker.delegate = self
        picker.allowsEditing = false
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        
        present(picker, animated: true, completion: nil)
    }
    //camera for new photo
    func takeNewPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.photo
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true, completion: nil)
        }else{
            noCameraAvailable()
        }
    }
    func noCameraAvailable(){
        let alertVC = UIAlertController(title: "No Camera Available", message: "Can't find a camera on this device", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    //function for image picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        postImageView.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    //when user cancels the image picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
