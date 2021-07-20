//
//  CommentsViewController.swift
//  usingAPI
//
//  Created by Владислав on 14.07.2021.
//

import UIKit

class CommentsViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    var commentsData: Comments?
    var commentId: String?
    
    //MARK: - Outlets
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getCommentsById(postId: commentId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        commentsTableView.dataSource = self
        commentsTableView.delegate = self

    }
    
    func getCommentsById(postId: String?) {
        if let postId = postId {
            APIService.shared.getCommentsById(postId: postId) { [weak self] comments in
                self?.commentsData = comments
                self?.updateTableView()
            }
        }
    }
    
    func updateTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.commentsTableView.reloadData()
        }
    }
    
    
    //MARK: - TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentsTableView.dequeueReusableCell(withIdentifier: "CommentsTableViewCell", for: indexPath) as! CommentsTableViewCell
        
        let index = indexPath.row
        
        if let commentsData = commentsData {
            cell.nameLabel.text = commentsData[index].name
            cell.emailLabel.text = commentsData[index].email
            cell.commentsLabel.text = commentsData[index].body
        }
        
        return cell
    }
    
}
