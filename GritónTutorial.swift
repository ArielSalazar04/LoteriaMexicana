//
//  GritónTutorial.swift
//  Loteria Mexicana
//
//  Created by Ariel Salazar on 10/19/19.
//  Copyright © 2019 Ariel Salazar. All rights reserved.
//

import UIKit
import AVFoundation

class Grito_nTutorial: UIViewController {
    @IBOutlet weak var InstructionsTitle: UILabel!
    
    @IBOutlet weak var EmpezarButton: UIButton!
    @IBOutlet weak var EmpezarDescription: UILabel!
    
    @IBOutlet weak var SiguienteButton: UIButton!
    @IBOutlet weak var SiguienteDescription: UILabel!
    
    @IBOutlet weak var DetrásButton: UIButton!
    @IBOutlet weak var DetrásDescription: UILabel!
    
    @IBOutlet weak var GuideTextBox: UILabel!
    
    @IBOutlet weak var RightArrow: UIButton!
    @IBOutlet weak var LeftArrow: UIButton!
    
    @IBOutlet weak var MenuButton: UIButton!
    
    var instructions: [String] = []
    var count: Int = 0
    var language: Int?
    
    var song = AVAudioPlayer()
    var songTime: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let introSound = Bundle.main.path(forResource: "Lotería mexicana", ofType: "mp3")
        do{
            song = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: introSound!))
        }
        catch{
            print(error)
        }
        
        song.currentTime = songTime!
        song.play()
        
        DetrásButton.isEnabled = false;
        SiguienteButton.isEnabled = false;
        EmpezarButton.isEnabled = false;
        
        if language == 1{
            InstructionsTitle.text = "Instructions for Shouter"
            
            EmpezarButton.setTitle("Start", for: .normal)
            EmpezarDescription.text = "Start the game"
            
            SiguienteButton.setTitle("Next", for: .normal)
            SiguienteDescription.text = "Next card"
            
            DetrásButton.setTitle("Previous", for: .normal)
            DetrásDescription.text = "Previous card"
            
            instructions = [
                "1. You have 54 cards. You need to shout the name of each card that appears in the frame, one at a time.", "2. The game finishes when you shout the names of all the cards.", "3. The winner is the first player to shout \"Loteria!\"", "4. You can only validate the victory if the player's table is complete.", "5. Enjoy the game!"
            ];
            
            MenuButton.setTitle("Main Menu", for: .normal)
        }
        else{
            InstructionsTitle.text = "Instrucciones para Gritón"
            
            EmpezarButton.setTitle("Empezar", for: .normal)
            EmpezarDescription.text = "Empezar el juego"
            
            SiguienteButton.setTitle("Siguiente", for: .normal)
            SiguienteDescription.text = "Siguiente carta"
            
            DetrásButton.setTitle("Detrás", for: .normal)
            DetrásDescription.text = "Carta anterior"
            
            instructions = [
                "1. Tienes 54 cartas. Debes gritar el nombre de la carta que aparezca en el marco, una a la vez.", "2. El juego termina cuando hayas gritado el nombre de todas las cartas.", "3. El ganador es el primer jugador que grite \"Loteria!\"", "4. Solamente podrás validar la victoria si la tabla del jugador está completamente marcada.", "5. ¡Disfruta del juego!"
            ];
            
            MenuButton.setTitle("Menú Principal", for: .normal)
        }
        
        GuideTextBox.text = instructions[count];
        LeftArrow.isEnabled = false;
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.languageSwitch = language!
        }
        if let sTime = segue.destination as? ViewController {
            sTime.songCurrentTime = song.currentTime
        }
    }
    
    @IBAction func NextButton(_ sender: UIButton) {
        count += 1;
        if count <= 4{
            GuideTextBox.text = instructions[count];
        }
        if count == 4{
            RightArrow.isEnabled = false;
        }
        if !LeftArrow.isEnabled{
            LeftArrow.isEnabled = true;
        }
    }
    @IBAction func PreviousButton(_ sender: UIButton) {
        count -= 1;
        if count >= 0{
            GuideTextBox.text = instructions[count];
        }
        if count == 0{
            LeftArrow.isEnabled = false;
        }
        if !RightArrow.isEnabled{
            RightArrow.isEnabled = true;
        }
    }
    
    @IBAction func MenuButton(_ sender: UIButton) {
        song.stop()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
