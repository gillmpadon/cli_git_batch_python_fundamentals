from lib import encrypt, cipher_to_base64, base64_to_md5_hash, get_request
from cs_learn import save_comment
import json

#STEP 1
names = input(str("Enter name: "))
emails = input(str("Enter email: "))
comments = input(str("Enter comment: "))
user_json = json.dumps({ "name":names, "email":emails, "comment":comments})

#STEP 2
shift =13
cipher_json = json.dumps({ "name":encrypt(names,shift), "email":encrypt(emails,shift), "comment":encrypt(comments,shift)})

#STEP 3
base64_values= cipher_to_base64(cipher_json)

#STEP 4
md5hash_values = base64_to_md5_hash(base64_values)

print("User Json: \t",user_json)
print("Encrypt: \t",cipher_json)
print("BASE64: \t",base64_values)
print("MD5_HASH: \t",md5hash_values)
print("")

#STEP 5
status = get_request(md5hash_values,base64_values)

#ADDITONAL
filename = 'our_comments.txt'
save_comment(user_json,cipher_json,base64_values,md5hash_values,status,filename)
