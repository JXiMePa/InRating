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
}

//MARK: PostViewController
extension PostViewController: PostVCP {
    func updateValues(_ fromPost: Post?) {
        titleLabel.text = fromPost?.title
        postImageView.setImageFromStringUrl = fromPost?.attachments?.images?.first?.url
        repostsLabel.text = String(fromPost?.repostsCount ?? 0)
        commentsLabel.text = String(fromPost?.commentsCount ?? 0)
        likeLabel.text = String(fromPost?.likesCount ?? 0)
        bookmarksLabel.text = String(fromPost?.bookmarksCount ?? 0)
    }
}
