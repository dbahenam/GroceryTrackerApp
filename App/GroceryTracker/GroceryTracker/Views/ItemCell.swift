//
//  ItemCell.swift
//  GroceryTracker
//
//  Created by David Bahena Moctezuma on 5/13/22.
//

import UIKit

class ItemCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
	  itemBubble.layer.cornerRadius = itemBubble.frame.size.height / 5
    }
  @IBOutlet weak var itemBubble: UIView!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var count: UILabel!
  @IBOutlet weak var rightImageView: UIImageView!
  
  
  override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
