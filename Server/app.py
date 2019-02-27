from flask import Flask, request, render_template
import pickle

app = Flask(__name__)

def DLModel(image):
    # DL model here.
    print("Suchit's DL model ready for the image {}.".format(image))

    # model would return a JSON, dump it in a binary file.
    """
    vehicle_file = open('vehicles.dat', 'wb')
    pickle.dump(JSON, vehicle_file)
    vehicle_file.close()
    """

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/node_routes', methods=['GET', 'POST'])
def bestRoute():
    # Path algorithm here.
    if request.method == 'POST':
        print("Started...")
        src = request.form['source']
        dest = request.form['destination']

        return "Best path from {} to {}.".format(src, dest)

@app.route('/vehicle_total')
def vehicles():
    veh_data_file = open('vehicles.dat', 'rb')
    try:
        while True:
            d = {}
            d = pickle.load(veh_data_file)
    except:
        veh_data_file.close()

    return render_template('vehicle_stats.html', data=d)

if __name__ == '__main__':
    app.run(debug=True)
