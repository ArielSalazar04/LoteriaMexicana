//
//  ViewController.swift
//  Loteria Mexicana
//
//  Created by Ariel Salazar on 8/23/19.
//  Copyright © 2019 Ariel Salazar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var Gritón: UIButton!
    @IBOutlet weak var Jugador: UIButton!
    
    var songPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let introSound = Bundle.main.path(forResource: "Lotería mexicana", ofType: "mp3")
        do{
            songPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: introSound!))
        }
        catch{
            print(error)
        }
        
        songPlayer.play()
        
        Gritón.layer.borderWidth = 1.0
        Gritón.layer.borderColor = UIColor.white.cgColor
        
        Jugador.layer.borderWidth = 1.0
        Jugador.layer.borderColor = UIColor.white.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GritónButton(_ sender: UIButton) {
        songPlayer.stop()
    }
    @IBAction func JugadorButton(_ sender: UIButton) {
        songPlayer.stop()
    }
}

