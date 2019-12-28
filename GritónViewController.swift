//
//  GritónViewController.swift
//  Loteria Mexicana
//
//  Created by Ariel Salazar on 8/24/19.
//  Copyright © 2019 Ariel Salazar. All rights reserved.
//

import UIKit

class Grito_nViewController: UIViewController {
    @IBOutlet weak var Empezar: UIButton!
    @IBOutlet weak var CardPlaceholder: UIImageView!
    @IBOutlet weak var Detras: UIButton!
    @IBOutlet weak var Siguiente: UIButton!
    @IBOutlet weak var MenuPrincipal: UIButton!
    
    var numbers: [Int] = []
    var gameSequence: [Int] = []
    var index: Int = 0
    var language: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if language == 1{
            Empezar.setTitle("Start", for: .normal)
            Detras.setTitle("Previous", for: .normal)
            Siguiente.setTitle("Next", for: .normal)
            MenuPrincipal.setTitle("Main Menu", for: .normal)
        }
        else{
            Empezar.setTitle("Empezar", for: .normal)
            Detras.setTitle("Detrás", for: .normal)
            Siguiente.setTitle("Siguiente", for: .normal)
            MenuPrincipal.setTitle("Menú Principal", for: .normal)
        }
        Empezar.layer.borderWidth = 1.0
        Empezar.layer.borderColor = UIColor.white.cgColor
        Empezar.layer.cornerRadius = 5
        Empezar.clipsToBounds = true
        
        Detras.isEnabled = false
        Detras.layer.borderWidth = 1.0
        Detras.layer.borderColor = UIColor.lightGray.cgColor
        Detras.setTitleColor(UIColor.lightGray, for: .normal)
        Detras.layer.cornerRadius = 5
        Detras.clipsToBounds = true
        
        Siguiente.isEnabled = false
        Siguiente.layer.borderWidth = 1.0
        Siguiente.layer.borderColor = UIColor.lightGray.cgColor
        Siguiente.setTitleColor(UIColor.lightGray, for: .normal)
        Siguiente.layer.cornerRadius = 5
        Siguiente.clipsToBounds = true
        
        MenuPrincipal.layer.borderWidth = 1.0
        MenuPrincipal.layer.borderColor = UIColor.white.cgColor
        MenuPrincipal.setTitleColor(UIColor.white, for: .normal)
        MenuPrincipal.layer.cornerRadius = 5
        MenuPrincipal.clipsToBounds = true
        
        CardPlaceholder.layer.borderColor = UIColor.white.cgColor

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.languageSwitch = language!
        }
    }
    
    func displayCard(){
        if language == 1{
            Empezar.setTitle("Card No°\(index+1)", for: .normal)
        }
        else{
            Empezar.setTitle("Carta No°\(index+1)", for: .normal)
        }
        let num = gameSequence[index]
        let pathName = "\(num)"
        CardPlaceholder.image = UIImage(named: pathName)
    }
    
    @IBAction func EmpezarButton(_ sender: UIButton) {
        for i in 1...54{
            numbers.append(i)
        }
        for _ in 1...54{
            let number = Int.random(in: 1...numbers.count)
            let value = numbers[number-1]
            numbers.remove(at: number-1)
            gameSequence.append(value)
        }
        
        displayCard()
        
        if language == 1{
            Empezar.setTitle("Card No°\(index+1)", for: .normal)
        }
        else{
            Empezar.setTitle("Carta No°\(index+1)", for: .normal)
        }
        Empezar.layer.borderColor = UIColor.white.cgColor
        Empezar.isEnabled = false
        
        Detras.isEnabled = true
        Detras.layer.borderColor = UIColor.white.cgColor
        Detras.setTitleColor(UIColor.white, for: .normal)
        
        Siguiente.isEnabled = true
        Siguiente.layer.borderColor = UIColor.white.cgColor
        Siguiente.setTitleColor(UIColor.white, for: .normal)
    }
    @IBAction func SiguienteBotton(_ sender: UIButton) {
        if index <= 52{
            index += 1
        }
        displayCard()
    }
    @IBAction func DetrásButton(_ sender: UIButton) {
        if index >= 1{
            index -= 1
        }
        displayCard()
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
