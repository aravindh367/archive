//
//  ViewController.swift
//  Demo
//
//  Created by Green on 4/12/15.
//  Copyright (c) 2015 Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        var  a = 5
        var  b = 6
        
        var c = 0
        c = a+b
        
        
        println("Value a is \(a)")
        println("Value b is \(b)")
        println("The Value is \(c)")
        
        var array = ["one","vvvv","Three","Four","5","6"]
        
        println(array[3])
        
        
        var dict = ["1":"One","2":"Two","3":"Three"]
        
         println(dict["4"])
        
//        //3.Iterate through dictionary
//        for(key,value) in dict1
//        {
//            println("key: \(key) value:\(value)")
//        }
//      
        
        var  x = 0;
        
         var  first  = "5"
        
        for var i = 0 ; i<5; i++
        {
            
            if(first == array[i])
            {
                x++;
                
            }
            else
            {
                
            }
        }
        
//        
//        var second = "Swift"
//        
//        
//        if(first  == second)
//        {
//            println("equal")
//        }
//        else
//        {
//            println("non equal")
//
//        }
//
//        let oneString = "Hello"
//        let anotherString = "Hello"
//        
//        if (oneString == anotherString) {
//            println("Strings are equal")
//        }
//            else {
//                println("Strings are not equal")
//        }
        
//        self.fn(5.1 , 66)
//
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //func AddAndSubtractTenFromNumber(number: Int) -> (small: Int, large: Int)
    
//    func fn(a: Float, b: int)->(nt)
//    {
//        
//        println(a)
//        return a
//    }
//    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

