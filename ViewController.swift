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
    @IBOutlet weak var TitleHeader: UILabel!
    @IBOutlet weak var Creator: UILabel!
    @IBOutlet weak var Gamemode: UILabel!
    @IBOutlet weak var Language: UISegmentedControl!
    
    var songPlayer = AVAudioPlayer()
    var songCurrentTime: Double?
    
    var languageSwitch: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let introSound = Bundle.main.path(forResource: "Lotería mexicana", ofType: "mp3")
        do{
            songPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: introSound!))
        }
        catch{
            print(error)
        }
        
        if songCurrentTime != nil{
            songPlayer.currentTime = songCurrentTime!
        }
        
        songPlayer.play()
        
        Gritón.layer.cornerRadius = 5
        Gritón.layer.borderWidth = 1.0
        Gritón.layer.borderColor = UIColor.white.cgColor
        Gritón.clipsToBounds = true
        
        Jugador.layer.cornerRadius = 5
        Jugador.layer.borderWidth = 1.0
        Jugador.layer.borderColor = UIColor.white.cgColor
        Jugador.clipsToBounds = true
        
        Language.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        Language.selectedSegmentIndex = languageSwitch
        
        if Language.selectedSegmentIndex == 1{
            TitleHeader.text = "Mexican Bingo"
            Creator.text = "Created by: Ariel Salazar"
            Gamemode.text = "Choose a Game Mode:"
            Gritón.setTitle("Shouter", for: .normal)
            Jugador.setTitle("Player", for: .normal)
        }
        else{
            TitleHeader.text = "Lotería Mexicana"
            Creator.text = "Creado por: Ariel Salazar"
            Gamemode.text = "Elige un modo de juego:"
            Gritón.setTitle("Gritón", for: .normal)
            Jugador.setTitle("Jugador", for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gritónViewController = segue.destination as? Grito_nViewController {
            gritónViewController.language = Language.selectedSegmentIndex
        }
        if let jugadorViewController = segue.destination as? JugadorViewController {
            jugadorViewController.language = Language.selectedSegmentIndex
        }
        if let GritónTutorial = segue.destination as? Grito_nTutorial {
            GritónTutorial.language = Language.selectedSegmentIndex
            GritónTutorial.songTime = songPlayer.currentTime
        }
        if let JugadorTutorial = segue.destination as? JugadorTutorial {
            JugadorTutorial.language = Language.selectedSegmentIndex
            JugadorTutorial.songTime = songPlayer.currentTime
        }
    }
    
    @IBAction func GritónButton(_ sender: UIButton) {
        songPlayer.stop()
        songCurrentTime = 0
    }
    @IBAction func JugadorButton(_ sender: UIButton) {
        songPlayer.stop()
        songCurrentTime = 0
    }
    @IBAction func Language(_ sender: UISegmentedControl) {
        if Language.selectedSegmentIndex == 1{
            TitleHeader.text = "Mexican Bingo"
            Creator.text = "Created by: Ariel Salazar"
            Gamemode.text = "Choose a Game Mode:"
            Gritón.setTitle("Shouter", for: .normal)
            Jugador.setTitle("Player", for: .normal)
        }
        else{
            TitleHeader.text = "Lotería Mexicana"
            Creator.text = "Creado por: Ariel Salazar"
            Gamemode.text = "Elige un modo de juego:"
            Gritón.setTitle("Gritón", for: .normal)
            Jugador.setTitle("Jugador", for: .normal)
        }
    }
    @IBAction func GritónInformación(_ sender: UIButton) {
        songPlayer.stop()
    }
    @IBAction func JugadorInformación(_ sender: Any) {
        songPlayer.stop()
    }
    
}
