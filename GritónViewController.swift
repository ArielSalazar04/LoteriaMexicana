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
    @IBOutlet weak var MenuPrincipal: UIButton!
    @IBOutlet weak var Detras: UIButton!
    @IBOutlet weak var Siguiente: UIButton!
    @IBOutlet weak var ObjetivoGritón: UILabel!
    @IBOutlet weak var CardPlaceholder: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Empezar.layer.borderWidth = 1.0
        Empezar.layer.borderColor = UIColor.white.cgColor
        
        Detras.isEnabled = false
        Detras.layer.borderWidth = 1.0
        Detras.layer.borderColor = UIColor.lightGray.cgColor
        Detras.setTitleColor(UIColor.lightGray, for: .normal)
        
        Siguiente.isEnabled = false
        Siguiente.layer.borderWidth = 1.0
        Siguiente.layer.borderColor = UIColor.lightGray.cgColor
        Siguiente.setTitleColor(UIColor.lightGray, for: .normal)
        
        
        MenuPrincipal.layer.borderWidth = 1.0
        MenuPrincipal.layer.borderColor = UIColor.white.cgColor
        MenuPrincipal.setTitleColor(UIColor.white, for: .normal)
        
        CardPlaceholder.layer.borderColor = UIColor.white.cgColor

        // Do any additional setup after loading the view.
    }
    
    var numbers: [Int] = []
    var gameSequence: [Int] = []
    var index: Int = 0
    
    func displayCard(){
        Empezar.setTitle("Carta No°\(index+1)", for: .normal)
        let num = gameSequence[index]
        
        switch num{
        case 1:
            CardPlaceholder.image = UIImage(named: "1")
        case 2:
            CardPlaceholder.image = UIImage(named: "2")
        case 3:
            CardPlaceholder.image = UIImage(named: "3")
        case 4:
            CardPlaceholder.image = UIImage(named: "4")
        case 5:
            CardPlaceholder.image = UIImage(named: "5")
        case 6:
            CardPlaceholder.image = UIImage(named: "6")
        case 7:
            CardPlaceholder.image = UIImage(named: "7")
        case 8:
            CardPlaceholder.image = UIImage(named: "8")
        case 9:
            CardPlaceholder.image = UIImage(named: "9")
        case 10:
            CardPlaceholder.image = UIImage(named: "10")
        case 11:
            CardPlaceholder.image = UIImage(named: "11")
        case 12:
            CardPlaceholder.image = UIImage(named: "12")
        case 13:
            CardPlaceholder.image = UIImage(named: "13")
        case 14:
            CardPlaceholder.image = UIImage(named: "14")
        case 15:
            CardPlaceholder.image = UIImage(named: "15")
        case 16:
            CardPlaceholder.image = UIImage(named: "16")
        case 17:
            CardPlaceholder.image = UIImage(named: "17")
        case 18:
            CardPlaceholder.image = UIImage(named: "18")
        case 19:
            CardPlaceholder.image = UIImage(named: "19")
        case 20:
            CardPlaceholder.image = UIImage(named: "20")
        case 21:
            CardPlaceholder.image = UIImage(named: "21")
        case 22:
            CardPlaceholder.image = UIImage(named: "22")
        case 23:
            CardPlaceholder.image = UIImage(named: "23")
        case 24:
            CardPlaceholder.image = UIImage(named: "24")
        case 25:
            CardPlaceholder.image = UIImage(named: "25")
        case 26:
            CardPlaceholder.image = UIImage(named: "26")
        case 27:
            CardPlaceholder.image = UIImage(named: "27")
        case 28:
            CardPlaceholder.image = UIImage(named: "28")
        case 29:
            CardPlaceholder.image = UIImage(named: "29")
        case 30:
            CardPlaceholder.image = UIImage(named: "30")
        case 31:
            CardPlaceholder.image = UIImage(named: "31")
        case 32:
            CardPlaceholder.image = UIImage(named: "32")
        case 33:
            CardPlaceholder.image = UIImage(named: "33")
        case 34:
            CardPlaceholder.image = UIImage(named: "34")
        case 35:
            CardPlaceholder.image = UIImage(named: "35")
        case 36:
            CardPlaceholder.image = UIImage(named: "36")
        case 37:
            CardPlaceholder.image = UIImage(named: "37")
        case 38:
            CardPlaceholder.image = UIImage(named: "38")
        case 39:
            CardPlaceholder.image = UIImage(named: "39")
        case 40:
            CardPlaceholder.image = UIImage(named: "40")
        case 41:
            CardPlaceholder.image = UIImage(named: "41")
        case 42:
            CardPlaceholder.image = UIImage(named: "42")
        case 43:
            CardPlaceholder.image = UIImage(named: "43")
        case 44:
            CardPlaceholder.image = UIImage(named: "44")
        case 45:
            CardPlaceholder.image = UIImage(named: "45")
        case 46:
            CardPlaceholder.image = UIImage(named: "46")
        case 47:
            CardPlaceholder.image = UIImage(named: "47")
        case 48:
            CardPlaceholder.image = UIImage(named: "48")
        case 49:
            CardPlaceholder.image = UIImage(named: "49")
        case 50:
            CardPlaceholder.image = UIImage(named: "50")
        case 51:
            CardPlaceholder.image = UIImage(named: "51")
        case 52:
            CardPlaceholder.image = UIImage(named: "52")
        case 53:
            CardPlaceholder.image = UIImage(named: "53")
        case 54:
            CardPlaceholder.image = UIImage(named: "54")
        default:
            CardPlaceholder.image = UIImage(named: "0")
        }
        
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
        
        Empezar.setTitle("Carta No°\(index+1)", for: .normal)
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
