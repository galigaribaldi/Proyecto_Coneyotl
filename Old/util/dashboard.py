import dash
import dash_table
import dash_core_components as dcc
import dash_html_components as html
import dash_bootstrap_components as dbc
import plotly.graph_objs as go
import numpy as np
import pandas as pd
import util.model_dash as coneccion
app = dash.Dash(external_stylesheets=[dbc.themes.BOOTSTRAP])
###
data = coneccion.traer_calificaciones_materias_Bimestral(1106, 'B1')
data2 = coneccion.traer_calificaciones_materias_Bimestral(1106, 'B2')
data3 = coneccion.traer_calificaciones_materias_Bimestral(1106, 'B3')
data4 = coneccion.traer_calificaciones_materias_Bimestral(1106, 'B4')
###Cada 6 campos es una nueva calificacion
for i in data:
      print(i)
###
df1 = pd.DataFrame(
    {
        "Nombre De la materia": [data[0][1],data[1][1],data[2][1],data[3][1],data[4][1],data[5][1],data[6][1],data[7][1],data[8][1]],
        "Calificación Bimestral ": [data[0][6],data[1][6],data[2][6],data[3][6],data[4][6],data[5][6],data[6][6],data[7][6],data[8][6]],
    }
)
df2 = pd.DataFrame(
    {
        "Nombre De la materia": [data2[0][1],data2[1][1],data2[2][1],data2[3][1],data2[4][1],data2[5][1],data2[6][1],data2[7][1],data2[8][1]],
        "Calificación Bimestral ": [data2[0][6],data2[1][6],data2[2][6],data2[3][6],data2[4][6],data2[5][6],data2[6][6],data2[7][6],data2[8][6]],
    }
)
df3 = pd.DataFrame(
    {
        "Nombre De la materia": [data3[0][1],data3[1][1],data3[2][1],data3[3][1],data3[4][1],data3[5][1],data3[6][1],data3[7][1],data3[8][1]],
        "Calificación Bimestral ": [data3[0][6],data3[1][6],data3[2][6],data3[3][6],data3[4][6],data3[5][6],data3[6][6],data3[7][6],data3[8][6]],
    }
)
df4 = pd.DataFrame(
    {
        "Nombre De la materia": [data4[0][1],data4[1][1],data4[2][1],data4[3][1],data4[4][1],data4[5][1],data4[6][1],data4[7][1],data4[8][1]],
        "Calificación Bimestral ": [data4[0][6],data4[1][6],data4[2][6],data4[3][6],data4[4][6],data4[5][6],data4[6][6],data4[7][6],data4[8][6]],
    }
)
#print(data)
np.random.seed(50)
x_rand = np.random.randint(1,61,60)
y_rand = np.random.randint(1,61,60)
###
colors = {
  'blanco' : '#fffff',
  'text' : '##fffff',
  'plot_color': '#D3D3D3',
  'paper_color' : '#00FFFF'
}
app.layout = html.Div([
  html.H1( children =   'Calificaciones de: '+str(data[0][0]),
          style = {
            'textAlign': 'center',
            'color': colors['text']}
          ),
  html.Div( children = 'Dash a data with piploty',
   style ={
     'textAlign': 'center',
     'color' : colors['text']}
  ),
  html.Label('Elegir'),
  dcc.Dropdown(
    id = 'first-dropdown',
    options = [
      {'label' : 'San Francisco', 'value' : 'SF'},
      {'label' : 'New York City', 'value' : 'NYC'},
      {'label' : 'Raleigh Durham', 'value' : 'PDU'}
    ],
    placeholder='Select'
    #value = 'NYC'
    #multi=True 
  ),
  dcc.Graph(
    id = "SampleChart",
    figure={
      'data': [
        {'x': [data[0][1]], 'y': [data[0][6]], "type": "bar", "name": data[0][1]},
        {'x': [data[1][1]], 'y': [data[1][6]], "type": "bar", "name": data[1][1]},
        {'x': [data[2][1]], 'y': [data[2][6]], "type": "bar", "name": data[2][1]},
        {'x': [data[3][1]], 'y': [data[3][6]], "type": "bar", "name": data[3][1]},
        {'x': [data[4][1]], 'y': [data[4][6]], "type": "bar", "name": data[4][1]},
        {'x': [data[5][1]], 'y': [data[5][6]], "type": "bar", "name": data[5][1]},
        {'x': [data[6][1]], 'y': [data[6][6]], "type": "bar", "name": data[6][1]},
        {'x': [data[7][1]], 'y': [data[7][6]], "type": "bar", "name": data[7][1]},
        {'x': [data[8][1]], 'y': [data[8][6]], "type": "bar", "name": data[8][1]},
        {'x': [data[9][1]], 'y': [data[9][6]], "type": "bar", "name": data[9][1]}
        ],
      'layout': {
        'paper_bgcolor': colors['blanco'],
        'font' : {
          'color' : colors['text']
        },
        'title' : 'Bimestre 1'}
    }
  ),
  dbc.Container(
    dbc.Table.from_dataframe(df1, striped=True, bordered=True, hover=True)),
    dcc.Graph(
    id = "SampleChart2",
    figure={
      'data': [
        {'x': [data2[0][1]], 'y': [data2[0][6]], "type": "bar", "name": data2[0][1]},
        {'x': [data2[1][1]], 'y': [data2[1][6]], "type": "bar", "name": data2[1][1]},
        {'x': [data2[2][1]], 'y': [data2[2][6]], "type": "bar", "name": data2[2][1]},
        {'x': [data2[3][1]], 'y': [data2[3][6]], "type": "bar", "name": data2[3][1]},
        {'x': [data2[4][1]], 'y': [data2[4][6]], "type": "bar", "name": data2[4][1]},
        {'x': [data2[5][1]], 'y': [data2[5][6]], "type": "bar", "name": data2[5][1]},
        {'x': [data2[6][1]], 'y': [data2[6][6]], "type": "bar", "name": data2[6][1]},
        {'x': [data2[7][1]], 'y': [data2[7][6]], "type": "bar", "name": data2[7][1]},
        {'x': [data2[8][1]], 'y': [data2[8][6]], "type": "bar", "name": data2[8][1]},
        {'x': [data2[9][1]], 'y': [data2[9][6]], "type": "bar", "name": data2[9][1]}
        ],
      'layout': {
        'paper_bgcolor': colors['blanco'],
        'font' : {
          'color' : colors['text']
        },
        'title' : 'Bimestre 2'}
    }
  ),
  dbc.Container(
    dbc.Table.from_dataframe(df2, striped=True, bordered=True, hover=True)),
  dcc.Graph(
    id = "SampleChart3",
    figure={
      'data': [
        {'x': [data3[0][1]], 'y': [data3[0][6]], "type": "bar", "name": data3[0][1]},
        {'x': [data3[1][1]], 'y': [data3[1][6]], "type": "bar", "name": data3[1][1]},
        {'x': [data3[2][1]], 'y': [data3[2][6]], "type": "bar", "name": data3[2][1]},
        {'x': [data3[3][1]], 'y': [data3[3][6]], "type": "bar", "name": data3[3][1]},
        {'x': [data3[4][1]], 'y': [data3[4][6]], "type": "bar", "name": data3[4][1]},
        {'x': [data3[5][1]], 'y': [data3[5][6]], "type": "bar", "name": data3[5][1]},
        {'x': [data3[6][1]], 'y': [data3[6][6]], "type": "bar", "name": data3[6][1]},
        {'x': [data3[7][1]], 'y': [data3[7][6]], "type": "bar", "name": data3[7][1]},
        {'x': [data3[8][1]], 'y': [data3[8][6]], "type": "bar", "name": data3[8][1]},
        {'x': [data3[9][1]], 'y': [data3[9][6]], "type": "bar", "name": data3[9][1]}
        ],
      'layout': {
        'paper_bgcolor': colors['blanco'],
        'font' : {
          'color' : colors['text']
        },
        'title' : 'Bimestre 3'}
    }
  ),
  dbc.Container(
    dbc.Table.from_dataframe(df3, striped=True, bordered=True, hover=True)),
  dcc.Graph(
    id = "SampleChart4",
    figure={
      'data': [
        {'x': [data4[0][1]], 'y': [data4[0][6]], "type": "bar", "name": data4[0][1]},
        {'x': [data4[1][1]], 'y': [data4[1][6]], "type": "bar", "name": data4[1][1]},
        {'x': [data4[2][1]], 'y': [data4[2][6]], "type": "bar", "name": data4[2][1]},
        {'x': [data4[3][1]], 'y': [data4[3][6]], "type": "bar", "name": data4[3][1]},
        {'x': [data4[4][1]], 'y': [data4[4][6]], "type": "bar", "name": data4[4][1]},
        {'x': [data4[5][1]], 'y': [data4[5][6]], "type": "bar", "name": data4[5][1]},
        {'x': [data4[6][1]], 'y': [data4[6][6]], "type": "bar", "name": data4[6][1]},
        {'x': [data4[7][1]], 'y': [data4[7][6]], "type": "bar", "name": data4[7][1]},
        {'x': [data4[8][1]], 'y': [data4[8][6]], "type": "bar", "name": data4[8][1]},
        {'x': [data4[9][1]], 'y': [data4[9][6]], "type": "bar", "name": data4[9][1]}
        ],
      'layout': {
        'paper_bgcolor': colors['blanco'],
        'font' : {
          'color' : colors['text']
        },
        'title' : 'Bimestre 4'}
    }
  ),
  dbc.Container(
    dbc.Table.from_dataframe(df4, striped=True, bordered=True, hover=True))
])

if __name__ == '__main__':
    app.run_server(debug=True)