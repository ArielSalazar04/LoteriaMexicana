//
//  JugadorTutorial.swift
//  Loteria Mexicana
//
//  Created by Ariel Salazar on 11/28/19.
//  Copyright © 2019 Ariel Salazar. All rights reserved.
//

import UIKit
import AVFoundation

class JugadorTutorial: UIViewController {
    @IBOutlet weak var JugadorTitleInstructions: UILabel!
    @IBOutlet weak var GenerarButton: UIButton!
    @IBOutlet weak var GenerarDescription: UILabel!
    @IBOutlet weak var SeleccionarButton: UIButton!
    @IBOutlet weak var SeleccionarDescription: UILabel!
    @IBOutlet weak var InformationBox: UILabel!
    @IBOutlet weak var LeftArrow: UIButton!
    @IBOutlet weak var RightArrow: UIButton!
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
        
        GenerarButton.isEnabled = false
        SeleccionarButton.isEnabled = false
        
        if language == 1{
            JugadorTitleInstructions.text = "Instructions for Player"
            
            GenerarButton.setTitle("Generate", for: .normal)
            GenerarDescription.text = "Generate a table"
            
            SeleccionarButton.setTitle("Select", for: .normal)
            SeleccionarDescription.text = "Select the table"
            
            MenuButton.setTitle("Main Menu", for: .normal)
            
            instructions = [
                "1. You must generate a table and mark the cards only when the Shouter announces them.", "2. To mark a card, press it and a bean will be placed on top of that card. ", "3. To remove the mark, press the card once more. ", "4. You win the game when you mark ALL the cards of your table and shout \"¡Lotería!\"", "5. The Shouter will check your table and validate your victory. ","6. Good luck!"
            ]
        }
        
        else{
            JugadorTitleInstructions.text = "Instrucciones para Jugador"
            
            GenerarButton.setTitle("Generar", for: .normal)
            GenerarDescription.text = "Generar una tabla"
            
            SeleccionarButton.setTitle("Seleccionar", for: .normal)
            SeleccionarDescription.text = "Seleccionar la tabla"
            
            MenuButton.setTitle("Menú Principal", for: .normal)
            
            instructions = [
                "1. Debes generar una tabla y marcar las cartas extraídas solamente cuando el Gritón las anuncie.", "2. Para marcar una carta, presionala y un frijol se colocará encima de ella.", "3. Para quitarle la marca a la carta, presionala de nuevo.", "4. Ganas cuando marcas TODA tu tabla y gritas \"¡Lotería!\"", "5. El Gritón es el que revisará tu tabla y validará tu victoria.","6. ¡Buena Suerte!"
            ]
        }
        
        InformationBox.text = instructions[count];
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
    
    @IBAction func NextButton(_ sender: Any) {
        count += 1;
        if count <= 5{
            InformationBox.text = instructions[count];
        }
        if count == 5{
            RightArrow.isEnabled = false;
        }
        if !LeftArrow.isEnabled{
            LeftArrow.isEnabled = true;
        }
    }
    @IBAction func PreviousButton(_ sender: Any) {
        count -= 1;
        if count >= 0{
            InformationBox.text = instructions[count];
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
