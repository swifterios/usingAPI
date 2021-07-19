//
//  PostsViewController.swift
//  usingAPI
//
//  Created by Владислав on 12.07.2021.
//

import UIKit

class PostsViewController: ViewController, UITableViewDataSource, UITableViewDelegate {
    
    var postsData: Posts?
    var postId: String?
    
    //MARK: - Outlets
    
    @IBOutlet weak var postsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getPosts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTableView.dataSource = self
        postsTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! CommentsViewController
        destVC.commentId = postId
    }
    
    func getPosts() {
        APIService.shared.getPosts { [weak self] posts in
            self?.postsData = posts
            self?.updateTableView()
        }
    }
    
    func updateTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.postsTableView.reloadData()
        }
    }
    
    
    @IBAction func openComments(_ sender: UIButton) {
        postId = String(describing: sender.tag)
    }
    
    
//    MARK: TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as! PostsTableViewCell
        
        let index = indexPath.row
        cell.commentsButton.tag = index
        
        if let postsData = postsData {
            cell.titleLabel.text = postsData[index].title?.uppercased()
            cell.textBodyLabel.text = postsData[index].body
        }
        
        return cell
    }
    
}
