from coneyotl import app

app.config.from_object('configuration.DevelopmentConfig')
app.run(port =8080)