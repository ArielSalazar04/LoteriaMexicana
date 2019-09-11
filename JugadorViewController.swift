//
//  JugadorViewController.swift
//  Loteria Mexicana
//
//  Created by Ariel Salazar on 8/24/19.
//  Copyright © 2019 Ariel Salazar. All rights reserved.
//

import UIKit
import AVFoundation

class JugadorViewController: UIViewController {

    @IBOutlet weak var A1: UIButton!
    @IBOutlet weak var A2: UIButton!
    @IBOutlet weak var A3: UIButton!
    @IBOutlet weak var A4: UIButton!
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var C1: UIButton!
    @IBOutlet weak var C2: UIButton!
    @IBOutlet weak var C3: UIButton!
    @IBOutlet weak var C4: UIButton!
    @IBOutlet weak var D1: UIButton!
    @IBOutlet weak var D2: UIButton!
    @IBOutlet weak var D3: UIButton!
    @IBOutlet weak var D4: UIButton!
    
    @IBOutlet weak var Generar: UIButton!
    @IBOutlet weak var Seleccionar: UIButton!
    @IBOutlet weak var MenúPrincipal: UIButton!
    @IBOutlet weak var ObjetivoJugador: UILabel!
    @IBOutlet weak var promptLabel: UILabel!
    
    var numbers: [Int] = []
    var tableSequence: [Int] = []
    var cards: [UIButton] = []
    var beanBools: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    var index: Int = 0
    var dingPlayer = AVAudioPlayer()
    var whooshPlayer = AVAudioPlayer()
    
