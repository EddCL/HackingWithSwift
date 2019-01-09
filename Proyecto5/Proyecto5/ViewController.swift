//
//  ViewController.swift
//  Proyecto5
//
//  Created by Eduardo Carrillo on 12/3/18.
//  Copyright © 2018 Eduardo Carrillo. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var usedWords = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt"){
            if let startWords = try? String(contentsOfFile: startWordsPath){
                allWords = startWords.components(separatedBy: "\n")
            }
        } else{
            allWords = ["silkworm"]
        }
        
    startGame()
    
    }
    
    func startGame(){
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
        title = allWords[0]
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promtForAnswer(){
        let ac = UIAlertController(title: "Ponga su respuesta", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Enviar", style: .default) { [unowned self, ac] (action: UIAlertAction) in
            
            let answer = ac.textFields![0]
            self.submit(answer: answer.text!)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
//pagina 215

}

