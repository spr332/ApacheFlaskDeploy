# ApacheFlaskDeploy
## Usage
``` docker run -p <EXTERNAL_PORT>:80 -v <FLASK_DIR>:/srv spr332/apacheflaskdeploy ```
Just replace <EXTERNAL_PORT> with the port you wish to expose and <FLASK_DIR> with wherever your flask app is (usually I use ${pwd} in powershell). 
## Note
Flask app should be named app.py
This will add a app.wsgi to your project folder or overwrite the current one.