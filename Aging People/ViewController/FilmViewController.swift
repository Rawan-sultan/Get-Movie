//
//  FielmViewController.swift
//  Aging People
//
//  Created by 라완 💕 on 12/05/1444 AH.
//

import UIKit

class FilmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var films: [Resultt] = []
    
    

    @IBOutlet weak var filemTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let main = films[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmTableViewCell", for: indexPath) as! FilmTableViewCell
        cell.filem.text = main.title
        
        return cell

        }
    func fetch() {
        
        let jsonURLstring = "https://swapi.dev/api/films"
        guard let url = URL(string : jsonURLstring) else {return }
        URLSession.shared.dataTask(with: url) { data , response, error in
            let decoder = JSONDecoder()
            guard let data = data else { return }

           do {
               let nameFilms = try decoder.decode(Film.self ,from: data )
               guard let namefilms = nameFilms.results else { return }
               self.films = namefilms

               DispatchQueue.main.async { [weak self] in
                   
                   self?.filemTable.reloadData()
               }
               print (namefilms)
           }catch let jsonErr{
               print("Error :" ,jsonErr )
           }
       }
        .resume()
    }
}
    