    var time: Int = 2
    var timerBean = Timer()
    var timerNoBean = Timer()
    var object: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dingSound = Bundle.main.path(forResource: "dingM", ofType: "mp3")
        do{
            dingPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: dingSound!))
        }
        catch{
            print(error)
        }
        
        let whooshSound = Bundle.main.path(forResource: "whooshM", ofType: "mp3")
        do{
            whooshPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: whooshSound!))
        }
        catch{
            print(error)
        }
        
        Generar.layer.borderWidth = 1.0
        Generar.layer.borderColor = UIColor.white.cgColor
        
        Seleccionar.isEnabled = false
        Seleccionar.layer.borderWidth = 1.0
        Seleccionar.layer.borderColor = UIColor.lightGray.cgColor
        Seleccionar.setTitleColor(UIColor.lightGray, for: .normal)
        
        MenúPrincipal.layer.borderWidth = 1.0
        MenúPrincipal.layer.borderColor = UIColor.white.cgColor
        
        cards = [A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4]
        
        for i in 0...15{
            cards[i].setImage(UIImage(named: "0"), for: .normal)
            cards[i].layer.borderWidth = 1.0
            cards[i].layer.borderColor = UIColor.white.cgColor
            cards[i].isEnabled = false
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GenerarButton(_ sender: UIButton) {
        Seleccionar.layer.borderWidth = 1.0
        Seleccionar.layer.borderColor = UIColor.white.cgColor
        Seleccionar.setTitleColor(UIColor.white, for: .normal)
        Seleccionar.isEnabled = true
        // "Seleccionar" button is enabled once the user has generated the first table
        
        tableSequence = [] // Empties array if the table is generated multiple times
        index = 0 // Resets the index if the table is generated multiple times
        
        for i in 1...54{
            numbers.append(i)
        } // "Numbers" array is created with values from 1-54
        for _ in 1...16{
            let element = Int.random(in: 1...numbers.count)
            let value = numbers[element-1]
            numbers.remove(at: element-1)
            tableSequence.append(value)
        } // For loop generates the table
        numbers = [] // Empries the array in case the the table is generated again
        
        for i in 0...15{
            index = i
            displayCard()
        } // Displays all cards as the empty card placeholder
    } // User generates a table
    @IBAction func SeleccionarButton(_ sender: UIButton) {
        for i in 0...15{
            cards[i].isEnabled = true
        } // All button cards are enabled because the game starts if the button is hit
        
        promptLabel.text = "Has elegido esta tabla.\nPresiona una cartita para marcarla."
        Generar.layer.borderColor = UIColor.lightGray.cgColor
        Generar.setTitleColor(UIColor.lightGray, for: .normal)
        Generar.isEnabled = false
        // "Generar" button is no longer needed
        
        Seleccionar.layer.borderColor = UIColor.lightGray.cgColor
        Seleccionar.setTitleColor(UIColor.lightGray, for: .normal)
        Seleccionar.isEnabled = false
        // "Seleccionar" button is no longer needed
    } // User selects a table
    
    func anyButtonAction(using a: Int){
        for i in 0...15{
            cards[i].isEnabled = false
        } // Disables button cards so user does not spam or glitch the game
        index = a
        object = cards[index] // Global varaible "object" is assigned the button name
        displays() // Function call; Decides whether to apply the bean or not
    } // Performs all the buttons' responsibiities
    
    @objc func frijol(){
        if time == 2{
            displayBean()
            dingPlayer.play()
            time -= 1
        }
        else if time == 1{
            promptLabel.text = "Presiona una cartita para marcarla."
            loteria()
            timerBean.invalidate()
            time = 0
        }
    } // Timer mechanic for bean apllication
    
    @objc func noFrijol(){
        if time == 2{
            displayCard()
            whooshPlayer.play()
            time -= 1
        }
        else if time == 1{
            promptLabel.text = "Presiona una cartita para marcarla."
            loteria()
            timerNoBean.invalidate()
            time = 0
        }
    } // Timer mechanic for bean removal
    
    func displays(){
        if beanBools[index] == false{
            promptLabel.text = "Colocando un frijol..."
            time = 2
            timerBean = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(JugadorViewController.frijol), userInfo: nil, repeats: true)
            beanBools[index] = true
        } // Bean will get displayed
        else{
            promptLabel.text = "Retirando un frijol..."
            time = 2
            timerNoBean = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(JugadorViewController.noFrijol), userInfo: nil, repeats: true)
            beanBools[index] = false
        } // Normal card will get displayed
    } // Decides whether to apply the bean or not
    
    func displayCard(){
        let num = tableSequence[index] // Sets the nth card to num
        let object = cards[index] // Sets the button name to object
        let pathName = "\(num)"
        object.setImage(UIImage(named: pathName), for: .normal)
        
    } // Function will set the correct card image to the selected button
    
    func displayBean(){
        let num = tableSequence[index]
        let object = cards[index]
        let pathName = "\(num)B"
        object.setImage(UIImage(named: pathName), for: .normal)
    } // Function will set the correct bean and card image to the selected button
    
    func loteria(){
        var loteríaFlag: Bool = true // Flag determines if the user won the game
        for i in 0...15{
            if beanBools[i] == false{
                promptLabel.text = "Presiona una cartita para marcarla."
                loteríaFlag = false
                break
            }
        } // If one of the cards is not a bean card, then the flag is false and the user has not won yet
        if loteríaFlag{
            promptLabel.text = "HAS COMPLETADO LA TABLA. \nGRITA ¡LOTERÍA!"
        } // If all cards show the bean, then the flag is true and the user has won the game
        for i in 0...15{
            cards[i].isEnabled = true
        } // Re-enables all the cards
    } // Finds if the user has won the game or not
    
    @IBAction func A1Button(_ sender: UIButton) {
        anyButtonAction(using: 0) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func A2Button(_ sender: UIButton) {
        anyButtonAction(using: 1) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func A3Button(_ sender: UIButton) {
        anyButtonAction(using: 2) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func A4Button(_ sender: UIButton) {
        anyButtonAction(using: 3) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func B1Button(_ sender: UIButton) {
        anyButtonAction(using: 4) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func B2Button(_ sender: UIButton) {
        anyButtonAction(using: 5) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func B3Button(_ sender: UIButton) {
        anyButtonAction(using: 6) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func B4Button(_ sender: UIButton) {
        anyButtonAction(using: 7) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func C1Button(_ sender: UIButton) {
        anyButtonAction(using: 8) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func C2Button(_ sender: UIButton) {
        anyButtonAction(using: 9) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func C3Button(_ sender: UIButton) {
        anyButtonAction(using: 10) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func C4Button(_ sender: UIButton) {
        anyButtonAction(using: 11) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func D1Button(_ sender: UIButton) {
        anyButtonAction(using: 12) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func D2Button(_ sender: UIButton) {
        anyButtonAction(using: 13) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func D3Button(_ sender: UIButton) {
        anyButtonAction(using: 14) // Function call; performs all the buttons' responsibiities
    }
    @IBAction func D4Button(_ sender: UIButton) {
        anyButtonAction(using: 15) // Function call; performs all the buttons' responsibiities
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
