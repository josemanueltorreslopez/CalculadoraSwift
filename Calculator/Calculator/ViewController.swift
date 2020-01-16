//
//  ViewController.swift
//  Calculator
//
//  Created by Antonio y Jose on 10/01/2020.
//  Copyright © 2020 Antonio y Jose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var bt_mc: UIButton!
    @IBOutlet weak var bt_mr: UIButton!
    @IBOutlet weak var bt_mResta: UIButton!
    @IBOutlet weak var bt_mSuma: UIButton!
    @IBOutlet weak var bt_ac: UIButton!
    @IBOutlet weak var bt_division: UIButton!
    @IBOutlet weak var bt_siete: UIButton!
    @IBOutlet weak var bt_ocho: UIButton!
    @IBOutlet weak var bt_nueve: UIButton!
    @IBOutlet weak var bt_multiplicacion: UIButton!
    @IBOutlet weak var bt_cuatro: UIButton!
    @IBOutlet weak var bt_cinco: UIButton!
    @IBOutlet weak var bt_seis: UIButton!
    @IBOutlet weak var bt_resta: UIButton!
    @IBOutlet weak var bt_uno: UIButton!
    @IBOutlet weak var bt_dos: UIButton!
    @IBOutlet weak var bt_tres: UIButton!
    @IBOutlet weak var bt_suma: UIButton!
    @IBOutlet weak var bt_cero: UIButton!
    @IBOutlet weak var bt_decimal: UIButton!
    @IBOutlet weak var bt_igual: UIButton!
    @IBOutlet weak var lb_operacion: UILabel!
    @IBOutlet weak var lb_resultado: UILabel!
    @IBOutlet weak var bt_positivoNegativo: UIButton!
    @IBOutlet weak var bt_c: UIButton!
    @IBOutlet weak var lb_memoria: UILabel!
    @IBOutlet weak var bt_coma: UIButton!
    
    // MARK: Variables
    var signo: Int!
    var comprobacionIgual: Bool!
    var memoria: Double!
    var operacion: Double!
    var resultado: Double!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Inicializaciones
        signo = 0
        comprobacionIgual = false
        memoria = 0
        operacion = 0
        resultado = 0
        
        // Redondear Numeros
        bt_uno.layer.cornerRadius = bt_uno.bounds.height/2
        bt_dos.layer.cornerRadius = bt_dos.bounds.height/2
        bt_tres.layer.cornerRadius = bt_tres.bounds.height/2
        bt_cuatro.layer.cornerRadius = bt_cuatro.bounds.height/2
        bt_cinco.layer.cornerRadius = bt_cinco.bounds.height/2
        bt_seis.layer.cornerRadius = bt_seis.bounds.height/2
        bt_siete.layer.cornerRadius = bt_siete.bounds.height/2
        bt_ocho.layer.cornerRadius = bt_ocho.bounds.height/2
        bt_nueve.layer.cornerRadius = bt_nueve.bounds.height/2
        bt_cero.layer.cornerRadius = bt_cero.bounds.height/2
        bt_coma.layer.cornerRadius = bt_coma.bounds.height/2
        
        // Redondear Operaciones
        bt_suma.layer.cornerRadius = bt_suma.bounds.height/2
        bt_resta.layer.cornerRadius = bt_resta.bounds.height/2
        bt_multiplicacion.layer.cornerRadius = bt_multiplicacion.bounds.height/2
        bt_division.layer.cornerRadius = bt_division.bounds.height/2
        bt_positivoNegativo.layer.cornerRadius = bt_positivoNegativo.bounds.height/2
        bt_igual.layer.cornerRadius = bt_igual.bounds.height/2
        
        // Redondear Memoria
        bt_mc.layer.cornerRadius = bt_mc.bounds.height/2
        bt_mr.layer.cornerRadius = bt_mr.bounds.height/2
        bt_mSuma.layer.cornerRadius = bt_mSuma.bounds.height/2
        bt_mResta.layer.cornerRadius = bt_mResta.bounds.height/2
        
        // Redondear Borrados
        bt_ac.layer.cornerRadius = bt_ac.bounds.height/2
        bt_c.layer.cornerRadius = bt_c.bounds.height/2
        
    }
    
    // Al label de operaciones le metemos el numero que presione
    @IBAction func numeros(_ sender: UIButton) {
        
        // Comprobacion de si el label operacion tiene texto que sea diferente de un numero
        if (lb_operacion.text == "inf" || lb_operacion.text == "nan" || comprobacionIgual) {
            lb_operacion.text = "0"
            // Volvemos a resetear la variable para saber que la operacion igual ya se ha realizado
            comprobacionIgual = false
        }
        
        activarOperaciones()
        
        if (lb_operacion.text == "0") {
            lb_operacion.text = ""
        }
        
        lb_operacion.text! += (String)(sender.tag)
        
    }
    
    // Suma, Resta, Multiplicacion, Divison
    @IBAction func operaciones(_ sender: UIButton) {
        
        operacion = (Double)(lb_operacion.text!)!
        resultado = (Double)(lb_resultado.text!)!
        
        switch signo {
            case 0:
                lb_resultado.text = lb_operacion.text
            case 10:
                resultado += operacion
            case 11:
                resultado -= operacion
            case 12:
                resultado *= operacion
            case 13:
                resultado /= operacion
            default: break
        }
        
        // Si el signo es igual 0 significa que se ha presionado el igual o es la primera operacion
        if (signo != 0) {
            lb_resultado.text = (String)(resultado)
        }
        
        lb_operacion.text = "0"
        
        signo = sender.tag
        desactivarOperaciones() // Desactivamos los botones de operaciones para que no de problemas
        
        // Controlamos que se ha presionado el igual
        if (sender.tag == 14) {
            lb_operacion.text = (String)(resultado)
            lb_resultado.text = "0"
            
            signo = 0
            comprobacionIgual = true
            activarOperaciones()
        }
        
        // Comprobacion de si el label operacion tiene texto que sea diferente de un numero
        if (lb_operacion.text == "inf" || lb_operacion.text == "nan") {
            desactivarOperaciones()
        }
    }
    
    // Multipliacmos por -1 el contenido del label operacion
    @IBAction func inverso(_ sender: Any) {
        // Comprobacion de si el label operacion tiene texto que sea diferente de un numero
        if (lb_operacion.text != "inf" && lb_operacion.text != "nan") {
            operacion = (Double)(lb_operacion.text!)!
            
            operacion *= -1
            lb_operacion.text = (String)(operacion)
        }
        
    }
    // Ponemos a 0 el contenido del label operacion
    @IBAction func borrarOperacion(_ sender: Any) {
        
        operacion = 0
        lb_operacion.text = "0"
        
    }
    
    // Ponemos a cero todas las variables y labels del programa
    @IBAction func borrarTodo(_ sender: Any) {
        
        operacion = 0
        resultado = 0
        memoria = 0
        
        lb_operacion.text = "0"
        lb_resultado.text = "0"
        lb_memoria.text = "0"
    }
    
    // Sumamos el contenido del label operacion a la variable memoria y a su label
    @IBAction func sumarMemoria(_ sender: Any) {
        
        operacion = (Double)(lb_operacion.text!)!
        memoria += operacion
        lb_memoria.text = (String)(memoria)
        
        // Comprobacion de si el label operacion tiene texto que sea diferente de un numero
        if (lb_operacion.text == "inf" || lb_operacion.text == "nan") {
            memoria = 0
            lb_memoria.text = "0"
        }
    }
    
    // Restamos el contenido del label operacion a la variable memoria y a su label
    @IBAction func memoriaResta(_ sender: Any) {
        
        operacion = (Double)(lb_operacion.text!)!
        memoria -= operacion
        lb_memoria.text = (String)(memoria)
        
        // Comprobacion de si el label operacion tiene texto que sea diferente de un numero
        if (lb_operacion.text == "inf" || lb_operacion.text == "nan") {
            memoria = 0
            lb_memoria.text = "0"
        }
    }
    
    // Ponemos la variable y el label de memoria a cero
    @IBAction func borrarMemoria(_ sender: Any) {
        
        memoria = 0
        lb_memoria.text = "0"
    }
    
    // Pone el contenido de la variable memoria en el label de operacion y lo igualamos en nuestra variable operacion
    @IBAction func cargarMemoria(_ sender: Any) {
        
        operacion = memoria
        lb_operacion.text = (String)(operacion)
    }
    
    // Añadimos un punto al label operacion para realizar operaciones con decimales
    @IBAction func decimal(_ sender: Any) {
        
        // Comprobacion de si el label operacion tiene texto que sea diferente de un numero
        if (lb_operacion.text != "inf" && lb_operacion.text != "nan") {
            // Comprobamos si ya contiene un punto el label operacion
            if(lb_operacion.text?.contains(".") == false){
                lb_operacion.text! += (String)(".")
                
            }
        }
    }
    
    // Desactivamos los botones de operacion
    func desactivarOperaciones (){
        
        bt_suma.isEnabled = false
        bt_resta.isEnabled = false
        bt_multiplicacion.isEnabled = false
        bt_division.isEnabled = false
        bt_igual.isEnabled = false
    }
    
    // Activamos los botones de operacion
    func activarOperaciones (){
        
        bt_suma.isEnabled = true
        bt_resta.isEnabled = true
        bt_multiplicacion.isEnabled = true
        bt_division.isEnabled = true
        bt_igual.isEnabled = true
    }
    
}
