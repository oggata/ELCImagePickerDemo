//
//  ViewController.swift
//  ELCImagePickerDemo
//
//  Created by Fumitoshi Ogata on 2014/12/26.
//  Copyright (c) 2014年 Fumitoshi Ogata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ELCImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var button: UIButton!
    @IBAction func addButton(sender: AnyObject) {
        self.pickImages()
    }
    
    // 写真を選択する
    func pickImages() {
        let picker = ELCImagePickerController()
        picker.maximumImagesCount = 5  // 選択する最大枚数
        picker.imagePickerDelegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    //  写真選択時に呼び出される
    func elcImagePickerController(picker: ELCImagePickerController!, didFinishPickingMediaWithInfo info: [AnyObject]!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        if (info.count == 0) {
            return
        }
        var pickedImages = NSMutableArray()
        for any in info {
            let dict = any as NSMutableDictionary
            let image = dict.objectForKey(UIImagePickerControllerOriginalImage) as UIImage
            pickedImages.addObject(image)
        }
        println(pickedImages)
    }
    
    // 写真未選択時に呼び出される
    func elcImagePickerControllerDidCancel(picker: ELCImagePickerController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

