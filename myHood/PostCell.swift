//
//  PostCell.swift
//  myHood
//
//  Created by AmiiirM on 7/27/16.
//  Copyright © 2016 AmiiirM. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    func configureCell(post: Post){
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        postImg.image = DataService.instance.imageForPath(post.imagePath)
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()

        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
