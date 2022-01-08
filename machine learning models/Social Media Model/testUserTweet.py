# -*- coding: utf-8 -*-
"""
Created on Wed Oct 13 13:53:03 2021

@author: ASUS
"""

#from tweepy.streaming import StreamListener
#from tweepy import OAuthHandler
#from tweepy import Stream

#import json
#import pandas as pd
#import time
#import numpy as np
#import itertools
#import matplotlib.pyplot as plt 
#from sklearn.metrics import confusion_matrix
#from sklearn.feature_extraction.text import CountVectorizer
#from sklearn import metrics
#from sklearn.metrics import roc_auc_score

import tweepy
#import twitter


name = input("Enter Twitter Name: ")


api_key = "Hcnw4QK1QzlguQz9P9wQ04SsP" 
api_secret = "BvlvUrqhjBIrs20Ask1YQbVMqdiwhbNgtQUYUkW8pCpBDLfE1c" 
access_token = "1304803166546997249-zDBHr1WJLgALMtTvjRuYTcqYigRK7d" 
access_token_secret = "z58fTzpBU9TZ85qEz6VeKyUgGN708zqBccxT37JzmehrR" 

def getAPI(api_key,api_secret,access_token,access_token_secret):
    
    auth = tweepy.OAuthHandler(api_key, api_secret) 
    auth.set_access_token(access_token, access_token_secret) 
    api = tweepy.API(auth) 
    return api

def NumberOfFollowers(account_name,api): 
    try:
        user = api.get_user(account_name)
        print(user.name, user.followers_count)
    except tweepy.error.TweepError:
            print("User not found")  
            
            
            
def NumberOfTweets(account_name,api):
    try:
        user = api.get_user(account_name) 
        statuses_count = user.statuses_count
        print("Number of tweets the user posted  : >>  " + str(statuses_count)) 
    except tweepy.error.TweepError:
        print("User not found")
        
            
def get_tweets(account_name,api): 
    try:
        number_of_tweets = NumberOfTweets(account_name,api)
        tweets = api.user_timeline(screen_name=account_name) 
        tweetlist=[] 

        posted_tweets = [twee.text for twee in tweets]
        for gettweet in posted_tweets: 

            tweetlist.append(gettweet) 

        for showtweet in tweetlist[:number_of_tweets]:
            print()
            print(showtweet)
    except tweepy.error.TweepError:
        print("User not found")

account_name = name
api  = getAPI(api_key,api_secret,access_token,access_token_secret)   
get_tweets(account_name,api)











