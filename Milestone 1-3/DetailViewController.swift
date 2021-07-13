//
//  DetailViewController.swift
//  Milestone 1-3
//
//  Created by Sinan Kulen on 6.07.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedImage!.replacingOccurrences(of: "@3x.png", with: " ", options: String.CompareOptions.literal, range: nil).uppercased()
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: #selector(suggest))
        
    }
    
    @objc func suggest() {
        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
    

}
