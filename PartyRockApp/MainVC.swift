//
//  ViewController.swift
//  PartyRockApp
//
//  Created by The Guest Family on 10/18/16.
//  Copyright © 2016 AlphaApplications. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*PartyRock is seperate class because it solely holds the imageURL,videoURL & videoTitle
         those instances are stored in the p1,p2 etc... and then apended the the partyRocks array to be
         used in the tableview
        */
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/AmQnoCeAziI/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AmQnoCeAziI\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle Lizard")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/Md-8YlE-KhA/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/oCpC7HRDwu4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Booty Man")
        
        let p3 = PartyRock(imageURL: "http://www.billboard.com/files/styles/article_main_image/public/media/redfoo-press-2015-billboard-650.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/TrVLu9p65a0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Where the Sun goes")
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/J7MQDULNIdU/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
        
        let p5 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/b/b7/Redfoo-Let's-Get-Ridiculous.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
        
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cast with idnetfier as partycell to get image and description data from labels
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyRockCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            
        }
        
        return UITableViewCell()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyrock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyrock)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
}

