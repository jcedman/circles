//
//  ViewController.swift
//  Circles
//
//  Created by JEFFREY EDMAN on 12/8/16.
//  Copyright © 2016 JEFFREY EDMAN. All rights reserved.
//

import UIKit

    private let reuseIdentifier = "cell"

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var zArray : [Int] = []
    var z : Int = 0
    
    let newLayout = NewCollectionViewLayout()
    
    
    
    @IBAction func unfoldCollection(_ sender: Any) {
        
       beginUnfolding()
    }
    
    func beginUnfolding() {
        //var i : Float = 0
        var angles: [Float] = []
        
        for i in stride(from: 0, to: 3.1, by: 0.01) {
            print(i)
            angles.append(Float(i))
        }
        
        
        
         //while maxAngle <= 3.1416 {
        for angle in angles {
            let oldLayout = newLayout
            
           maxAngle = angle

            self.circleCollectionView!.performBatchUpdates({() -> Void in
                self.circleCollectionView!.reloadData()
              }, completion: {(_ finished: Bool) -> Void in
            })
            
        }
   }

        //
                //self.circleCollectionView.collectionViewLayout.invalidateLayout()
                //self.circleCollectionView.collectionViewLayout = self.newLayout
                  //self.circleCollectionView.collectionViewLayout.prepareForTransition(from: oldLayout)
                //self.circleCollectionView.collectionViewLayout.prepareForTransition(to: self.newLayout)
            
               // self.circleCollectionView.collectionViewLayout.finalizeLayoutTransition()
            
               /*
                self.circleCollectionView.collectionViewLayout.invalidateLayout()
                self.circleCollectionView.collectionViewLayout = self.newLayout
                self.circleCollectionView.collectionViewLayout.prepareForTransition(from: oldLayout)
                self.circleCollectionView.collectionViewLayout.prepareForTransition(to: self.newLayout)
                
                self.circleCollectionView.reloadData()
            
                self.circleCollectionView.collectionViewLayout.finalizeLayoutTransition()
 
                newLayout.invalidateLayout()
                circleCollectionView?.performBatchUpdates({
 
              }) { completion in
                print("newLayout.maxAngle", maxAngle)
                // print("angle per item", self.cvLayout.anglePerItem)
                }
            
        }

    }
    */
    func simplestCompleter(completion: () -> ()) {
       // self.circleCollectionView.collectionView

        //this is where the code that has to finish goes
        print("in simplestCompleter block")
        
        //self.circleCollectionView.collectionViewLayout.invalidateLayout()
        //self.circleCollectionView.startInteractiveTransition(to: self.cvLayout, completion: nil)
       // self.circleCollectionView.setCollectionViewLayout(self.cvLayout, animated: true)
        
        // self.circleCollectionView.finishInteractiveTransition()

        
        
        completion()
    }
    
    
    

    
    
    @IBOutlet weak var circleCollectionView: UICollectionView!
    
    
    var nameArray = ["Dogs", "Cats", "Horses", "Rats", "Birds", "Turtles", "Fish"]
    var colorArray : [UIColor] = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.brown]
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
           // self.circleCollectionView.collectionViewLayout = self.cvLayout
            
            
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false
            
            // Register cell classes
           // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
      
            // Do any additional setup after loading the view.
        }
    
    override func viewDidAppear(_ animated: Bool) {
    }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using [segue destinationViewController].
         // Pass the selected object to the new view controller.
         }
         */
        
        // MARK: UICollectionViewDataSource
        
       func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
        }
    
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
        return nameArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CircleCollectionViewCell
            
            cell.layer.cornerRadius = cell.frame.size.width/2;
            cell.layer.borderWidth = 2.0
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.masksToBounds = true
            cell.layer.backgroundColor = colorArray[indexPath.row].cgColor
            cell.layer.zPosition = CGFloat(nameArray.count - indexPath.row)
            cell.nameLabel.text = nameArray[indexPath.row]
            
            // Configure the cell
            
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CircleCollectionViewCell
        
        print("U clicked: ", nameArray[indexPath.row])
    
    }
        
        // MARK: UICollectionViewDelegate
        
        /*
         // Uncomment this method to specify if the specified item should be highlighted during tracking
         override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
         return true
         }
         */
        
        /*
         // Uncomment this method to specify if the specified item should be selected
         override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
         return true
         }
         */
        
        /*
         // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
         override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
         return false
         }
         
         override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
         return false
         }
         
         override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
         
         }
         */
        
}

