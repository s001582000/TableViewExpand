//
//  MyCellOff.swift
//  TableViewOpen
//
//  Created by 梁雅軒 on 2017/4/4.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class MyCellOff: UITableViewCell {
    typealias Block = (Int,Int) -> Void
    var block:Block?
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInfo(_ info:MyInfo) {
        lblTitle.text = info.title
    }
    
    @IBAction func btnOnClick(_ sender: UIButton) {
        block?(self.tag,sender.tag)
    }
}
