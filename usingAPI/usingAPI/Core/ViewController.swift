//
//  ViewController.swift
//  usingAPI
//
//  Created by Владислав on 11.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func postsButton(_ sender: Any) {
         
        PostsService.shared.getPosts { posts in
            
        }
    }
}

