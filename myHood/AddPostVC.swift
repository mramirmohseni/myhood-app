//
//  AddPostVC.swift
//  myHood
//
//  Created by AmiiirM on 7/27/16.
//  Copyright © 2016 AmiiirM. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet var titleLbl: UITextField!
    @IBOutlet var descLbl: UITextField!
    @IBOutlet var postImg: UIImageView!
    
    @IBOutlet var newPostBtn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        
        newPostBtn.layer.cornerRadius = 5.0
        newPostBtn.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onNewPostPressed(sender: AnyObject) {
        if let title = titleLbl.text , let desc = descLbl.text , let img = postImg.image {
            let imagePath = DataService.instance.saveImageAndCreatePath(img)
            let post = Post(imagePath: imagePath, title: title, postDesc: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
            
        }
        
    }
    
    @IBAction func onCancelPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onAddPhotoPressed(sender: UIButton!) {
            sender.setTitle("", forState: .Normal)
            presentViewController(imagePicker, animated: true, completion: nil)
        

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first{
            view.endEditing(true)
            
        }
    }
    
}
