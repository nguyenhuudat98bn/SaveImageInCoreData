//
//  ViewController.swift
//  SaveImageInCoreData
//
//  Created by nguyễn hữu đạt on 6/14/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            guard let entity = try AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity]
                else{return}
            imageView.image = entity.last?.image as? UIImage
            
        } catch {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveData(_sender: UIButton){
        let image = Entity(context: AppDelegate.context)
        image.image = #imageLiteral(resourceName: "city")
        AppDelegate.saveContext()
    }
}

