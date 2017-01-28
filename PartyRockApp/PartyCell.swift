//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by The Guest Family on 10/19/16.
//  Copyright © 2016 AlphaApplications. All rights reserved.
//

import UIKit
import Foundation

class PartyCell: UITableViewCell {
    
    
    @IBOutlet weak var videoImagePreview: UIImageView!
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func updateUI(partyRock: PartyRock) {
        videoTitleLabel.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)! //take the partyRock array's imageURL, convert to URL
        
        DispatchQueue.global().async { //async means background, this one does url first
            do {
                let data = try Data.init(contentsOf: url)
                DispatchQueue.global().sync { //sync is the main thread, after url, mut place the image
                    self.videoImagePreview.image = UIImage(data: data)
                }
            } catch {
                print("Error")
            }
        }
        
    }

}
