//
//  signUpIn.swift
//  FirebaseAuthentication
//
//  Created by Esat Gözcü on 23.01.2018.
//  Copyright © 2018 Esat Gözcü. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class signUpIn: UIViewController {

    
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        if emailLabel.text != "" && passwordLabel.text != ""{
            
            //Kullanıcı ve şifre boş değil ise..
            //signIn() ile kullanıcıyı kayıt ediyoruz
            Auth.auth().signIn(withEmail: emailLabel.text!, password: passwordLabel.text!, completion: { (user, error) in
                if error != nil {
                    
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
                else{
                    //Herhangi bir hata olmazsa kayıt yapıldı demektir
                    //Segue çalışacak ve diğer sayfaya geçiş yapılacak
                    self.performSegue(withIdentifier: "gecisSegue", sender: nil)
                }
            })
        }
        else{
            //Kullanıcı ve Şifre Boş Bırakılırsa
            //AlertDialog oluşturuyoruz
            let alert = UIAlertController(title: "Dikkat!", message: "Kullanıcı Adı ve Şifre Gerekli", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if emailLabel.text != "" && passwordLabel.text != ""{
            
            //Kullanıcı ve şifre boş değil ise..
            //createUser() ile kullanıcıyı kayıt ediyoruz
            Auth.auth().createUser(withEmail: emailLabel.text!, password: passwordLabel.text!, completion: { (user, error) in
                
                if error != nil{
                    //Sistemsel bir hata olursa AlertDialog oluşturuyoruz
                    //Örneğin şifre 6 haneden azsa Firebase otomatik hatayı bastıracaktır
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
                else{
                    //Eğer kayıt başarılı olursa..
                    let alert = UIAlertController(title: "Success", message: "", preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
                self.emailLabel.text=""
                self.passwordLabel.text=""
            })
        }
        else{
            //Kullanıcı ve Şifre Boş Bırakılırsa
            //AlertDialog oluşturuyoruz
            let alert = UIAlertController(title: "Dikkat!!", message: "Kullanıcı Adı ve Şifre Gerekli", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
