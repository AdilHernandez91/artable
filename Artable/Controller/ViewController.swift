//
//  ViewController.swift
//  Artable
//
//  Created by German Hernandez on 28/03/2019.
//  Copyright © 2019 German Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let storyboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
        
        present(controller, animated: true, completion: nil)
    }
    
}

