import base64
import hashlib

import requests


def get_request(hash,base):
    url = 'https://csprojects.pythonanywhere.com/secret/'+hash+'/'+base
    view = 'https://csprojects.pythonanywhere.com/conferences/6'
    x=requests.get(url)
    if x.status_code==200:
        print("Successful Request: "+ str(x.status_code) + " OK")
        print("Successful Comment")
        print("Click to view your comment: "+view)
        print("Your request is automatically added")
        print("You can copy or click this link if you want to add more comment: " + url)
        return "Successful Comment"

#STEP 2
def encrypt(text, s):
    add = ""
    for i in range(len(text)):
        letter = text[i]
        if letter.isupper():
            add += chr((ord(letter) + s - 65) % 26 + 65)
        elif letter.islower():
    	    add += chr((ord(letter) + s - 97) % 26 + 97)
        else:
            add +=letter
    return add

#STEP 3
def cipher_to_base64(encrypted):
    value = encrypted.encode("ascii")
    converted_base64 = base64.b64encode(value)
    converted_base64 = converted_base64.decode("ascii")
    return  converted_base64

#STEP 4
def base64_to_md5_hash(base):
    hash = hashlib.md5(base.encode())
    hash = hash.hexdigest()
    return hash