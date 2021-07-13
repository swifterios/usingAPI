//
//  PostsViewController.swift
//  usingAPI
//
//  Created by Владислав on 12.07.2021.
//

import UIKit

class PostsViewController: ViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var postsTableView: UITableView!
    var postsData:Posts?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getPosts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PostsTableViewCell", bundle: nil)
        postsTableView.register(nib, forCellReuseIdentifier: "PostsTableViewCell")
        postsTableView.dataSource = self
        postsTableView.delegate = self
    }
    
    func getPosts() {
        PostsService.shared.getPosts { posts in
            self.postsData = posts
            self.updateTableView()
        }
    }
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.postsTableView.reloadData()
        }
    }

    
//    MARK: TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as! PostsTableViewCell
        let index = indexPath.row
        
        if let postsData = postsData {
            cell.titleLabel.text = postsData[index].title
            cell.textBodyLabel.text = postsData[index].body
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
