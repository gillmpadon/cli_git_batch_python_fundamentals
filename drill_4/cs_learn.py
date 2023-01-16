import os

def save_comment(step1,step2,step3,step4,status,filename):
    if os.path.exists(filename):
        stat = 'a' # append if  exists
    else:
        stat = 'w' # if not new file

    pen = open(filename,stat)
    pen.write("\n")
    pen.write("USER: \t\t" + step1 + "\n")
    pen.write("ENCRYPT: \t" + step2 + "\n")
    pen.write("BASE64: \t" + step3 + "\n")
    pen.write("MD5HASH: \t" + step4 + "\n")
    pen.write("Status: \t" + status + "\n")
    pen.write("\n")
    pen.close()