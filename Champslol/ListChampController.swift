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
        cell.lblCampeon.text = champs[indexPath.row].campeon
        cell.lblFechaSalida.text = champs[indexPath.row].fecha_lanzamiento
        cell.lblEsenciaAzul.text = champs[indexPath.row].esencia_azul
        cell.lblClase.text = champs[indexPath.row].clase
        cell.lblRiotPoints.text = champs[indexPath.row].riot_points
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func inicializarVariantes() {
            let url = URL(string: "http://172.31.13.19:8000/api/champs")!
            var solicitud = URLRequest(url: url)
            solicitud.httpMethod = "GET"
            solicitud.allHTTPHeaderFields = [
                "Accept" : "application/json"
            ]
            let task = URLSession.shared.dataTask(with: solicitud) {
                data, request, error in
                if let data = data {
                    //Tenemos algo en data
                    if let champs_data = try? JSONDecoder().decode([Champ].self, from: data) {
                        DispatchQueue.main.async {
                            self.champs = champs_data
                            self.tvChamps
                                .reloadData()
                        }
                        
                    } else {
                        print("No se pudo interpretar respuesta")
                    }
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destino = segue.destination as! DetailsChampController
            destino.variant = champs[Champ.indexPathForSelectedRow!.row]
        }
}
