#!/usr/bin/env python
# -*-coding:utf-8-*-
# Edited from the original Rock, Paper, Scissors
# Now with Lizard & Spock (per the show The Big Bang Theory)

import time
from time import sleep
import random

sus="-"*35
depo=["rock","paper","scissors","lizard","spock"]
while True:
    x=input("rock , paper, scissors, lizard, spock: ")
    if x not in depo:
        print ("Dont cheat!")
        continue

    pc=random.choice(depo)
    sleep(0.5)
    print (("Computer picked {}.").format(pc))
    if x==pc:
        sleep(0.5)
        print (("\nIt's a draw.\n{}").format(sus))
    elif x=="rock" and pc=="scissors":
        sleep(0.5)
        print (("\nYou win.rock beats scissors\n{}").format(sus))
    elif x=="paper" and pc=="rock":
        sleep(0.5)
        print (("\nYou win.paper beats rock\n{}").format(sus))
    elif x=="scissors" and pc=="paper":
        sleep(0.5)
        print (("\nYou win.scissors beats paper\n{}").format(sus))
    elif x=="spock" and pc=="rock":
        sleep(0.5)
        print (("\nYou win.spock beats rock\n{}").format(sus))
    elif x=="paper" and pc=="spock":
        sleep(0.5)
        print (("\nYou win.paper beats spock\n{}").format(sus))
    elif x=="lizard" and pc=="paper":
        sleep(0.5)
        print (("\nYou win.lizard beats paper\n{}").format(sus))
    elif x=="scissors" and pc=="lizard":
        sleep(0.5)
        print (("\nYou win.scissors beats lizard\n{}").format(sus))
    elif x=="spock" and pc=="scissors":
        sleep(0.5)
        print (("\nYou win.spock beats scissors\n{}").format(sus))
    elif x=="lizard" and pc=="spock":
        sleep(0.5)
        print (("\nYou win.lizard beats spock\n{}").format(sus))
    elif x=="rock" and pc=="lizard":
        sleep(0.5)
        print (("\nYou win.rock beats lizard\n{}").format(sus))
    else:
        sleep(0.5)
        print (("\nYou lose. {} beats {}\n{}").format(pc,x,sus))
input()
