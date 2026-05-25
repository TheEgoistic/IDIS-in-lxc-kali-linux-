from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template("index.html")

@app.route('/product')
def product():
    return render_template("product.html")

@app.route('/login', methods=['GET','POST'])
def login():
    if request.method == 'POST':
        user = request.form.get('username')
        return f"<h2>Welcome {user}</h2><a href='/'>Go back</a>"
    return render_template("login.html")

app.run(host="0.0.0.0", port=80)

