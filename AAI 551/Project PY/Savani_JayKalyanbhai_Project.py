#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import tkinter as tk
from tkinter import messagebox
import random


def GuessingGame():
    
    a=0
    #Max possible number a user enters
    while (a== 0):
        m = input("What max possible number you want to enter?: ")
        
        #Checking if the number is integer
        if m.isdigit():
            m = int(m)
            
            #Checking if the number entered is more than equals to 1
            if m<=1:
                print("Type the number which is more than 1")
                continue
            else:
                a=1
                
        #Validating number      
        else:
            print("Please, Enter Valid Number")
            continue
            
        #User chooses the number 1 to maxnumber
    b=random.randint(1,m)
    
    
    print("Now, Guess the number between 1 and", m ,": ")
    j=0

    while True:
        #User can start guessing the number
        u = input("Guess: ")
        
        #Checking if the input is valid or no
        if u.isdigit():
            u = int(u)
            
            #Checking if the number entered is more than equals to 1
            if u<=0:
                print("Type the number more than equals to 1")
                continue
            else:
                if u == j:
                    j+=1
                    print("Hooray! You guessed the number in ", j ," guesses!")
                    break
                    
                #Checking if the number entered is valid or no 
                elif u > j:
                    j+=1
                    print("Guess is too high")
                else:
                    j+=1
                    print("Guess is too low")

        #Checking if the number is valid or no         
        else:
            print("Please, Type valid number")
            continue

    #User has option to play again or no
    result = messagebox.askyesno(
    title= " Play Exit",
    message= "Do you like to play again?",
    detail = " Click No to quit"
    )
    if not result:
        exit() 

    else:
        GuessingGame()

x = GuessingGame()


# In[ ]:




