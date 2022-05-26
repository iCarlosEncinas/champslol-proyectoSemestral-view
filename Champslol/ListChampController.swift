//
//  ListChampController.swift
//  Champslol
//
//  Created by Alumno on 5/25/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class ListChampController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tvChamps: UITableView!
    var champs : [Champ] = []
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return champs.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellChamp") as! CellChampController
        cell.lblCampeon.text
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
