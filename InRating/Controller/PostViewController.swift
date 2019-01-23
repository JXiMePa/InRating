//
//  ViewController.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import UIKit
import Alamofire

protocol PostVCP: class {
    func updateValues(_ fromPost: Post?)
}

final class PostViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var postImageView: UploadingImageView!
    @IBOutlet private weak var repostsLabel: CountLabel!
    @IBOutlet private weak var commentsLabel: CountLabel!
    @IBOutlet private weak var likeLabel: CountLabel!
    @IBOutlet private weak var bookmarksLabel: CountLabel!

    //MARK: Property
    private var presenter: PostPP!
    private var post: Post?

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Func
    private func setupView() {
        presenter = PostPresenter(with: self)
        postImageView.layer.cornerRadius = 15.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let statisticVC = segue.destination as? StatisticViewController {
            statisticVC.post = post
        }
    }
}

//MARK: PostViewController
extension PostViewController: PostVCP {
    
    func updateValues(_ fromPost: Post?) {
        guard let post = fromPost else { return }
        self.post = post
        titleLabel.text = post.title
        postImageView.setImageFromStringUrl = post.attachments?.images?.first?.url
        repostsLabel.text = String(post.repostsCount ?? 0)
        commentsLabel.text = String(post.commentsCount ?? 0)
        likeLabel.text = String(post.likesCount ?? 0)
        bookmarksLabel.text = String(post.bookmarksCount ?? 0)
    }
}
