import os
import socket
import webbrowser

connection = socket.socket()
host = socket.gethostname()
port = 8000

connection.connect((host, port))
count = 0
status =key_pass= ""



user_question = input(str("Guess Mode \t[1]\nHack Mode \t[2]\nGo: "))
if user_question == "1":
        user_input=""
        while True:
                user_input=input(str("Type to guess (quit to exit): "))
                if "quit" in user_input.lower():
                    print()
                    status = "HACKED FAILED"
                    print(f"Status: {status}")
                    print(f"Guess count: {count}")
                    break
                else:
                    count += 1
                    try:
                        connection.sendall(user_input.strip().encode("utf-8"))
                        reply = connection.recv(1024).strip().decode()
                    except:
                        print("Error connection in Guess Mode")
                    
                    if "DENIED" in reply:
                        print(f"Guess Count:  {count} X : {user_input}")
                    elif "Congratulations" in reply:
                        print()
                        status ="Hacked Completed"
                        print(status)
                        print(f"Password found: {user_input} \nCount of Attempts: {count}")
                        break
                    if count % 5 == 0:
                        connection.close()
                        try:
                            connection = socket.socket()
                            connection.connect((host, port))
                            _ = connection.recv(1024)
                        except:
                            print("Reconnection error in Guess Mode")
        
                 
else:
        with open("password_list.txt") as password:
            for key_pass in password:
                count += 1
                try:
                    connection.sendall(key_pass.strip().encode("utf-8"))
                    reply = connection.recv(1024).strip().decode()
                except:
                    print("Error connection in Hack Mode")
                
                if "DENIED" in reply:
                    print(f"Line {count} X : {key_pass.strip()}")
                elif "Congratulations" in reply:
                    print()
                    status ="Hacked Completed"
                    print(status)
                    print(f"Password found: {key_pass}Count of Attempts: {count}")
                    break
                if count % 5 == 0:
                    connection.close()
                    try:
                        connection = socket.socket()
                        connection.connect((host, port))
                        _ = connection.recv(1024)
                    except:
                        print("Reconnection error in Hack Mode")
            else:
                print()
                status = "HACKED FAILED"
                print(status)
                print(f"Password found: Unknown \n Count of Attempts: {count}")

   
   
   
   
               
html_template = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://pyscript.net/latest/pyscript.css" />
        <script defer src="https://pyscript.net/latest/pyscript.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Font+Name">
        <title>PYSCRIPT</title>
        <style>
        
    body{
        margin: 0;
        padding: 0;
        font-family: 'Tangerine', serif;
        font-size: 48px;
        text-shadow: 4px 4px 4px #aaa;
        }

    .container{
        position: relative;
        top: 150px;
        margin: auto;
        width: 450px;
        height: 300px;
        border: 1px solid black;
        border-radius: 50px;
        padding: 30px;
    }

    .container  h4{
        text-align: center;
        position: relative;
        top: -60px;
    }

    .contain p{
        margin: 0;
        position: relative;
        top: -90px;
        font-size: 30px;
    }

    .image img{
        position: relative;
        margin-left: 20px;
        width: 300px;
        height: 300px;
        border-radius: 150px;
        top: 150px;
        border: 1px solid black;
    }

    .image{
        margin: auto;
    }
    .main{
        margin: auto;
        display: flex;
    }

    </style>
        
    </head>
    <body>
    <div class="main">
        <div class="container">
            <H4>SERVER</H4>
            <div class="contain">
            <p><label id="status"></label></p>
            <p><label id="port"></label></p>
            <p><label id="guess"></label></p>
            <p><label id="password"></label></p>
                
            </div>
        </div>
 
    """
try: 
    my_pyscript = []
    if "FAILED" in status:
        key_pass = "UNKNOWN"
        anime = "sad"
    else:
        anime = "happy"
    key_pass = key_pass if user_input=="" else user_input
    my_pyscript.append("<py-script>")
    my_pyscript.append("pyscript.write('port', 'Port: {}')".format(port))
    my_pyscript.append("pyscript.write('status','Status: {}')".format(status))
    my_pyscript.append("pyscript.write('guess','Guess: {}')".format(count))
    my_pyscript.append("pyscript.write('password', 'Password: {}')".format(key_pass.strip()))
    my_pyscript.append("</py-script>")
    
    image = f'<img src="./images/{anime}.jpg" ></img>'
    my_pyscript.append('<div class="image">')
    my_pyscript.append(image)
    my_pyscript.append("</div>")
    my_pyscript.append("</div>")
    my_pyscript.append("</body>")
    my_pyscript.append("</html>")
    
    html = open('index.html', 'w')
    for script in my_pyscript:
        html_template += script + "\n"
        
  
    html.write(html_template)
    html.close()
    
    question = input(str('Open in browser? Y/N: '))
    if question.lower() == 'y':        
        filename = 'file:///'+os.getcwd()+'/' + 'index.html'
        webbrowser.open_new_tab(filename)
    else:
        print("exited")     
        
except:
    pass
    



