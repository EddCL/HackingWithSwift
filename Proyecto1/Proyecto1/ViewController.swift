//
//  ViewController.swift
//  Proyecto1
//
//  Created by Eduardo Carrillo on 12/1/18.
//  Copyright © 2018 Eduardo Carrillo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"
        let fm = FileManager.default //declara la constante fm le asigna el valor regresado por FileManager.default. Este es un tipo de dato que nos permite trabajar con los archivos del sistema, y para este caso buscará los archivos
        let path = Bundle.main.resourcePath! //La constante path se establece como la ruta de recursos  del paquete (bundle) de la app. Un BUNDLE es un directorio que contiene el programa compilado y todos nuestros activos. "Dime donde encuentro todas esas imagenes que añadi a mi app"
        let items = try! fm.contentsOfDirectory(atPath: path) //la constante items se establece en el contenido del directorio en una ruta. Es una arreglo (coleccion) de los nombres de todos los arvhicos encontrados en el directorio de recursos para la app
        
        for item in items{
            if item.hasPrefix("nssl"){
                //Se carga la imagen
                pictures.append(item)
            }
        }
     print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

