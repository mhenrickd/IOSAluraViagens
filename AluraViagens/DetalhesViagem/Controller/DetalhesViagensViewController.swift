//
//  DetalhesViagensViewController.swift
//  AluraViagens
//
//  Created by Matheus Henrick Dias on 27/03/20.
//  Copyright © 2020 Matheus Henrick Dias. All rights reserved.
//

import UIKit

class DetalhesViagensViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    @IBOutlet weak var scrolPrincipal: UIScrollView!
    @IBOutlet weak var textFieldData: UITextField!
    
    var pacoteSelecionado: PacoteViagem? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteSelecionado{
            NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
            
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }

        // Do any additional setup after loading the view.
    }
    
    @objc func aumentarScroll(notification:Notification){
        self.scrolPrincipal.contentSize = CGSize(width: self.scrolPrincipal.frame.width, height: self.scrolPrincipal.frame.height + 320)
    }
    @objc func exibeDataTextField(sender: UIDatePicker){
          let formatador = DateFormatter()
           formatador.dateFormat = "dd MM yyyy"
           self.textFieldData.text = formatador.string(from: sender.date)
       }
    
    @IBAction func textFieldEntrouFoco(_ sender: UITextField) {
         let datePickerView = UIDatePicker()
         datePickerView.datePickerMode = .date
         sender.inputView = datePickerView
         datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
    
}
